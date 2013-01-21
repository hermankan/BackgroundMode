//
//  BackgroundMode.m
//  Created by Herman Kan on 1/21/13.
//
//

#import "BackgroundMode.h"

@interface BackgroundMode()

@property (readwrite, assign) BOOL hasPendingOperation;

@end

@implementation BackgroundMode
{
	UIBackgroundTaskIdentifier task;
}

- (CDVPlugin*)initWithWebView:(UIWebView*)theWebView
{
	self = [super initWithWebView:theWebView];
	if (self)
	{
		task = UIBackgroundTaskInvalid;
		
		[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onPause:) name:UIApplicationDidEnterBackgroundNotification object:nil];
		[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onResume:) name:UIApplicationWillEnterForegroundNotification object:nil];
	}
	return self;
}

- (void)stopBackgroundTask:(UIApplication*)application
{
    if (task != UIBackgroundTaskInvalid)
    {
        NSLog(@"Stopping background task");
        [application endBackgroundTask:task];
        task = UIBackgroundTaskInvalid;
    }
}

- (void)onPause:(NSNotification*)notification
{
	if (self.hasPendingOperation)
	{
		NSLog(@"Starting background task");

		UIApplication* application = [notification object];
		task = [application beginBackgroundTaskWithExpirationHandler:^{
			[self stopBackgroundTask:application];
		}];

		dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
			while (self.hasPendingOperation)
				sleep(100);
			
			[self stopBackgroundTask:application];
		});
	}
}

- (void)onResume:(NSNotification*)notification
{
	UIApplication* application = [notification object];
	[self stopBackgroundTask:application];
}

- (void)start:(CDVInvokedUrlCommand*)command
{
	NSLog(@"Background mode started");
	self.hasPendingOperation = YES;
}

- (void)end:(CDVInvokedUrlCommand*)command
{
	NSLog(@"Background mode ended");
	self.hasPendingOperation = NO;
}

@end
