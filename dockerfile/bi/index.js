'use strict'

var biHelper = require('./biHelper.js');

var device = process.argv[2];
var event = process.argv[3];

var properties = {};
properties.board = device;

if (process.argv[4]) {
  var formattedMac = process.argv[4].toUpperCase().replace(/:/g, '-'); 
  properties.boardmac = biHelper.getSha256Hash(formattedMac);  
}
biHelper.trackEvent(event, properties);
