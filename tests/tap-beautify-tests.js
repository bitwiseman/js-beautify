/*global js_beautify: true */
/*jshint node:true */

var node_beautifier_tests = require('./node-beautify-tests').node_beautifier_tests,
    test = require('tape');

test("Verify beautify.js functionality", function(t) {
    var results = node_beautifier_tests();
    t.ok(results.get_exitcode() === 0, "Exit code should be 0");
    t.end();
});

