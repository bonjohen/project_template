/**
 * Tests to validate that the TypeScript project follows the template structure.
 */

import * as fs from 'fs';
import * as path from 'path';

describe('Project structure validation', () => {
  test('has required directories', () => {
    expect(fs.existsSync('src')).toBe(true);
    expect(fs.existsSync('dist')).toBe(true);
    expect(fs.existsSync('tests')).toBe(true);
    expect(fs.existsSync('docs')).toBe(true);
    expect(fs.existsSync('types')).toBe(true);
  });

  test('has required configuration files', () => {
    expect(fs.existsSync('package.json')).toBe(true);
    expect(fs.existsSync('tsconfig.json')).toBe(true);
    expect(fs.existsSync('jest.config.js')).toBe(true);
    expect(fs.existsSync('.eslintrc.json')).toBe(true);
    expect(fs.existsSync('.prettierrc.json')).toBe(true);
    expect(fs.existsSync('.gitignore')).toBe(true);
  });

  test('has sample TypeScript module', () => {
    expect(fs.existsSync('src/index.ts')).toBe(true);
    const indexContent = fs.readFileSync('src/index.ts', 'utf8');
    expect(indexContent).toContain('export function hello');
    expect(indexContent).toContain('export interface User');
  });

  test('has sample TypeScript test', () => {
    expect(fs.existsSync('tests/index.test.ts')).toBe(true);
    const testContent = fs.readFileSync('tests/index.test.ts', 'utf8');
    expect(testContent).toContain('import { hello');
    expect(testContent).toContain('describe(');
    expect(testContent).toContain('test(');
  });
});
