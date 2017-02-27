'use strict'

var biHelper = require('./biHelper.js');

var device = process.argv[2];
var event = process.argv[3];

var properties = {};
properties.device = device;
biHelper.trackEvent(event, properties);
