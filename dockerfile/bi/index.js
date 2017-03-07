'use strict'

var biHelper = require('./biHelper.js');

var event = process.argv[2];

var properties = {};
process.argv.forEach(function(val, index, array){
  if (index < 3) {
    return;
  }
  
  var res = val.split(':');

  if (res.length != 2) {
    console.log(`invalid argument: ${val}` );
    return 1;
  }
  properties[res[0]] = res[1];
})

biHelper.trackEvent(event, properties);