package cn.dong.cisample;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v7.app.AppCompatActivity;

import com.google.gson.Gson;

/**
 * @author dong on 2017/10/21.
 */
public class JavaActivity extends AppCompatActivity {

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        Gson gson = Utils.getGson();

        // Error: NewApi
        getDrawable(R.drawable.ic_launcher_background);
    }
}
