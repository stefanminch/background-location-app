module.exports = {
  enable: function(successCallback, errorCallback) {
    cordova.exec(successCallback,
      errorCallback,
      "BackgroundProcess",
      "enable",
      []);
  }
};