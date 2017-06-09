module.exports = {
	enableLocationInBackground: function(successCallback, errorCallback) {
		cordova.exec(successCallback,
			errorCallback,
			"BackgroundProcess",
			"enableLocationInBackground",
			[]);
	},
	enableDeviceStandby: function(successCallback, errorCallback) {
		cordova.exec(successCallback,
			errorCallback,
			"BackgroundProcess",
			"enableDeviceStandby",
			[]);
	},
	disableDeviceStandby: function(successCallback, errorCallback) {
		cordova.exec(successCallback,
			errorCallback,
			"BackgroundProcess",
			"disableDeviceStandby",
			[]);
	}
};