'use strict';

module.exports = function (at, t) {
	t.test('strings', function (st) {
		st.equal(at('abc', 0), 'a');
		st.equal(at('abc', -3), 'a');

		st.equal(at('abc', 1), 'b');
		st.equal(at('abc', -2), 'b');

		st.equal(at('abc', 2), 'c');
		st.equal(at('abc', -1), 'c');

		st.equal(at('abc', 3), undefined);
		st.equal(at('abc', -4), undefined);

		st.equal(at('abc', Infinity), undefined);
		st.equal(at('abc', -Infinity), undefined);

		st.end();
	});
};
