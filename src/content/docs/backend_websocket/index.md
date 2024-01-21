---
title: '🔸 websocket'
weight: 58
---

websocket library provide request upgrade from normal HTTP request to WebSocket connections. 

```javascript
//Include the library
requirelib("websocket");
```

#### websocket functions

```js
websocket.upgrade(10); //Timeout value in integer, return false if failed
var recv = websocket.read(); //Blocking websocket listen
websocket.send("Hello World"); //Send websocket to client (web UI)
websocket.close(); //Close websocket connection
```

#### Usage Example

Font-end

```js
function getWSEndpoint(){
    //Open opeartion in websocket
    let protocol = "wss://";
    if (location.protocol !== 'https:') {
    protocol = "ws://";
    }
    wsControlEndpoint = (protocol + window.location.hostname + ":" + window.location.port);
    return wsControlEndpoint;
}

let socket = new WebSocket(getWSEndpoint() + "/system/ajgi/interface?script=UnitTest/special/websocket.js");

socket.onopen = function(e) {
    log("✔️ Socket Opened");
};

socket.onmessage = function(event) {
    log(`✔️ Received: ${event.data}`);
};

socket.onclose = function(event) {
    if (event.wasClean) {
    log(`📪 Connection Closed Cleanly code=${event.code} reason=${event.reason}`);
    } else {
    // e.g. server process killed or network down
    // event.code is usually 1006 in this case
    log(`❌ Connection Closed Unexpectedly`);
    }
};

socket.onerror = function(error) {
    log(`❌ ERROR! ${error.message}`);
};
```

Backend example (without error handling). See the ```UnitTest/special/websocket.js``` for example with error handling.

```js
function setup(){
    //Require the WebSocket Library
    requirelib("websocket");
    websocket.upgrade(10);
    console.log("WebSocket Opened!")
    return true;
}

function waitForStart(){
    websocket.send("Type something to start test");
    var recv = websocket.read();
    console.log(recv);
}

function loop(i){
    websocket.send("Hello World: " + i);

    //Wait for 1 second before next send
    delay(1000);
}

function closing(){
    //Try to close the WebSocket connection
    websocket.close();
}

//Start executing the script
if (setup()){
    waitForStart();
    for (var i = 0; i < 10; i++){
        loop(i);
    }
    closing();
}else{
    console.log("WebSocket Setup Failed.")
}
```

### 
