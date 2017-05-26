package com.luckydrive.background.process;

import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.content.DialogInterface;
import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaInterface;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CordovaWebView;
import org.apache.cordova.PluginResult;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class BackgroundProcess extends CordovaPlugin {
  protected void pluginInitialize() {
  }

  public boolean execute(String action, JSONArray args, CallbackContext callbackContext) 
      throws JSONException {
    if (action.equals("enable")) {
      enable(callbackContext);
      return true;
    }
    return false;
  }

  private synchronized void enable(final CallbackContext callbackContext) {
    new AlertDialog.Builder(cordova.getActivity())
    .setTitle("Android title")
    .setMessage("Android message")
    .setCancelable(false)
    .setNeutralButton("Android button label", new AlertDialog.OnClickListener() {
      public void onClick(DialogInterface dialogInterface, int which) {
        dialogInterface.dismiss();
        callbackContext.sendPluginResult(new PluginResult(PluginResult.Status.OK, 0));
      }
    })
    .create()
    .show();
  }
}