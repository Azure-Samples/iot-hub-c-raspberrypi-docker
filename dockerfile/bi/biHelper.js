/*
* Gulp Common - Microsoft Sample Code - Copyright (c) 2016 - Licensed MIT
*/
'use strict';

var bi = require('az-iot-bi');
var readlineSync = require('readline-sync');
var fsExtra = require('fs-extra');
var crypto = require('crypto');

var biHelper = {};
var biSettingDir = '/repo/.bi';

biHelper.trackEvent = function(eventName, properties) {
  fsExtra.ensureDirSync(biSettingDir);

  bi.start('', biSettingDir);
    
  bi.trackEvent(eventName, properties);
    
  bi.flush();
}

biHelper.getMd5Hash = function (inputValue) {
  var md5sum = crypto.createHash('md5');
  md5sum.update(inputValue);
  return md5sum.digest('hex');
}

module.exports = biHelper



