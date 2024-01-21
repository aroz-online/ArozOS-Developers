---
title: 'Backend Development'
weight: 50
---



User scripting can be done in ArozOS using ArozOS Gateway Interface (agi). 

AGI interface documentations are labeled with prefix 🔸.



### Running .agi Scripts

To execute agi script (with file extension of .agi or .js), call to the ao_module.js wrapper's agi_run function. Here is a minimal example on how to call an agi script in front-end JavaScript code.

```js
ao_module_agirun("demo/backend/helloworld.js", {
    foo: "bar"
}, function(resp){
    alert(resp);
});

```

For more details about front-end back-end interaction, see [Request & Response](../agi_resp/)

### The backend Folder

As agi scripts can use both .js or .agi extension, when developing a backend for your WebApp, it is recommended that to put your scripts inside a folder named ```backend```. For example, ```web/MyModule/backend/myscript.js```.

### Debug Messages

agi output its debug message back to the request origin. 

If you are requesting the script via agi RESTFUL API endpoints, then the error message will be output to the http response. Otherwise, sometime the error message will output to terminal. If you want to debug your code locally, you can also use the standard ```console.log``` to output your custom message to the terminal where you are running ArozOS executable. 

