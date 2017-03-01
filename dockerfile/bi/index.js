'use strict'

var biHelper = require('./biHelper.js');

var device = process.argv[2];
var event = process.argv[3];
var mac = process.argv[4];

var properties = {};
properties.device = device;
properties.devicemac = mac;
biHelper.trackEvent(event, properties);
