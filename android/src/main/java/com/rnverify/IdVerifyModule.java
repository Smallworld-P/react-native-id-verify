// IdVerifyModule.java

package com.rnverify;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.Callback;

//import com.alipay.mobile.android.verify.sdk.ServiceFactory;

public class IdVerifyModule extends ReactContextBaseJavaModule {

    private final ReactApplicationContext reactContext;
    private String certifyId;
    private String bizCode;
    private boolean waitForResult = false;

    public IdVerifyModule(ReactApplicationContext reactContext) {
        super(reactContext);
        this.reactContext = reactContext;
    }

    @Override
    public String getName() {
        return "IdVerify";
    }

    @ReactMethod
    public void sampleMethod(String stringArgument, int numberArgument, Callback callback) {
        // TODO: Implement some actually useful functionality
        callback.invoke("Received numberArgument: " + numberArgument + " stringArgument: " + stringArgument);
    }

    private void getBizCode() {
//        ServiceFactory.build().getBizCode(MainActivity.this)
    }

}
