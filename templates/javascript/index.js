/**
 * Sample module.
 */

/**
 * Returns a greeting message.
 * @param {string} name - The name to greet.
 * @returns {string} A greeting message.
 */
function hello(name) {
  return `Hello, ${name}!`;
}

/**
 * Creates a user object.
 * @param {string} name - The user's name.
 * @param {string} [email] - The user's email (optional).
 * @returns {Object} A user object.
 */
function createUser(name, email) {
  return {
    id: Math.floor(Math.random() * 1000),
    name,
    ...(email ? { email } : {}),
  };
}

module.exports = {
  hello,
  createUser,
};

// If this file is run directly
if (require.main === module) {
  console.log(hello('JavaScript'));
  console.log(createUser('John Doe', 'john@example.com'));
}
