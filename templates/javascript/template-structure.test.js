/**
 * Tests to validate that the JavaScript project follows the template structure.
 */

const fs = require('fs');
const path = require('path');

describe('Project structure validation', function() {
  test('has required directories', function() {
    expect(fs.existsSync('src')).toBe(true);
    expect(fs.existsSync('tests')).toBe(true);
    expect(fs.existsSync('docs')).toBe(true);
  });

  test('has required configuration files', function() {
    expect(fs.existsSync('package.json')).toBe(true);
    expect(fs.existsSync('.eslintrc.json')).toBe(true);
    expect(fs.existsSync('.prettierrc.json')).toBe(true);
    expect(fs.existsSync('.gitignore')).toBe(true);
  });

  test('has sample module', function() {
    expect(fs.existsSync('src/index.js')).toBe(true);
    const indexContent = fs.readFileSync('src/index.js', 'utf8');
    expect(indexContent).toContain('function hello');
  });

  test('has sample test', function() {
    expect(fs.existsSync('tests/index.test.js')).toBe(true);
    const testContent = fs.readFileSync('tests/index.test.js', 'utf8');
    expect(testContent).toContain('describe');
    expect(testContent).toContain('test');
  });
});
