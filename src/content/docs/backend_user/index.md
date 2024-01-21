---
title: '🔸 user'
weight: 52
---

The user library is automatically imported when the execution scope is a "user" scope instead of a "system" scope. For example, WebApp agi calls, serverless and personal homepage are all accessible to the user scope functions.

#### CONST

```javascript
USERNAME
USERICON
USERQUOTA_TOTAL
USERQUOTA_USED
USER_VROOTS //Return an array of root names
USER_MODULES //Accessible modules in array, might return ["*"] for admin permission
```

------

#### Permission

```javascript
getUserPermissionGroup(); //Get the permission group name(s) this user are in
userIsAdmin(); //Return true / false
```

#### User Creation, Edit and Removal

All the command in this section require administrator permission. To check if user is admin, use ``` userIsAdmin() ```.

```javascript
userExists(username); //Return true / false
createUser(username, password, defaultGroup);    //defaultGroup must be one of the permission group that exists in the system
removeUser(username); //Return true if success, false if failed
```

#### Library requirement

You can request other library to be loaded and have extra functions to work with files / images.

```
requirelib("filelib");
```

#### Execute tasks in another routine

You can use the execd function to execute something that is long pulling after the main thread returned the results of the current calculation.

```
 execd("execd.js", "Payload to child")
```

To check if the current script is being executed as routine process, check for the following variable.

```
if (typeof PARENT_DETACHED == 'undefined'){
    //This is parent
}else if (PARENT_DETACHED == true){
    //This is child
}
```

To get the payload in child routine, get the following variable (Default: empty string)

```
PARENT_PAYLOAD
```



-----

#### Deprecated

Deprecated since v2.0

```javascript
decodeVirtualPath("user:/Desktop"); //Convert virtual path (e.g. user:/Desktop) to real path (e.g. ./files/user/username/Desktop)
decodeAbsoluteVirtualPath("user:/Desktop"); //Same as decodeVirtualPath but return in absolute path instead of relative path from the arozos binary root
encodeRealPath("files/users/User/Desktop"); //Convert realpath into virtual path
```

