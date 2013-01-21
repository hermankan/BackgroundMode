//
//  BackgroundMode.h
//  Created by Herman Kan on 1/21/13.
//
//

#ifndef AlephBeta_BackgroundMode_h
#define AlephBeta_BackgroundMode_h

#import <Cordova/CDV.h>

@interface BackgroundMode : CDVPlugin

- (void)start:(CDVInvokedUrlCommand*)command;
- (void)end:(CDVInvokedUrlCommand*)command;

@end

#endif
