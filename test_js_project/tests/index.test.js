/**  
 * Tests for the sample module. 
 */ 
 
const { hello } = require('../src/index'); 
 
describe('hello function', () =
  test('returns correct greeting', () =
    expect(hello('World')).toBe('Hello, World'); 
    expect(hello('JavaScript')).toBe('Hello, JavaScript'); 
  }); 
}); 
