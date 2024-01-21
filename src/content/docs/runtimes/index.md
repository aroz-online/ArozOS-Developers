---
title: 'Introduction to agi'
weight: 2
---

AGI (ArozOS Gateway Interface) is a JavaScript scripting interface provided by ArozOS that allow user scope code execution with high flexibility and automation. The JavaScript VM is provided by Otto and is mostly compatible with modern JavaScript syntax. 

The followings describe the different ways to call & use AGI scripts.

##### WebApp (Front-end) Request

Call by WebApps by logged in users. Serve as a simple backend function like a php script does with build in authentication and permission checks.

```
POST /system/ajgi/interface
```

##### WebApp Initialization Script (init.agi)

Start scripts are usually located at module root folder.

```
./web/{module_name}/init.agi
```

This file contains the important configs on how to launch the current module. For example, here is the Music module start script.

```javascript
/*
    Music Module Start Script
*/

//Setup the module information
var moduleLaunchInfo = {
    Name: "Music",
    Desc: "The best music player in ArOZ Online",
    Group: "Media",
    IconPath: "Music/img/module_icon.png",
    Version: "0.1.0",
    StartDir: "Music/index.html",
    SupportFW: true,
    LaunchFWDir: "Music/index.html",
    SupportEmb: true,
    LaunchEmb: "Music/embedded.html",
    InitFWSize: [475, 720],
    InitEmbSize: [360, 254],
    SupportedExt: [".mp3",".flac",".wav",".ogg",".aac",".webm",".mp4"]
}

//Register the module
registerModule(JSON.stringify(moduleLaunchInfo));
```



 *In this documentation, the focus will be in the WebApp development, aka using only the Initialization script and internal API call. For the rest of the calling methods and runtimes, please see **Advanced Usage** section.*

------

The followings are alternative runtime provided by ArozOS that also support agi. They might have slight different functions or calling methods.

##### Serverless API Request

Call by serverless API endpoints by external requests. 

These endpoints can be executed by external request and run with the script owner's permission group settings. For example, telegram bot or linking up with other open source projects which provide RESTFUL based webhook.

##### System Scheduler

The script that is registered in the system scheduler, can be executed by the system in backend with a fixed interval. Suitable for customizing routine daily tasks to internal resources (e.g. cache cleaning) or make HTTP request to external API endpoint to fetch data and update serverless scripts.

##### Personal Homepage

Call by any external users visiting a user's personal homepage. 

Usually this is placed under the user homepage root folder as .agi file. When requested from user homepage web server, it execute and return static values like a php script does.



-----

*Notes on AJGI and AGI*

Sometime you might see AJGI (ArOZ Javascript Gateway Interface) in older documentations. It was the old name of AGI from ArozOS v1.0 era. They both means the same thing.
