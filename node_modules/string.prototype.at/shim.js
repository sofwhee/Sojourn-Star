'use strict';

var define = require('define-properties');
var getPolyfill = require('./polyfill');

module.exports = function shimStringPrototypeAt() {
	var polyfill = getPolyfill();
	define(
		String.prototype,
		{ at: polyfill },
		{ at: function () { return String.prototype.at !== polyfill; } }
	);
	return polyfill;
};
