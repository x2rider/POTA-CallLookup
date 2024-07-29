# POTA-Call Lookup plugin
## Paul - KA5PMV
When run with the POTA extension, these scripts will enable looking up callsigns from various loggers when clicking the QSY button.
Known bugs: For unknown reasons, at some point it stops working, but if you refresh your browser, it'll work again.

Usage:
To run the proxy that handles communication between your browser and your logging software, you can either:
1) double click the StartServer.cmd file
OR
2) start a PowerShell command prompt and run it by typing ./httpServer.ps1
once started, you can minimize it

First, place the following function at the end of the foreground.js file of the potaplus extension folder.
```
	function setCall(callSign, method) {
		console.log("setCall('" + callSign + "', '" + method + "')");
		var url = '';
		switch(method) {
		case 'log4om':
		case 'aclog':
			{
				url = "http://localhost:8075/?callsign=" + callSign + "&method=" + method;
				_fetch( url, {});
				break;
			}
		}
	}
```

This is a bit hard to explain where it goes.
Place the following line at the end of the QSY function.
``` setCall(scan_call, OPTIONS.loggingConfig.method); ```

The QSY function starts with these lines...
```
if( OPTIONS.enableQsy &&
	    ! objs.freq.innerHTML.match(/QSY_BTN/) ){
```

In the current source file as I have it, it goes just before the 'fetch' call which as of this version is around line 2502
==> Look for this line between the quotes. "_fetch( url, {});//{ mode: 'no-cors' } );"
Place the setCall line just before it.
In the end, it should look something like this...

```
	//console.log("URL:", url);
		setCall(scan_call, OPTIONS.loggingConfig.method);

		_fetch( url, {});//{ mode: 'no-cors' } );
	});
	if( LISTMODE ){
```
