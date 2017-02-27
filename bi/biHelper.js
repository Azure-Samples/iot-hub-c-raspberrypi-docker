/*
* Gulp Common - Microsoft Sample Code - Copyright (c) 2016 - Licensed MIT
*/
'use strict';

var bi = require('az-iot-bi');
var readlineSync = require('readline-sync');

var biHelper = {};

biHelper.trackEvent = function(eventName, properties) {
    bi.start();
    
    bi.trackEvent(eventName, properties);
    
    bi.flush();
}

module.exports = biHelper



