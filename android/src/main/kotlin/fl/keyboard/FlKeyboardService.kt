package fl.keyboard

import android.inputmethodservice.InputMethodService
import android.util.Log
import android.view.View
import android.view.ViewGroup
import android.widget.LinearLayout
import io.flutter.FlutterInjector
import io.flutter.embedding.android.FlutterView
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.embedding.engine.FlutterEngineGroup
import io.flutter.embedding.engine.dart.DartExecutor.DartEntrypoint


class FlKeyboardService : InputMethodService() {
    private val mainName = "flKeyboardMain"
    private var flKeyboardEngine: FlutterEngine? = null
    private lateinit var flutterView: FlutterView


    override fun onCreate() {
        super.onCreate()
        if (flKeyboardEngine == null) {
            flutterView = FlutterView(applicationContext)
            val engineGroup = FlutterEngineGroup(applicationContext)
            val dartEntrypoint = DartEntrypoint(
                FlutterInjector.instance().flutterLoader().findAppBundlePath(), mainName
            )
            flKeyboardEngine = engineGroup.createAndRunEngine(applicationContext, dartEntrypoint)
            flutterView.attachToFlutterEngine(flKeyboardEngine!!)
            val displayMetrics = resources.displayMetrics
            val width = displayMetrics.widthPixels
            val height = displayMetrics.heightPixels
            Log.d("FlKeyboardService===", flutterView.height.toString())
            FlutterEngineCache.getInstance().put(mainName, flKeyboardEngine)
        }
        Log.d("FlKeyboardService===", "onCreate")
    }

    override fun onCreateInputView(): View {
        return flutterView
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