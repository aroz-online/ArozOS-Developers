---
title: '🔸 serverless'
weight: 53
---

Serverless function are only usable in serverless execution scope. Developers can access agi and do dynamic programming via external agi call using ARZ Serverless panel. The following APIs allow devs to access GET, POST parameters and request Body on demand.

#### CONST

```
REQ_METHOD //Get the method of request, e.g. GET / HEAD / POST
```

#### FUNCTIONS

```
getPara(key) //Return the GET value of given key
postPara(key) //Return the POST value of given key
readBody() //Get the whole request body as string
```

##### Notes

- These functions are only usable when called via the ARZ Serverless endpoints (URI start from ```/api/remote/```)

- When there is an invalid operations or undefined keys, these functions always return null as default.
