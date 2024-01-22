---
title: '◼️ Telegram Bot (Serverless)'
weight: 202
---

agi when paired with serverless function, it can be used to handle external HTTP request like a webhook server does.

### Telegram Bot

Telegram bot is one of the example in which serverless can be used to generate an integrative bot that works in telegram to automate some commands or sending stickers. Here is an example code for such usage. To use this, you will need to add this script to ARZ Serverless app and create an external request link for this script.

```js
requirelib("http");

var a = JSON.parse(readBody());
var botId = "your_bot_id_here";
var id;

id = a.message.chat.id;
var message = a.message.text;
var repliedMsg = "";
var repliedId = "";
console.log(id);

if(a.message.reply_to_message != undefined) {
    if(a.message.reply_to_message.text != undefined) {
        repliedMsg = a.message.reply_to_message.text;
        repliedId = a.message.reply_to_message.from.id;
    }
}

// normal message handling
if (message.indexOf("/hello") == 0) {
   sendMessage("Hello world");
}

function sendMessage(text, parameter) {
    //console.log(text);
    var parameterIn = parameter != undefined ? parameter : "";
    http.get("https://api.telegram.org/bot" + botId + "/sendMessage?chat_id=" + id + "&disable_web_page_preview=true&disable_notification=true&text=" + encodeURIComponent(text) + parameterIn);
}

function sendSticker(sticker, parameter) {
    //console.log(text);
    var parameterIn = parameter != undefined ? parameter : "";
    http.get("https://api.telegram.org/bot" + botId + "/sendSticker?chat_id=" + id + "&disable_notification=true&sticker=" + sticker + parameterIn);
}

sendOK();

```

