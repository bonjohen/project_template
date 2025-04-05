import fs from 'fs';
import path from 'path';

describe('Project structure validation', () => {
  it('has required directories', () => {
    expect(fs.existsSync('src')).toBe(true);
    expect(fs.existsSync('src/app')).toBe(true);
    expect(fs.existsSync('src/components')).toBe(true);
    expect(fs.existsSync('src/lib')).toBe(true);
    expect(fs.existsSync('src/styles')).toBe(true);
    expect(fs.existsSync('public')).toBe(true);
    expect(fs.existsSync('tests')).toBe(true);
  });

  it('has required configuration files', () => {
    expect(fs.existsSync('package.json')).toBe(true);
    expect(fs.existsSync('tsconfig.json')).toBe(true);
    expect(fs.existsSync('next.config.js')).toBe(true);
    expect(fs.existsSync('.eslintrc.json')).toBe(true);
    expect(fs.existsSync('.prettierrc.json')).toBe(true);
    expect(fs.existsSync('jest.config.js')).toBe(true);
    expect(fs.existsSync('tailwind.config.js')).toBe(true);
    expect(fs.existsSync('postcss.config.js')).toBe(true);
  });

  it('has required app files', () => {
    expect(fs.existsSync('src/app/layout.tsx')).toBe(true);
    expect(fs.existsSync('src/app/page.tsx')).toBe(true);
  });

  it('has required component files', () => {
    expect(fs.existsSync('src/components/ui/Button.tsx')).toBe(true);
  });

  it('has required style files', () => {
    expect(fs.existsSync('src/styles/globals.css')).toBe(true);
  });
});
