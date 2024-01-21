---
title: '🔸 appdata'
weight: 55
---

An API for access files inside the web folder. This API only provide read only functions. Include the appdata lib as follows.

```javascript
requirelib("appdata");
```

### appdata functions

```javascript
appdata.readFile("UnitTest/appdata.txt"); //Return false (boolean) if read failed
appdata.listDir("UnitTest/backend/"); //Return a list of files in JSON string
```

### Example Usages

#### Read File

```js
/*
    appdata.readFile.js

    This script test the appdata read file function.
    This should be able to read file 
*/

//Require the appdata library
var succ = requirelib("appdata");

function main(){
    //Get a file from the UnitTest WebApp. This path is relative from the web root
    var webAppDataFileContent = appdata.readFile("UnitTest/appdata.txt");

    //Check if there are any error for reading the file
    if (webAppDataFileContent == false){
        sendJSONResp(JSON.stringify({
            error: "Unable to get appdata from app folder"
        }));
    }else{
        //Success. Return the content of the file
        sendResp(webAppDataFileContent)
    }
}

if (!succ){
    //Library include failed.
    sendResp("Include Appdata lib failed. Is your ArozOS version too old?")
}else{
    //Library include succeed. Start reading from webroot
    main();
}

```

#### List Directory

```js
/*
    appdata.listDir.js

    This script test the appdata read file function.
    This should be able to read file 
*/

//Require the appdata library
var succ = requirelib("appdata");

function main(){
    //List all files within the UnitTest backend example library
    var backendExamples = appdata.listDir("UnitTest/backend/");

    //Check if there are any error for reading the file
    if (backendExamples == false){
        sendJSONResp(JSON.stringify({
            error: "Unable to list backend example library"
        }));
    }else{
        //Success. Return the file list of the folder
        sendJSONResp(backendExamples);
    }
}

if (!succ){
    //Library include failed.
    sendResp("Include Appdata lib failed. Is your ArozOS version too old?")
}else{
    //Library include succeed. Start listing backend folder
    main();
}

```

