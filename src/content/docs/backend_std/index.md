---
title: '🔸 system'
weight: 51
---

All the functions in the system library are usable in all agi runtime and do not need to include using ```requirelib``` function.

#### CONST

```
BUILD_VERSION
INTERNVAL_VERSION
LOADED_MODULES
LOADED_STORAGES
```

#### VAR

```
HTTP_RESP
HTTP_HEADER (Default: "text/plain")
```

You can set HTTP_RESP with HTTP_HEADER to create custom response headers.
For example, you can serve an HTML file using agi gateway

```javascript
HTTP_RESP = "<html><body>Hello World</body></html>";
HTTP_HEADER = "text/html";
```

------

#### Response Handlers

```javascript
sendResp("Any string");
sendJSONResp(JSON.stringify({text: "Hello World")); //ArozOS v1 / v2
sendJSONResp({foo: 'bar'}); //ArozOS v2 only
```

#### Database Access

```javascript
newDBTableIfNotExists("tablename");
dropDBTable("tablename");
writeDBItem("tablename", "key", "value");
readDBItem("tablename", "key");
listDBTable("tablename"); //Return key value array
deleteDBItem("tablename", "key");
```

#### Register and Packages

```javascript
registerModule(JSON.stringify(moduleLaunchInfo)); //See start script sections for examples
```

#### Include other script files

You can also include another js / agi file to load shared code between scripts

```js
includes("hello world.js"); //Include another js / agi file within the current running one, return false if failed
```

#### Print to STDOUT (console)

To print something for debug, you can print text directly to ArOZ Online Core terminal using

```js
console.log("text");
```

#### Delayed operations

Synchronized delay (or blocking delay) can be used with the delay function (ms)

```js
delay(5000);
```

For async delayed / timer ticking operations like setTimeout or setInterval is currently not supported.

#### Exit & Terminate Runtime

Instantly terminate and exit the runtime

```js
exit();
```

------

#### Deprecated

Deprecated since v2.018: ffmpeg exec was replaced by work in progress ffmpeg library in agi core.

```
requirepkg("ffmpeg");
execpkg("ffmpeg",'-i "files/users/TC/Desktop/群青.mp3" "files/users/TC/Desktop/群青.flac'); //ffmpeg must be required() before use
```

