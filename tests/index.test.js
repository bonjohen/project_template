/**
 * Tests for the sample module.
 */

const { hello } = require('../src/index');

describe('hello function', function() {
  test('returns correct greeting', function() {
    expect(hello('World')).toBe('Hello, World!');
    expect(hello('JavaScript')).toBe('Hello, JavaScript!');
  });
});
