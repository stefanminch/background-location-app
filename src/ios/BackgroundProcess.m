#import "BackgroundProcess.h"

@implementation BackgroundProcess
- (void)pluginInitialize
{
}

- (void)enable:(CDVInvokedUrlCommand*)command
{
  NSString* callbackId = command.callbackId;
  NSString* title = @"iOS title";
  NSString* message = @"iOS message";
  NSString* button = @"iOS button";

  MyAlertView *alert = [[MyAlertView alloc]
                        initWithTitle:title
                        message:message
                        delegate:self
                        cancelButtonTitle:button
                        otherButtonTitles:nil];
                        alert.callbackId = callbackId;
  [alert show];
}

- (void)alertView:(UIAlertView*)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
  MyAlertView* myAlertView = (MyAlertView*)alertView;
  CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK 
                             messageAsInt:0];
  [self.commandDelegate sendPluginResult:result callbackId:myAlertView.callbackId];
}
@end

@implementation MyAlertView
@synthesize callbackId;
@end