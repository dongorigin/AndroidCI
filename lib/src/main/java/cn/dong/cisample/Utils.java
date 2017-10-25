package cn.dong.cisample;

import com.google.gson.Gson;

/**
 * @author dong on 2017/10/23.
 */
public class Utils {

    public static String toJson(Object src) {
        return new Gson().toJson(src);
    }

    public static Gson getGson() {
        return new Gson();
    }
}
