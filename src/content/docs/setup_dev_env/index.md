---
title: 'Create New WebApp'
weight: 3
---

## Create New WebApp Folder Structure

To create a new WebApp, create a folder under the ```./web/``` folder under arozos root.  After the folder is created, place the following files into the folder. (Assume the module name is "MyWebapp")

```
.
└── web/
    └── MyWebapp/
        ├── init.agi
        ├── index.html
        └── img/
            ├── icon.png
            └── desktop_icon.png
```

The icons are required to be in following sizes

| Icon Filename    | Size         |
| ---------------- | ------------ |
| icon.png         | 64 x 64 px   |
| desktop_icon.png | 128 x 128 px |

## Setup init.agi

init.agi is the entry point for ArozOS to know this is a WebApp module folder instead of resources folder. You can edit the init.agi file with text editor like VSCode and set it to JavaScript syntax highlighting. 

In the init.agi file, fill in the following minimal fields.

```javascript
//Define the launchInfo for the module
var moduleLaunchInfo = {
    Name: "Hello World",
    Group: "Interface Module",
    IconPath: "MyWebapp/img/small_icon.png",
    Version: "1.0",
    StartDir: "MyWebapp/index.html"
}

//Register the module
registerModule(JSON.stringify(moduleLaunchInfo));
```

There are a different group settings for different modules. ```Interface Module``` is a unique class of modules that is usually reserved for special purposes. However it is used here to make things simplier.

### WebApp Catergory Groups

Here are some common groups you can use in your module

| Group Name       | Usage                                           | Reserved | Notes                                                                                                                  |
| ---------------- | ----------------------------------------------- | -------- | ---------------------------------------------------------------------------------------------------------------------- |
| Media            | Media playback apps                             | ❌        |                                                                                                                        |
| Office           | Office or text editing apps                     | ❌        |                                                                                                                        |
| Download         | Download tools                                  | ❌        |                                                                                                                        |
| Files            | File / Storage management apps                  | ❌        |                                                                                                                        |
| Internet         | Internet access,  configs or proxy apps         | ❌        |                                                                                                                        |
| Settings         | Setting tools provided by 3rd parties           | ❌        |                                                                                                                        |
| System Tools     | System tools that is preinstalled by ArozOS     | ✔️       |                                                                                                                        |
| Utilities        | Some helpful webapps and utilities              | ✔️       | Utilities are accessible by all users no matter if they are set to allow access to these category of apps or not       |
| Interface Module | Interfacing module for custom landing interface | ✔️       | Usually use by system OEM to customize access landing page other than web-desktop interface. E.g. POS  / kiosk machine |
| IME              | 3rd party Input Method Editor                   | ✔️       | So you can type your home language without installing IME on public computers                                          |
| Development      | Development related tools                       | ✔️       | Development & debug tools for ArozOS only, for other development tools, use "Office" catergory.                        |

Notice the ```MyWebapp/``` in the first part of the IconPath and StartDir? It means that you can have a single webapp with different entry points. "Management Gateway" is one of such examples which utilize this feature to provide "System Settings" to those who don't like web desktop environment.

After you have added the init.agi, restart ArozOS on your development machine and you will see your new WebApp pops up in the startup menu.

## Frontend Backend Interaction via AGI

### Front-end HTML / JavaScript

Lets fill up the index.html with some basic stuffs. Here is an example of a really basic html file.

```html
<!DOCTYPE html>
<html>
    <head>
        <meta name="apple-mobile-web-app-capable" content="yes" />
        <meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1, maximum-scale=1"/>
        <meta charset="UTF-8">
        <script src="../script/jquery.min.js"></script>
        <script src="../script/ao_module.js"></script>
        <title>Hello World</title>
        <style>
            body{
                background-color:white;
            }
        </style>
    </head>
    <body> 
        <button onclick="test()">Click Me</button>
        <script>
            function test(){
                ao_module_agirun("MyWebapp/backend/helloworld.js", {
                    NAME: "Toby"
                }, function(resp){
                    alert(resp);
                },function(){
                    alert("Oops. Something went wrong!")
                });
            }
        </script>
    </body>
 </html>
```

When the button is clicked, the function test() is called and make a request to the agi script to do some backend work. After the job is done, the agi script will return some value to front-end to popup as "alert" is called.

##### Notes

- Before importing ao_module.js (ArozOS system API wrapper), you **must include jquery** as some of the function inside the wrapper require jquery to operate.

- Notice the body background color? By default, all ArozOS WebApps have transparent background. If the body css is not set as white (or any solid color), your WebApp floating windows will be transparent.

- ao_module_agirun is the entry point for all AGI scripts that is called via ArozOS WebApps. The function paramter is defined as follows.
  
  ```javascript
  ao_module_agirun(scriptpath, data, callback, failedcallback = undefined, timeout=0)
  ```

Lets try to add a backend to it!

### Backend agi Script

To add a backend script to handle the agi request, create a folder named "backend" and name it "helloworld.js". Now, your folder structure should look like this.

```
.
└── web/
    └── MyWebapp/
        ├── init.agi
        ├── index.html
        ├── img/
        │   ├── icon.png
        │   └── desktop_icon.png
        └── backend/
            └── helloworld.js
```

Open and edit the helloworld.js file as follows.

```javascript
//Send Hello World as response
if (typeof(NAME) != "undefined"){
    sendResp("Hello World! Welcome " + NAME);
}else{
    sendResp("Hello there!");
}

```

The code in the backend basically do the following things.

1. Check if the input NAME is available. 

2. If yes, return hello world with the user's name

3. If no, return hello there!

In the front-end, we call this script as follows.

```javascript
ao_module_agirun("MyWebapp/backend/helloworld.js", {
    NAME: "Toby"
  }, function(resp){
    alert(resp);
  },function(){
    alert("Oops. Something went wrong!")
});
```

In the above example, a variable ```NAME: "Toby" ```is passed to the backend. In such case, the backend will response with ```Hello World! Welcome Toby``` and result is shown via alert() function.



### Now, you know the basics on how WebApps with backend works in ArozOS! 🎉🎉🎉

Lets continue to the next chapter to see how agi provides you basically all features you need to write a script to control your own web desktop system.
