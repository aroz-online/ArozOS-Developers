---
title: '◼️ User Space Exec (Serverless)'
weight: 203
---

When an agi script is executed in user serverless scope, developer can utilize the filelib with JavaScript build in ```eval()``` function to make some fun use of dynamic script importing.

### Import and Execution in User Space

Here is an example of importing moment.min.js and execute it in user space.

```js
requirelib("filelib");

var momentLib = filelib.readFile("user:/moment.min.js");
eval(momentLib);
```

*Note that when paired with the http library, this might cause some security issues. That is why the ARZ Serverless app will remind you not to include untrusted script into the library to prevent any illegal access or attack from happening to your server.*

