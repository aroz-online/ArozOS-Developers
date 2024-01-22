---
title: '🔹 Requesting Media Stream'
weight: 23
---

WebApp can request any files from the user accessible storage scope by making a HTTP request to the media endpoint. If you need backend processing after reading the file, use the [filelib](../backend_filelib/) API instead.

### Media Stream Request
To get a stream of media file from the server using virtual path, make a HTTP request to ```/media/``` endpoint with ```?file={{path}}``` GET parameter. Here is an example.

```text
GET /media?file=user:/Desktop/music.mp3
```

By default the header do not include ```Content-Disposition``` or ```Content-Type``` header. If you want to prompt the user to download the target file, add ```&download=true``` after your filename as follows.

```text
GET /media?file=user:/Desktop/music.mp3&download=true
```

This method is only suitable for filenames that contains only ASCII characters and no special characters like ```+``` or ```?```. If you are not sure the filename of the user selected, use the ```/media/download/``` endpoint instead.

If gzip is enabled and the ```&download=true``` download request is used, the browser will not know the file size and thus, the download progress will not show on browser.

### Media Download Request
To start file download in a new browser tab, you can redirect user to the ```/media/download/``` endpoint with ```?file={{path}}``` parameter. Here is an example of such use cases.

```javascript
window.open("/media/download/?file=user:/Desktop/music.mp3");
```

The response will then contains the ```Content-Disposition``` and ```Content-Type``` header.

### Media MIME Request
The ```/media/getMime/``` endpoint will return the target file's MIME type as text/plain. Here is an example usage.

```text
GET /media/getMime/?file=user:/Desktop/mysite.html

//Return "text/html"
```
By default, this API return "text/directory" for any unknown file MIME types.



