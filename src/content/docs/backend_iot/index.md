---
title: '🔸 iot'
weight: 59
---

The iot library provide access to the iot hardware control endpoints (or endpoints for short) in a much easier to use abstraction.  Note that not all iot devices are supported. If you have an unsupported iot device, please contribute a driver for your brand of iot devices. 

```js
//Include the library
requirelib("iot");
```

#### iot functions

```js
iot.ready() //Return the iot manager status. Return true if ready, false otherwise.
iot.scan() //Force the iot manager to scan nearby iot devices
iot.list() //List nearby iot device, might be cached. 
iot.connect(devid) //Connect to a given device using device id
iot.disconnect(devid) //Disconnect a given device using device id
iot.status(devid) //Get the status of an iot device given its device ID, ID can be accessed using DeviceUUID key form an iot device object.
iot.exec(devid, epname, payload); //Execute iot command using device id, endpoint name and payload (object).
iot.iconTag(devid) //Get the device icon name from the device id
```

#### Example Return from iot.list() or iot.scan()

```js
[
   {
      "ControlEndpoints":[
         {
            "Desc":"Toggle the power of the smart switch",
            "Max":0,
            "Min":0,
            "Name":"Toggle Power",
            "Regex":"",
            "RelPath":"ay?o=1",
            "Steps":0,
            "Type":"none"
         }
      ],
      "DeviceUUID":"84:F3:EB:3C:C7:F9",
      "Handler":{ 
          //hidden fields 
      },
      "IPAddr":"192.168.0.177",
      "Manufacturer":"Sonoff",
      "Model":"Sonoff S2X Smart Switch",
      "Name":"Lights",
      "Port":80,
      "RequireAuth":false,
      "RequireConnect":false,
      "Status":{
         "Power":"ON"
      },
      "Version":""
   }
]
```

#### Usage Example

The following code do not handle errors. Please see iot.exec.js for a full example.

```js
if (iot.ready() == true){
    //Get device list from the iot manager
    var deviceList = iot.list();

    //Assume the first device is the one we want to control
    var thisDevice = deviceList[0];

    //Assume the first endpoint is the one we want to execute
    var targetEndpoint = thisDevice.ControlEndpoints[0];

    //Connect to the iot device
    iot.connect(thisDevice.DeviceUUID);

    //Execute the endpoint and get response from iot device
    var results = iot.exec(thisDevice.DeviceUUID, targetEndpoint.Name, {});

    //Disconnect the iot device after use
    iot.disconnect(thisDevice.DeviceUUID);

    if (results == false){
        console.log("Something went wrong");
    }else{
        console.log("It works!" + JSON.stringify(results))
    }
}
```

For detailed example for other functions, see the js file located at ```UnitTest/backend/iot.*.js```

