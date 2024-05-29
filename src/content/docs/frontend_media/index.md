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

By default the header do not include ```Content-Disposition``` or ```Content-Type```. If you want to prompt the user to download the target file, add ```&download=true``` after your filename as follows.

```text
GET /media?file=user:/Desktop/music.mp3&download=true
```

This method is only suitable for filenames that contains only ASCII characters and no special characters like ```+``` or ```?```. If you are not sure the filename of the user selected, use the ```/media/download/``` endpoint instead.

### Media Download Request
To start file download in a new browser tab, you can redirect user to the ```/media/download/``` endpoint with ```?file={{path}}``` parameter. Here is an example of such use cases.

```javascript
window.open("/media/download/?file=user:/Desktop/music.mp3");
```

The response will then contains the ```Content-Disposition``` and ```Content-Type``` header.

### Media Transcode Request (v2.020+)

Video file real-time transcode can be done using the `/media/transcode/` endpoint to serve your video. This mode allows video files that is not natively supported by web playback be streamed on the web-desktop interface. 

```
GET /media/transcode?file=user:/Video/demo.rmvb
```

This API also support a few output resolution. Use `&res={{resolution_enum}}`to force output resolution. Supported resolution_enum as follows.

| resolution_enum              | Matching ffmpeg scale                          |
| ---------------------------- | ---------------------------------------------- |
| "360p"                       | scale=-1:360                                   |
| "720p"                       | scale=-1:720                                   |
| "1080p"                      | scale=-1:1080                                  |
| "" (Empty string or not set) | (unset, default to the source file resolution) |

Note that this function will redirect to `/media/` endpoint if FFmpeg is not installed on the host running ArozOS. 

### Media MIME Request
The ```/media/getMime/``` endpoint will return the target file's MIME type as text/plain. Here is an example usage.

```text
GET /media/getMime/?file=user:/Desktop/mysite.html

//Return "text/html"
```
By default, this API return "text/directory" for any unknown file MIME types.



