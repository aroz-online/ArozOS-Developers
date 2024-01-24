---
title: '🔹 ao_module utilities'
weight: 49
---

ao_module provide a list of utilities function which you can use to make developing WebApps easier.

## Usage

To use the utilities functions, your fist need to import the ao_module wrapper as follows.

```html
<script type="text/javascript" src="../script/jquery.min.js"></script>
<script type="text/javascript" src="../script/ao_module.js"></script>
```

And call them with the static class name ```ao_module_utils```. For example,

```js
let newUUID = ao_module_utils.getRandomUID(); //Return a random UUID from timestamp
```



## Objects Encoding

### objectToAttr(object)

Convert objects into a DOM attribute safe string

### attrToObject(attr)

Convert the DOM attribute string back to a JavaScript object

### stringToBlob(text, mimetype="text/plain") 

Convert string to blob object

### blobToFile(blob, filename, mimetype="text/plain")

Convert blob to File object. 



## File Utilities

### readFileFromFileObject(fileObject, successCallback, failedCallback=undefined) 

Read file object as text. Success callback will return the content of the file as string, while failed callback will return the reader error DOMException.

### getDropFileInfo(dropEvent)

Get the drop file properties ```{filepath: file_virtual_path, filename: file_name}``` from file drop events from File Manager. Return ```null``` if this is not a drop event from File Manager 

### getIconFromExt(ext)

Return Semantic UI supported icon class name (without the icon class) as string from given file extension. For example

```js
let fileExt = "pdf";
let iconElement = `<i class="${ao_module_utils.getIconFromExt(fileExt)} icon"></i>`;

//The icon element class will be "file pdf outline icon"
```

### formatBytes(bytes, decimalPlace=2) 

Convert and rounds bytes into KB, MB, GB, TB up to YB (probably not need this anytime soon)



## Others

### getRandomUID()

Get a random UUID base on current timestamp

### durationConverter(seconds) 

Convert duration in seconds to Days / Hours / Minutes / Seconds

### timeConverter(unix_timestamp); 

Get human readable timestamp from unix timestamp

### getWebSocketEndpoint() 

Construct server websocket endpoint root from current client accessing URL. The URL is constrcuted on the front-end so it will use the hostname from where the client is connecting into the system as the root url for websocket connection. Here is an example if the user is connecting in via HTTP from LAN.

```
ws://192.168.1.100:8080
```

And here is another example user is connecting into your server via HTTPS domain

```
wss://example.com
```

You can add your scripts relative path to it and create a websocket connection. Here is an example.

```js
let wsurl = ao_module_utils.getWebSocketEndpoint() + "/MyModule/backend/connect.agi";
```



