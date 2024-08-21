package com.cookiemanager

import android.webkit.CookieManager
import com.facebook.react.bridge.*

class CookieManagerModule(reactContext: ReactApplicationContext) : ReactContextBaseJavaModule(reactContext) {

    override fun getName() = NAME

    @ReactMethod
    fun getHttpOnlyCookies(url: String, promise: Promise) {
        val cookieManager = CookieManager.getInstance()
        val cookieString = cookieManager.getCookie(url)
        
        if (cookieString != null) {
            val cookies = cookieString.split(";")
            val cookieList = mutableListOf<WritableMap>()
            
            for (cookie in cookies) {
                val parts = cookie.trim().split("=", limit = 2)
                if (parts.size == 2) {
                    val cookieMap = Arguments.createMap()
                    cookieMap.putString("name", parts[0])
                    cookieMap.putString("value", parts[1])
                    cookieMap.putString("domain", url)
                    cookieMap.putString("path", "/")
                    cookieList.add(cookieMap)
                }
            }
            
            promise.resolve(Arguments.makeNativeArray(cookieList))
        } else {
            promise.resolve(null)
        }
    }

    companion object {
        const val NAME = "RTNCookieManager"
    }
}

