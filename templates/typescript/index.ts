/**
 * Sample TypeScript module.
 */

/**
 * User interface representing a user in the system.
 */
export interface User {
  id: string;
  name: string;
  email?: string;
}

/**
 * Return a greeting message.
 * @param name - The name to greet.
 * @returns A greeting message.
 */
export function hello(name: string): string {
  return `Hello, ${name}!`;
}

/**
 * Create a new user with the given name and optional email.
 * 
 * @param name - The user's name
 * @param email - The user's email (optional)
 * @returns A new User object
 */
export function createUser(name: string, email?: string): User {
  return {
    id: Math.random().toString(36).substring(2, 9),
    name,
    email
  };
}

// If this file is run directly
if (require.main === module) {
  console.log(hello('TypeScript'));
  console.log(createUser('John Doe', 'john@example.com'));
}
