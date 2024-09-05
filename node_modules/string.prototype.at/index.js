'use strict';

var define = require('define-properties');
var RequireObjectCoercible = require('es-object-atoms/RequireObjectCoercible');
var callBind = require('call-bind');

var implementation = require('./implementation');

var getPolyfill = require('./polyfill');
var bound = callBind(getPolyfill());

var shim = require('./shim');

var boundShim = function at(string, index) {
	RequireObjectCoercible(string);
	return bound(string, index);
};
define(boundShim, {
	getPolyfill: getPolyfill,
	implementation: implementation,
	shim: shim
});

module.exports = boundShim;
