---
title: '🔸 http'
weight: 57
---

A basic http function group that allow GET / POST / HEAD / Download request to other web resources

```javascript
//Include the library
requirelib("http");
```

#### http functions

```javascript
http.get("http://example.com/api/"); //Create a get request, return the respond body

http.post("http://localhost:8080/system/file_system/listDir", JSON.stringify({
    dir: "user:/Desktop",
    sort: "default"
}));    //Create a POST request with JSON payload

http.head("http://localhost:8080/", "Content-Type"); //Get the header field "Content-Type" from the requested url, leave 2nd paramter empty to return the whole header in JSON string

http.download("http://example.com/music.mp3", "user:/Desktop", "(Optional) My Music.mp3")

//Since agi v2.0
http.getb64("http://example.com/photo.png"); //Get target resources as base64 string, return null if error
http.getCode("http://redirect.example.com"); //Get response code for the target endpoint,if the code is redirection related (e.g. 302), a new varaible "_location" will be created to store the redirection address in String.

//Since agi 2.3
http.redirect("https://example.com", 307); //Redirect to target with status code
```

### 
