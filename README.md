# as3Internet
as3 Functions en eventlisteners to check network availability for admob and serving ads.
<br>
function isConnectionOn() // check if connection is on for wifi, internet or local area network.
<br>
function initConnectionOn() // initialize evenlistener listen for network change.
<br>
function onNetworkChange(event:Event) // eventlistener function event to check to network change.

<br>
USAGE
<br>
initConnectionOn();
<br>
NetworkInfo.networkInfo.addEventListener(Event.NETWORK_CHANGE, onNetworkChange);
