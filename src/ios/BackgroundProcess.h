#import <Cordova/CDV.h>

@interface BackgroundProcess : CDVPlugin <UIAlertViewDelegate> {}
- (void)enable:(CDVInvokedUrlCommand*)command;
@end

@interface MyAlertView : UIAlertView {}
@property (nonatomic, copy) NSString* callbackId;
@end