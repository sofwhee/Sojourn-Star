'use strict';

var bound = require('../');
var test = require('tape');
var runTests = require('./tests');

test('as a function', function (t) {
	t.test('bad array/this value', function (st) {
		st['throws'](bound.bind(null, undefined, function () {}), TypeError, 'undefined is not an object');
		st['throws'](bound.bind(null, null, function () {}), TypeError, 'null is not an object');
		st.end();
	});

	runTests(bound, t);

	t.end();
});
