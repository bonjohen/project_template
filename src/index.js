/**
 * Sample module.
 */

/**
 * Return a greeting message.
 * @param {string} name - The name to greet.
 * @returns {string} A greeting message.
 */
function hello(name) {
  return `Hello, ${name}!`;
}

// Export functions for use in other modules
module.exports = {
  hello,
};
