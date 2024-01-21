---
title: '🔹 Float-Windows API'
weight: 21
---

## Requirements

Float Windows (fw) are the draggable windows on the ArozOS web desktops that display the contents of WebApps. Float Windows properties can be controlled by the app front-end script using the ```ao_module.js``` api wrapper in the ```web/script/``` folder. To use it, import the ao_module wrapper from your webapp html files.

```html
<script type="text/javascript" src="../script/jquery.min.js"></script>
<script type="text/javascript" src="../script/ao_module.js"></script>
```

*Note that **jquery must be imported before ao_module.js  AND ao_module must be imported with relative path to current script** to make sure all the ao_module functions are usable.*

-----

## Float Window APIs

### Global Variables

```javascript
ao_module_virtualDesktop //boolean, true when the current app is running in web desktop mode

ao_module_windowID //Window ID of the current app
ao_module_parentID //Parent window ID if this app window is created by another webapp
ao_module_callback //Callback function name (string) in parent
ao_module_ime //Set if this is an IME window, reserve for IME catergory WebApps only

ao_root //Relative path to ArozOS web root, e.g. ../ 
```

-----

### Windows Operations

#### 🔹 ao_module_newfw(launchConfig)

newfw create a new float windows with given launch configs. 

Most basic usage: (With auto assign UID, size and location)
``` js
ao_module_newfw({
    url: "Dummy/index.html",
    title: "Dummy Module",
    appicon: "Dummy/img/icon.png"
});
```

Example usage that involve all configs.

```js
ao_module_newfw({
    url: "Dummy/index.html",
    uid: "CustomUUID",
    width: 1024,
    height: 768,
    appicon: "Dummy/img/icon.png",
    title: "Dummy Module",
    left: 100,
    top: 100,
    background-color: "#fcfcfc",
    parent: ao_module_windowID,
    callback: "childCallbackHandler"
});
```

##### Note about parent and callback values

The ```parent``` id must be set if ```callback``` is set. 

```callback``` is the name (string) of a global function in the parent float window that allow calling from its child. This won't work if the url is called from another origin that do not allow CORS access.

#### 🔹 ao_module_hasParentCallback()

hasParentCallback return true or false depends on this windows has a set parent callback and its parent is still alive (the float window DOM object still exists)

#### 🔹 ao_module_parentCallback(data="")

parentCallback execute the parent callback from the child and return data to the parent float window. The data must be string. Use ```JSON.stringify``` if object data is needed to pass to the parent window.



-----

### Windows Properties

These are some global scope ao_module wrapper function where developer can call in their WebApp JavaScript sections to change the float window properties on the web desktop interface. When the API was called in non web-desktop mode, nothing will happens.

#### 🔹 ao_module_setFixedWindowSize()

setFixedWindowSize set the float window to non-resizable window type. The maximize (and minimize) button will be hidden if this function is called when the webapp startup.

#### 🔹 ao_module_setResizableWindowSize()

setResizableWindowSize set the float window to resizable window type. The maximize (and minimize) button will be shown. This is the default type of float window if ```setFixedWindowSize()``` was not called.

#### 🔹 ao_module_setWindowSize(width, height)

setWindowSize force update the current float window to the target new size

#### 🔹 ao_module_setWindowTitle(newTitle)

setWindowTitle update the current float window to new title. Under non web-desktop mode, this function call update the ```document.title``` instead.

#### 🔹 ao_module_makeSingleInstance()

makeSingleInstance is used to force only one instance of an WebApp is open at the same time. This function will check if there are any windows with the same path. If yes, overwrite the other window's hash content with the current window and close the current float window.

If no another instance is found, this function return false and do nothing.

#### 🔹 ao_module_getInstanceByPath(matchingPath)

getInstanceByPath get the first instance of float windows running in the current web desktop with the same path. Here is an example of usage.

```javascript
let targetOpeningInstance = ao_module_getInstanceByPath("NotepadA/index.html");
//Another float window (DOM objects) that also open to the same path
```

This function return null if nothing is found.

#### 🔹 ao_module_close()

close function close the current float window. However, you can also overwrite this function with your own checking logic and call to the underlaying api of ```ao_module_closeHandler()```. Here is an example

```js
//In your WebApp front-end javascript, overwrite the ao_module_close function
ao_module_close = function(){
    if (checkDocumentSaved()){
        //Call to the underlaying fw closing API
        ao_module_closeHandler();
    }else{
        //Do something else and block closing action
        alert("Please save the document before closing");
    }
}
```

#### 🔹 ao_module_closeHandler()

closeHandler is the underlaying API for ```ao_module_close()```. Only use for overwriting the default ```ao_module_close()``` function.

#### 🔹 ao_module_focus()

focus will bring the current float window to top.

#### 🔹 ao_module_setTopMost()

setTopMost will bring the current float window to top and attach it in front of all other float windows.

#### 🔹 ao_module_unsetTopMost()

unsetTopMost will remove the current float window from the top-most layer and bring it back to the normal float windows layer.
