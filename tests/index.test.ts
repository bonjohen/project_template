/**  
 * Tests for the sample TypeScript module. 
 */ 
 
import { hello, createUser, User } from '../src/index'; 
 
describe('hello function', () => {
  test('returns correct greeting', () => {
    expect(hello('World')).toBe('Hello, World!'); 
    expect(hello('TypeScript')).toBe('Hello, TypeScript!'); 
  }); 
}); 
 
describe('createUser function', () => {
  test('creates user with required properties', () => {
    const user1 = createUser('John Doe'); 
    expect(user1).toHaveProperty('id'); 
    expect(user1.name).toBe('John Doe'); 
    expect(user1.email).toBeUndefined(); 
  }); 
 
  test('creates user with optional email', () => {
    const user2 = createUser('Jane Doe', 'jane@example.com'); 
    expect(user2).toHaveProperty('id'); 
    expect(user2.name).toBe('Jane Doe'); 
    expect(user2.email).toBe('jane@example.com'); 
  }); 
});
