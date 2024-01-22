---
title: 'Request & Response'
weight: 5

---

# Front-end → Backend (AGI) Request

When requesting the AGI execution interface, you can post data with your request. ArozOS provides two way for front-end to request the AGI script placed in your ```./web/``` folder.

### Request via ao_module wrapper (Recommended)

You can import ```ao_module.js``` and use the ```ao_module_agirun``` function call to execute a agi script. Here is an example.

```javascript
//index.html
//Call to helloworld.js with timeout set to 3 seconds
ao_module_agirun("demo/backend/helloworld.js", {
    foo: "bar"
}, function(resp){
    alert(resp);
},function(){
    alert("Oops. Something went wrong!")
}, 3000);
```

To use the variable foo in your agi script, just use the automatic assigned variable ```foo```

```javascript
//demo/backend/helloworld.js
console.log(foo); //Print out "bar" in terminal
sendOK(); //Alert "OK" on front-end side
```



### Request using JSON body payload

If you have a complex JSON structure to import into your AGI runtime, you can also use a JSON body as payload to request the execution endpoint.

```javascript
//index.html
fetch(ao_root + "system/ajgi/interface?script=demo/backend/json_demo.js", {
    method: 'POST',
    cache: 'no-cache',
    headers: {
    	'Content-Type': 'application/json'
    },
    body: JSON.stringify({
        'foo':'bar',
    })
}).then(resp => {
    resp.json().then(data => {
        console.log(data);
    })
});
```

or if you are using jQuery

```javascript
//index.html
$.ajax({
    type: 'POST',
    url: ao_root + 'system/ajgi/interface?script=demo/backend/json_demo.js',
    data:  JSON.stringify ({"foo":"bar"}),
    success: function(data) { 
        console.log(data); 
    },
    contentType: "application/json",
    dataType: 'json'
});
```

```ao_root``` is a global variable included in ao_module that gives something like ```../../../``` to locate the web root for you. Using ```/system/ajgi/interface``` might cause some issues for users who is proxying ArozOS as Virtual Directory.

Afterward, you can access your json payload as ```POST_data``` (string). To use your JSON object, just assign something as ```POST_data``` within your AGI script. Here is an example

```javascript
//demo/backend/json_demo.js
let payload = POST_data;
console.log(payload.foo); //Print out "bar" in terminal
```



# Backend (AGI) → Front-end Response

To send response to front-end, use either of the following at the end of your script.

```javascript
sendResp("string"); //Response header with text/plain header
sendJSONResp("json_string"); //Response request with JSON header
sendJSONResp(object) //Overload function for sending JSON response
sendOK(); //Reply OK in plain text
```

#### Example Usages

```javascript
//example_1.js
var message = "The sum of 1 + 1 is: " + (1 + 1);
sendResp(message);

//example_2.js
var payload = {'foo':'bar'};
sendJSONResp(payload);
```



### Customized Response Header

You can also send string with customized headers via agi. ```HTTP_HEADER``` is a global variable inside the AGI runtime where it is used to decide the response writer header. The default value is ```text/plain``` but you can change it to anything you need. For example, you can emulate an HTTP response from agi script as follows.

```javascript
//Set Response header to html
HTTP_HEADER = "text/html; charset=utf-8";

//Send Response
sendResp("<p>HELLO WORLD!</p>");
```



