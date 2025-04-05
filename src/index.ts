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
 
if (require.main === module) { 
  console.log(hello('TypeScript')); 
  console.log(createUser('John Doe')); 
}
