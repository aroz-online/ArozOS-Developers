---
title: '🔸 imagelib'
weight: 56
---

A basic image handling library to process images. Allowing basic image resize and get image dimensions

```javascript
//Include the library
requirelib("imagelib");
```

#### ImageLib functions

```javascript
imagelib.getImageDimension("user:/Desktop/test.jpg"); //return [width, height]
imagelib.resizeImage("user:/Desktop/input.png", "user:/Desktop/output.png", 500, 300); //Resize input.png to 500 x 300 pixal and write to output.png
imagelib.loadThumbString("user:/Desktop/test.jpg"); //Load the given file's thumbnail as base64 string, return false if failed
imagelib.cropImage("user:/Desktop/test.jpg", "user:/Desktop/out.jpg",100,100,200,200)); 
imagelib.classify("tmp:/classify.jpg", "yolo3"); //Classify an image using neural network, since v1.119
```

#### Crop Image Options

```
Crop the given image with the following arguemnts: 

1) Input file (virtual path)
2) Output file (virtual path, will be overwritten if exists)
3) Position X
4) Position Y
5) Crop With
6) Crop Height

return true if success, false if failed
```

#### AI Classifier Options (since v1.119)

**ImageLib AI Classifier requires darknet to operate normally. If your ArozOS is a trim down version or using a host architecture that ArozOS did not ship with a valid darknet binary executable in ```system/neuralnet/``` folder, this will always return```false```.**

```
Classify allow the following classifier options

1) default / darknet19
2) yolo3
```

The output of the classifier will output the followings

```
Name (string, the name of object detected)
Percentage (float, the confidence of detection)
Positions (integer array, the pixel location of the detected object in left, top, width, height sequence)
```

Here is an example code for parsing the output, or you can also directly pass it into the JSON stringify and process it on frontend

```javascript
//Get image classification, will take a bit time 
var results = imagelib.classify("tmp:/classify.jpg"); 
    var responses = [];
    for (var i = 0; i < results.length; i++){
        responses.push({
            "object": results[i].Name,
            "confidence": results[i].Percentage,
            "position_x": results[i].Positions[0],
            "position_y": results[i].Positions[1],
            "width": results[i].Positions[2],
            "height": results[i].Positions[3]
        });
    }
```
