/*
* Gulp Common - Microsoft Sample Code - Copyright (c) 2016 - Licensed MIT
*/
'use strict';

var bi = require('az-iot-bi');
var readlineSync = require('readline-sync');
var fsExtra = require('fs-extra');

var biHelper = {};
var biSettingDir = '/repo/.bi';

biHelper.trackEvent = function(eventName, properties) {
    fsExtra.ensureDirSync(biSettingDir);

    bi.start('', biSettingDir);
    
    bi.trackEvent(eventName, properties);
    
    bi.flush();
}

module.exports = biHelper



