#import <Cordova/CDV.h>

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface BackgroundProcess : CDVPlugin {}

- (void)enableLocationInBackground:(CDVInvokedUrlCommand*)command;
- (void)disableDeviceStandby:(CDVInvokedUrlCommand*)command;
- (void)enableDeviceStandby:(CDVInvokedUrlCommand*)command;

@end
