
// Function check for connection
function isConnectionOn() : Boolean
    {
		 
      
		var hasWifi 	: Boolean = false;
		var hasMobile 	: Boolean = false;
		var hasLocal	:Boolean = false;	
      
		var networkInfo:NetworkInfo = NetworkInfo.networkInfo; 
        var interfaces:Vector.<NetworkInterface> = networkInfo.findInterfaces(); 
		
        if( interfaces != null ) 
		{ 
            trace( "Interface count: " + interfaces.length ); 
            for each ( var interfaceObj:NetworkInterface in interfaces ) 
            { 	
				 for each ( var address:InterfaceAddress in interfaceObj.addresses ) 
                { 
                    
                } 
				if ( interfaceObj.active && interfaceObj.name.toLowerCase() == "wifi" ) {hasWifi=true;} 
				if ( interfaceObj.active && interfaceObj.name.toLowerCase() == "mobile" ) {hasMobile=true;} 
				if ( interfaceObj.active && interfaceObj.displayName.toLowerCase() == "local area connection" ) {hasLocal=true;}
			} 
			trace("Internet is on: ",hasLocal || hasMobile || hasWifi);
			return hasLocal || hasMobile || hasWifi;	
			
        }
		
		else 
		{
			trace("Nonetwork");
		}
      trace(hasWifi ,hasMobile, hasLocal);
      return hasWifi || hasMobile || hasLocal;
    }

	// adds evenlistener to check for network change.
	
function initConnectionOn()
	{	NetworkInfo.networkInfo.addEventListener(Event.NETWORK_CHANGE, onNetworkChange); 
		if (!isConnectionOn() )
			{
			networkbutton = new Networkbutton();// your actionscript movie you want to show+ exitbutton to exit app.
			addChild(networkbutton);
			networkbutton.exitbutton.addEventListener(MouseEvent.CLICK, exitbutton_MouseClickHandler);
			
		}
	}

// eventlistener function to report on change in network.
function onNetworkChange(event:Event)
{
	if (isConnectionOn())  
		{if (networkbutton != null) {removeChild(networkbutton);networkbutton=null;}}
			
		
	if (!isConnectionOn()){
			networkbutton = new Networkbutton();// your actionscript movie you want to show+ exitbutton to exit app.
			addChild(networkbutton);// add to scene
			networkbutton.exitbutton.addEventListener(MouseEvent.CLICK, exitbutton_MouseClickHandler);
		}
}	

// eventlistener function to run if click to exit app.
function exitbutton_MouseClickHandler(event:MouseEvent):void
{
	SoundMixer.stopAll();
	NativeApplication.nativeApplication.exit();
}

// Calls in main script.
initConnectionOn();
NetworkInfo.networkInfo.addEventListener(Event.NETWORK_CHANGE, onNetworkChange);