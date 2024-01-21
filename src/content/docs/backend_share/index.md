---
title: '🔸 share'
weight: 60
---

The share API allow access to the ArozOS share interface and generate UUID based on the shared file.

```js
requirelib("share");
```

#### share functions

```js
share.shareFile("user:/Desktop/test.pptx", 300); //File virtual path and timeout in seconds, return UUID of share
share.getFileShareUUID("user:/Desktop/test.pptx"); //Get the share UUID of a given file, return null if not shared
share.fileIsShared("user:/Desktop/test.pptx"); //Return true / false
share.checkShareExists(shareUUID); //Return true / false
share.checkSharePermission(shareUUID); //Return the share permission of shares (anyone / signedin / samegroup), return null if shareUUID invalid.
share.removeShare(shareUUID);
```

#### Share Timeout

For ```shareFile``` timeout value, **if set to 0 or unset, it will default to "forever"**. Hence, the share will not be automatically removed after timeout 

Please also note that the share timeout is done by the AGI gateway system runtime. Hence, if you have shutdown / reset your ArozOS within the set period of time, your share **will not get automatically removed after the system startup again**.



#### Usage Example

```js
//File Share API
//This script demonstrate how to share a file on ArozOS using AGI script

//Require the share lib
requirelib("share");

function main(){
    //Share the file for 10 seconds
    var shareUUID = share.shareFile("user:/Desktop/test.pptx", 10);
    console.log(shareUUID);
    if (shareUUID == null){
        //Share error
        sendResp("Share failed");
    }else{
        //Share success.
        //Check if share UUID exists
        console.log("Share UUID is valid: " + share.checkShareExists(shareUUID));

        //Check if the source file is shared
        console.log("Source file is shared: " + share.fileIsShared("user:/Desktop/test.pptx"));

        console.log("Source file share permission: " + share.checkSharePermission(shareUUID));
        //Remove the share using UUID
        //share.removeShare(shareUUID);

        //Delay 11 seconds
        delay(11000)

        //Check is the share is still valid
        console.log("Share UUID valid after share expired: " + share.checkShareExists(shareUUID));

        //Return the share UUID
        sendResp("OK");
    }
}

main();
```

