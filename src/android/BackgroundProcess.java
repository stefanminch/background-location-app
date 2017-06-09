package com.luckydrive.background.process;

import android.view.WindowManager;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;
import org.json.JSONArray;
import org.json.JSONException;

public class BackgroundProcess extends CordovaPlugin
{
  protected void pluginInitialize() {
  }

  public boolean execute(String action, JSONArray args, CallbackContext callbackContext)
          throws JSONException {
    if (action.equals("enableLocationInBackground")) {
      enableLocationInBackground(callbackContext);
      return true;
    }
    if (action.equals("disableDeviceStandby")) {
      disableDeviceStandby(callbackContext);
      return true;
    }
    if (action.equals("enableDeviceStandby")) {
      enableDeviceStandby(callbackContext);
      return true;
    }
    return false;
  }

  private synchronized void enableLocationInBackground(final CallbackContext callbackContext) {
  }

  private synchronized void disableDeviceStandby(final CallbackContext callbackContext) {
    cordova.getActivity().runOnUiThread(new Runnable()
    {
      @Override
      public void run() {
        cordova.getActivity().getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
      }
    });
  }

  private synchronized void enableDeviceStandby(final CallbackContext callbackContext) {
    cordova.getActivity().runOnUiThread(new Runnable()
    {
      @Override
      public void run() {
        cordova.getActivity().getWindow().clearFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
      }
    });
  }

}