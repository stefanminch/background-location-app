#import "BackgroundProcess.h"

#import <objc/runtime.h>


@implementation CLLocationManager (InBackground)

-(void) startUpdatingLocationCustomSwizzle
{
	if([self respondsToSelector:@selector(setAllowsBackgroundLocationUpdates:)]) {
		//iOS9
        [self setAllowsBackgroundLocationUpdates:YES];
	}
    self.pausesLocationUpdatesAutomatically = NO;
    
    [self startUpdatingLocationCustomSwizzle];
}

-(void) requestWhenInUseAuthorizationCustomSwizzle
{
    //[self requestAlwaysAuthorization]; //request always authorization to hide the blue dialog
    [self requestWhenInUseAuthorizationCustomSwizzle];
}

@end

@implementation BackgroundProcess
- (void)pluginInitialize
{
}

- (void)enable:(CDVInvokedUrlCommand*)command
{
    //hook into startUpdatingLocation and requestWhenInUseAuthorization
    Method startUpdatingLocationOriginal = class_getInstanceMethod([CLLocationManager class], @selector(startUpdatingLocation));
    Method startUpdatingLocationCustom = class_getInstanceMethod([CLLocationManager class], @selector(startUpdatingLocationCustomSwizzle));
    method_exchangeImplementations(startUpdatingLocationOriginal, startUpdatingLocationCustom);
    
    Method requestWhenInUseAuthorization = class_getInstanceMethod([CLLocationManager class], @selector(requestWhenInUseAuthorization));
    Method requestWhenInUseAuthorizationCustomSwizzle = class_getInstanceMethod([CLLocationManager class], @selector(requestWhenInUseAuthorizationCustomSwizzle));
    method_exchangeImplementations(requestWhenInUseAuthorization, requestWhenInUseAuthorizationCustomSwizzle);
}

@end
