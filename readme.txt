Usage for Phonegap 2.7.0:

Add entry <plugin name="BackgroundMode" value="BackgroundMode" /> to config.xml inside <plugins>
Add BackgroundMode.h and BackgroundMode.m into the plugin directory for your project
Include BackgroundMode.js in any html file you want to use it in

To run call Window.BackgroundMode.start() and Window.BackgroundMode.stop();