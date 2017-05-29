#import <Cordova/CDV.h>

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface BackgroundProcess : CDVPlugin <UIAlertViewDelegate> {}
- (void)enable:(CDVInvokedUrlCommand*)command;
@end
