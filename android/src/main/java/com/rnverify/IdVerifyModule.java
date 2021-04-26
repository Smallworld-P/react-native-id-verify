// IdVerifyModule.java

package com.rnverify;

import android.app.Activity;
import android.telecom.Call;
import android.widget.Toast;

import com.alipay.mobile.android.verify.sdk.interfaces.ICallback;
import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.Callback;

import com.alipay.mobile.android.verify.sdk.ServiceFactory;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

import java.util.Map;

public class IdVerifyModule extends ReactContextBaseJavaModule {

    private final ReactApplicationContext reactContext;

    public IdVerifyModule(ReactApplicationContext reactContext) {
        super(reactContext);
        this.reactContext = reactContext;

    }

    @Override
    public String getName() {
        return "RNIdVerify";
    }

    @ReactMethod
    private void getBizCode(Promise promise) {
        promise.resolve(ServiceFactory.build().getBizCode(reactContext));
    }


    @ReactMethod
    public void startVerify(String bizCode, String certifyId, String url, Promise promise) {
        // 封装认证数据
        JSONObject requestInfo = new JSONObject();
        requestInfo.put("url", url);
        requestInfo.put("certifyId", certifyId);
        requestInfo.put("bizCode", bizCode);

        final Promise pro = promise;
        // 发起认证
        ServiceFactory.build().startService(reactContext.getCurrentActivity(), requestInfo, new ICallback() {
            @Override
            public void onResponse(Map<String, String> response) {
                pro.resolve(response);
            }
        });
    }

}
