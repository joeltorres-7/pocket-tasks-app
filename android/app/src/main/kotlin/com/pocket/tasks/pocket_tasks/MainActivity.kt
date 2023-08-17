package com.pocket.tasks.pocket_tasks

import SplashView
import android.window.SplashScreen
import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {
    override fun provideSplashScreen(): io.flutter.embedding.android.SplashScreen? = SplashView()
}
