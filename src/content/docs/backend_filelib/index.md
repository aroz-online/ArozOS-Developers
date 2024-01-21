---
title: '🔸 filelib'
weight: 54
---

filelib is the core library for users to interact with the file system. You can include the library with ```requirelib("filelib")```. Example as follows.

```javascript
if (!requirelib("filelib")){
    console.log("Filelib import failed");
}else{
    console.log(filelib.fileExists("user:/Desktop/"));
}
```

#### Filelib functions

Here is a list of functions and example provided by filelib.

```javascript
    filelib.writeFile("user:/Desktop/test.txt", "Hello World");  //Write to file
    filelib.readFile("user:/Desktop/test.txt"); //Read from file
    filelib.deleteFile("user:/Desktop/test.txt"); //Delete a file by given path
    filelib.readdir("user:/Desktop/"); //List all subdirectories within this directory
    filelib.walk("user:/Desktop/"); //Recursive scan dir and return all files and folder in subdirs, network drive are not supported
    filelib.glob("user:/Desktop/*.jpg", "smallToLarge"); //Standard glob function
    filelib.aglob("user:/Desktop/*.jpg", "user"); //Advance glob with better unicode support, do not support wildcard in directory but only filename (last part of the path)
    filelib.filesize("user:/Desktop/test.jpg");	//Get filesize in bytes				
    filelib.fileExists("user:/Desktop/test.jpg"); //Check if file exists
    filelib.isDir("user:/Desktop/NewFolder/"); //Check if path is directory
    filelib.md5("user:/Desktop/test.jpg"); //Get the file's md5
    filelib.mkdir("user/Desktop/NewFolder"); //Create a new folder
    filelib.mtime("user:/Desktop/test.jpg", true); //Get modification time, return unix timestamp. Set the 2nd paramter to false for human readble format
    filelib.rname("user:/Deskop");  //Get Rootname, return "User" in this example
```

##### Special sorting mode for glob and aglob

For glob and aglob, developer can pass in the following sorting modes (case sensitive)

- default
- reverse
- smallToLarge
- largeToSmall
- mostRecent
- leastRecent
- smart (Added in v1.119, AGI only, for sorting filename containing digits with no zero pads)

```javascript
//Example for sorting the desktop files to largeToSmall
filelib.aglob("user:/Desktop/*", "largeToSmall");
```

To use the user default option which user has set in File Manager WebApp, pass in "user". Default sorting method is "default"

```javascript
//Example of using user's selected mode
filelib.aglob("user:/Desktop/*.jpg", "user");
```

##### Return type of filelib.readdir (Since ArozOS v2.002)

For filelib.readdir, it will return an array with the following object structure

```go
type fileInfo struct {
    Filename string
    Filepath string
    Ext      string
    Filesize int64
    Modtime  int64
    IsDir    bool
}
```

Example return value (in JSON object, not stringify JSON string)

```json
[
  {
    "Ext": ".mp3",
    "Filename": "MyMusic.mp3",
    "Filepath": "user:/Desktop/MyMusic.mp3",
    "Filesize": 12841616,
    "IsDir": false,
    "Modtime": 1653400359
  },
  {
    "Ext": ".shortcut",
    "Filename": "Code Studio.shortcut",
    "Filepath": "user:/Desktop/Code Studio.shortcut",
    "Filesize": 63,
    "IsDir": false,
    "Modtime": 1644421891
  },
  {
    "Ext": ".txt",
    "Filename": "END USER LICENSE.txt",
    "Filepath": "files/users/TC/Desktop/END USER LICENSE.txt",
    "Filesize": 11698,
    "IsDir": false,
    "Modtime": 1653318436
  }
]
```

##### Relative path support when execute in personal page (Since ArozOS v2.005)

Since v2.005, filelib support execution of file operations as relative path **when the file is executed via personal page link**. For example:

```javascript
var content = filelib.readFile("./untitled.md");
```

***In other library or use case, please use the full path of resources instead.***
