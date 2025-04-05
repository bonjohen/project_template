/**
 * Tests for the sample module.
 */

const { hello, createUser } = require('../src/index');

describe('hello function', function() {
  test('returns correct greeting', function() {
    expect(hello('World')).toBe('Hello, World!');
    expect(hello('JavaScript')).toBe('Hello, JavaScript!');
  });
});

describe('createUser function', function() {
  test('creates user with required properties', function() {
    const user = createUser('John Doe');
    expect(user).toHaveProperty('id');
    expect(user.name).toBe('John Doe');
    expect(user.email).toBeUndefined();
  });

  test('creates user with optional email', function() {
    const user = createUser('Jane Doe', 'jane@example.com');
    expect(user).toHaveProperty('id');
    expect(user.name).toBe('Jane Doe');
    expect(user.email).toBe('jane@example.com');
  });
});
