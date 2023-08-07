package fl.keyboard

import android.inputmethodservice.InputMethodService
import android.util.Log
import android.view.View
import android.view.ViewGroup
import android.widget.FrameLayout
import io.flutter.FlutterInjector
import io.flutter.embedding.android.FlutterView
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.embedding.engine.FlutterEngineGroup
import io.flutter.embedding.engine.dart.DartExecutor.DartEntrypoint
import java.lang.reflect.Field


class FlKeyboardService : InputMethodService() {
    private val mainName = "flKeyboardMain"
    private var flKeyboardEngine: FlutterEngine? = null
    private lateinit var flutterView: FlutterView
    private lateinit var container: FrameLayout


    override fun onCreate() {
        super.onCreate()
        if (flKeyboardEngine == null) {
            val flutterView = FlutterView(applicationContext)
            val engineGroup = FlutterEngineGroup(applicationContext)
            val dartEntrypoint = DartEntrypoint(
                FlutterInjector.instance().flutterLoader().findAppBundlePath(), mainName
            )
            flKeyboardEngine = engineGroup.createAndRunEngine(applicationContext, dartEntrypoint)

            flutterView.attachToFlutterEngine(flKeyboardEngine!!)
            FlutterEngineCache.getInstance().put(mainName, flKeyboardEngine)
//            FlutterEngineCache.getInstance().cachedEngines
            val clazz = FlutterEngineCache::class.java
            val field: Field = clazz.getDeclaredField("cachedEngines")
            field.isAccessible = true
            val value = field.get(FlutterEngineCache.getInstance())
            val displayMetrics = resources.displayMetrics
            val height = displayMetrics.heightPixels
            container = FrameLayout(this)
            container.addView(
                flutterView, FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, (height * 0.3).toInt()
                )
            )
        }
    }

    override fun onCreateInputView(): View {
        return container
    }

    override fun onWindowHidden() {
        super.onWindowHidden()

    }

    override fun onWindowShown() {
        super.onWindowShown()
    }

    override fun onDestroy() {
        super.onDestroy()
        Log.d("FlKeyboardService===", "onDestroy")
        flutterView.detachFromFlutterEngine()
        flKeyboardEngine?.destroy()
        flKeyboardEngine = null
    }

    override fun onFinishInput() {
        super.onFinishInput()
    }

}