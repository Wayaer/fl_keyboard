package fl.keyboard

import android.app.Service
import android.inputmethodservice.InputMethodService
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.view.WindowManager
import android.widget.FrameLayout
import io.flutter.FlutterInjector
import io.flutter.embedding.android.FlutterView
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.embedding.engine.FlutterEngineGroup
import io.flutter.embedding.engine.dart.DartExecutor.DartEntrypoint


class FlKeyboardService : InputMethodService() {
    private val mainName = "flKeyboardMain"
    private var engine: FlutterEngine? = null
    private lateinit var flutterView: FlutterView
    private lateinit var container: FrameLayout
    override fun onCreate() {
        super.onCreate()
        val inflater = getSystemService(Service.LAYOUT_INFLATER_SERVICE) as LayoutInflater
        val context = inflater.context
        container = FrameLayout(this)
        flutterView = FlutterView(context)
        Log.d("onCreate==", "onCreate")
        if (engine == null) {
            val engineGroup = FlutterEngineGroup(application)
            val dartEntrypoint = DartEntrypoint(
                FlutterInjector.instance().flutterLoader().findAppBundlePath(), mainName
            )
            engine = engineGroup.createAndRunEngine(application, dartEntrypoint)
            FlutterEngineCache.getInstance().put(mainName, engine)

            engine!!.platformViewsController.attach(
                context, engine!!.renderer, engine!!.dartExecutor
            )
            flutterView.attachToFlutterEngine(engine!!)
            val displayMetrics = resources.displayMetrics
            val height = displayMetrics.heightPixels
            container.addView(
                flutterView, FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, (height * 0.3).toInt()
                )
            )
            engine!!.lifecycleChannel.appIsResumed()
        }
    }


    override fun onCreateInputView(): View {
        Log.d("onCreateInputView==", "onCreateInputView")
        return container
    }

    override fun onWindowHidden() {
        super.onWindowHidden()
        Log.d("onWindowHidden==", "onWindowHidden")
    }

    override fun onWindowShown() {
        super.onWindowShown()
        Log.d("onWindowShown==", "onWindowShown")
    }

    override fun onDestroy() {
        super.onDestroy()
        Log.d("FlKeyboardService===", "onDestroy")
        flutterView.detachFromFlutterEngine()
        engine?.let {
            FlutterEngineCache.getInstance().remove(mainName)
            it.destroy()
        }
        engine = null
    }

    override fun onFinishInput() {
        super.onFinishInput()
        Log.d("onFinishInput==", "onFinishInput")
    }

}