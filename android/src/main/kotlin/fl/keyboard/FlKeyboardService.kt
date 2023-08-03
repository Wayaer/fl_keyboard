package fl.keyboard

import android.inputmethodservice.InputMethodService
import android.util.Log
import android.view.View
import io.flutter.FlutterInjector
import io.flutter.embedding.android.FlutterView
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.embedding.engine.FlutterEngineGroup
import io.flutter.embedding.engine.dart.DartExecutor.DartEntrypoint


class FlKeyboardService : InputMethodService() {
    private val mainName = "flKeyboardMain"
    private lateinit var flKeyboardEngine: FlutterEngine
    private lateinit var flutterView: FlutterView


    override fun onCreate() {
        super.onCreate()
        flutterView = FlutterView(applicationContext)
        val engineGroup = FlutterEngineGroup(applicationContext)/*topMain 是跳转Flutter 执行的方法*/
        val dartEntrypoint = DartEntrypoint(
            FlutterInjector.instance().flutterLoader().findAppBundlePath(), mainName
        )
        flKeyboardEngine = engineGroup.createAndRunEngine(applicationContext, dartEntrypoint)
        flutterView.attachToFlutterEngine(flKeyboardEngine)
        FlutterEngineCache.getInstance().put(mainName, flKeyboardEngine)
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
        flKeyboardEngine.destroy()
    }

    override fun onFinishInput() {
        super.onFinishInput()
    }

}