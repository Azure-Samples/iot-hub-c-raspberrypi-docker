'use strict'

var biHelper = require('./biHelper.js');

var device = process.argv[2];
var event = process.argv[3];

var properties = {};
properties.board = device;

if (process.argv[4]) {
  var mac = process.argv[4];
  properties.boardmac = biHelper.getMd5Hash(mac);  
}
biHelper.trackEvent(event, properties);
