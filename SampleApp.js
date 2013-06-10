function longRunningTask()
{
	BackgroundMode.start();

	// Start a long-running process here.
	// It will run even after the user has switched to another app but no longer than backgroundTimeRemaining (typically 10 minutes) - see
	// http://developer.apple.com/library/ios/#documentation/UIKit/Reference/UIApplication_Class/Reference/Reference.html#//apple_ref/occ/instp/UIApplication/backgroundTimeRemaining

	BackgroundMode.stop();
}

function onDeviceReady()
{
	setTimeout(longRunningTask, 100);
}