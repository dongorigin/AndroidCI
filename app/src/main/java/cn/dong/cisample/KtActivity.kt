package cn.dong.cisample

import android.os.Bundle
import android.support.v7.app.AppCompatActivity

class KtActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        // Error: NewApi
        getDrawable(R.drawable.ic_launcher_background)
    }
}
