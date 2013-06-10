var BackgroundMode =
{
	start: function()
	{
		cordova.exec(null, null, "BackgroundMode", "start", []);
	},

	stop: function()
	{
		cordova.exec(null, null, "BackgroundMode", "end", []);
	}
};