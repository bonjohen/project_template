@echo off
setlocal enabledelayedexpansion

REM Check if project name is provided
if "%~1"=="" (
    echo ERROR: Please provide a project name.
    echo Usage: rnjsproject.cmd project_name
    exit /b 1
)

set PROJECT_NAME=%~1

REM Check if we're already in a directory with the project name
if "%CD:~-\%PROJECT_NAME%"=="%PROJECT_NAME%" (
    echo Already in %PROJECT_NAME% directory.
    set PROJECT_DIR=%CD%
    goto continue_setup
)

REM Check if project directory exists
if exist "%PROJECT_NAME%\" (
    echo %PROJECT_NAME% directory already exists.
    echo Navigating to existing directory...
    cd "%PROJECT_NAME%"
    set PROJECT_DIR=%CD%
    goto continue_setup
)

REM Create and navigate to project directory
echo Creating %PROJECT_NAME% directory...
mkdir "%PROJECT_NAME%"
cd "%PROJECT_NAME%"
set PROJECT_DIR=%CD%

:continue_setup
echo Setting up React/Next.js project in: %PROJECT_DIR%

REM Create project directory structure
echo Creating directory structure...
mkdir "%PROJECT_DIR%\src"
mkdir "%PROJECT_DIR%\src\app"
mkdir "%PROJECT_DIR%\src\components"
mkdir "%PROJECT_DIR%\src\components\ui"
mkdir "%PROJECT_DIR%\src\lib"
mkdir "%PROJECT_DIR%\src\styles"
mkdir "%PROJECT_DIR%\public"
mkdir "%PROJECT_DIR%\tests"
mkdir "%PROJECT_DIR%\tests\components"
mkdir "%PROJECT_DIR%\tests\components\ui"
mkdir "%PROJECT_DIR%\tests\app"
mkdir "%PROJECT_DIR%\docs"

REM Create package.json
echo Creating package.json...
echo { > "%PROJECT_DIR%\package.json"
echo   "name": "%PROJECT_NAME%", >> "%PROJECT_DIR%\package.json"
echo   "version": "0.1.0", >> "%PROJECT_DIR%\package.json"
echo   "private": true, >> "%PROJECT_DIR%\package.json"
echo   "scripts": { >> "%PROJECT_DIR%\package.json"
echo     "dev": "next dev", >> "%PROJECT_DIR%\package.json"
echo     "build": "next build", >> "%PROJECT_DIR%\package.json"
echo     "start": "next start", >> "%PROJECT_DIR%\package.json"
echo     "lint": "next lint", >> "%PROJECT_DIR%\package.json"
echo     "test": "jest", >> "%PROJECT_DIR%\package.json"
echo     "test:watch": "jest --watch", >> "%PROJECT_DIR%\package.json"
echo     "test:coverage": "jest --coverage" >> "%PROJECT_DIR%\package.json"
echo   }, >> "%PROJECT_DIR%\package.json"
echo   "dependencies": { >> "%PROJECT_DIR%\package.json"
echo     "next": "^14.0.0", >> "%PROJECT_DIR%\package.json"
echo     "react": "^18.2.0", >> "%PROJECT_DIR%\package.json"
echo     "react-dom": "^18.2.0" >> "%PROJECT_DIR%\package.json"
echo   }, >> "%PROJECT_DIR%\package.json"
echo   "devDependencies": { >> "%PROJECT_DIR%\package.json"
echo     "@testing-library/jest-dom": "^6.1.0", >> "%PROJECT_DIR%\package.json"
echo     "@testing-library/react": "^14.0.0", >> "%PROJECT_DIR%\package.json"
echo     "@types/jest": "^29.5.0", >> "%PROJECT_DIR%\package.json"
echo     "@types/node": "^20.0.0", >> "%PROJECT_DIR%\package.json"
echo     "@types/react": "^18.2.0", >> "%PROJECT_DIR%\package.json"
echo     "@types/react-dom": "^18.2.0", >> "%PROJECT_DIR%\package.json"
echo     "autoprefixer": "^10.4.0", >> "%PROJECT_DIR%\package.json"
echo     "eslint": "^8.0.0", >> "%PROJECT_DIR%\package.json"
echo     "eslint-config-next": "^14.0.0", >> "%PROJECT_DIR%\package.json"
echo     "jest": "^29.0.0", >> "%PROJECT_DIR%\package.json"
echo     "jest-environment-jsdom": "^29.0.0", >> "%PROJECT_DIR%\package.json"
echo     "postcss": "^8.4.0", >> "%PROJECT_DIR%\package.json"
echo     "prettier": "^3.0.0", >> "%PROJECT_DIR%\package.json"
echo     "tailwindcss": "^3.3.0", >> "%PROJECT_DIR%\package.json"
echo     "typescript": "^5.0.0" >> "%PROJECT_DIR%\package.json"
echo   } >> "%PROJECT_DIR%\package.json"
echo } >> "%PROJECT_DIR%\package.json"

REM Create tsconfig.json
echo Creating tsconfig.json...
echo { > "%PROJECT_DIR%\tsconfig.json"
echo   "compilerOptions": { >> "%PROJECT_DIR%\tsconfig.json"
echo     "target": "es5", >> "%PROJECT_DIR%\tsconfig.json"
echo     "lib": ["dom", "dom.iterable", "esnext"], >> "%PROJECT_DIR%\tsconfig.json"
echo     "allowJs": true, >> "%PROJECT_DIR%\tsconfig.json"
echo     "skipLibCheck": true, >> "%PROJECT_DIR%\tsconfig.json"
echo     "strict": true, >> "%PROJECT_DIR%\tsconfig.json"
echo     "noEmit": true, >> "%PROJECT_DIR%\tsconfig.json"
echo     "esModuleInterop": true, >> "%PROJECT_DIR%\tsconfig.json"
echo     "module": "esnext", >> "%PROJECT_DIR%\tsconfig.json"
echo     "moduleResolution": "bundler", >> "%PROJECT_DIR%\tsconfig.json"
echo     "resolveJsonModule": true, >> "%PROJECT_DIR%\tsconfig.json"
echo     "isolatedModules": true, >> "%PROJECT_DIR%\tsconfig.json"
echo     "jsx": "preserve", >> "%PROJECT_DIR%\tsconfig.json"
echo     "incremental": true, >> "%PROJECT_DIR%\tsconfig.json"
echo     "plugins": [ >> "%PROJECT_DIR%\tsconfig.json"
echo       { >> "%PROJECT_DIR%\tsconfig.json"
echo         "name": "next" >> "%PROJECT_DIR%\tsconfig.json"
echo       } >> "%PROJECT_DIR%\tsconfig.json"
echo     ], >> "%PROJECT_DIR%\tsconfig.json"
echo     "paths": { >> "%PROJECT_DIR%\tsconfig.json"
echo       "@/*": ["./src/*"] >> "%PROJECT_DIR%\tsconfig.json"
echo     } >> "%PROJECT_DIR%\tsconfig.json"
echo   }, >> "%PROJECT_DIR%\tsconfig.json"
echo   "include": ["next-env.d.ts", "**/*.ts", "**/*.tsx", ".next/types/**/*.ts"], >> "%PROJECT_DIR%\tsconfig.json"
echo   "exclude": ["node_modules"] >> "%PROJECT_DIR%\tsconfig.json"
echo } >> "%PROJECT_DIR%\tsconfig.json"

REM Create next.config.js
echo Creating next.config.js...
echo /** @type {import('next').NextConfig} */ > "%PROJECT_DIR%\next.config.js"
echo const nextConfig = { >> "%PROJECT_DIR%\next.config.js"
echo   reactStrictMode: true, >> "%PROJECT_DIR%\next.config.js"
echo   swcMinify: true, >> "%PROJECT_DIR%\next.config.js"
echo }; >> "%PROJECT_DIR%\next.config.js"
echo. >> "%PROJECT_DIR%\next.config.js"
echo module.exports = nextConfig; >> "%PROJECT_DIR%\next.config.js"

REM Create .eslintrc.json
echo Creating .eslintrc.json...
echo { > "%PROJECT_DIR%\.eslintrc.json"
echo   "extends": [ >> "%PROJECT_DIR%\.eslintrc.json"
echo     "next/core-web-vitals", >> "%PROJECT_DIR%\.eslintrc.json"
echo     "eslint:recommended", >> "%PROJECT_DIR%\.eslintrc.json"
echo     "plugin:@typescript-eslint/recommended" >> "%PROJECT_DIR%\.eslintrc.json"
echo   ], >> "%PROJECT_DIR%\.eslintrc.json"
echo   "parser": "@typescript-eslint/parser", >> "%PROJECT_DIR%\.eslintrc.json"
echo   "plugins": ["@typescript-eslint"], >> "%PROJECT_DIR%\.eslintrc.json"
echo   "rules": { >> "%PROJECT_DIR%\.eslintrc.json"
echo     "react/react-in-jsx-scope": "off", >> "%PROJECT_DIR%\.eslintrc.json"
echo     "react/prop-types": "off" >> "%PROJECT_DIR%\.eslintrc.json"
echo   } >> "%PROJECT_DIR%\.eslintrc.json"
echo } >> "%PROJECT_DIR%\.eslintrc.json"

REM Create .prettierrc.json
echo Creating .prettierrc.json...
echo { > "%PROJECT_DIR%\.prettierrc.json"
echo   "semi": true, >> "%PROJECT_DIR%\.prettierrc.json"
echo   "singleQuote": true, >> "%PROJECT_DIR%\.prettierrc.json"
echo   "tabWidth": 2, >> "%PROJECT_DIR%\.prettierrc.json"
echo   "printWidth": 80, >> "%PROJECT_DIR%\.prettierrc.json"
echo   "trailingComma": "es5", >> "%PROJECT_DIR%\.prettierrc.json"
echo   "arrowParens": "always" >> "%PROJECT_DIR%\.prettierrc.json"
echo } >> "%PROJECT_DIR%\.prettierrc.json"

REM Create jest.config.js
echo Creating jest.config.js...
echo const nextJest = require('next/jest'); > "%PROJECT_DIR%\jest.config.js"
echo. >> "%PROJECT_DIR%\jest.config.js"
echo const createJestConfig = nextJest({ >> "%PROJECT_DIR%\jest.config.js"
echo   // Provide the path to your Next.js app to load next.config.js and .env files in your test environment >> "%PROJECT_DIR%\jest.config.js"
echo   dir: './', >> "%PROJECT_DIR%\jest.config.js"
echo }); >> "%PROJECT_DIR%\jest.config.js"
echo. >> "%PROJECT_DIR%\jest.config.js"
echo // Add any custom config to be passed to Jest >> "%PROJECT_DIR%\jest.config.js"
echo const customJestConfig = { >> "%PROJECT_DIR%\jest.config.js"
echo   setupFilesAfterEnv: ['<rootDir>/jest.setup.js'], >> "%PROJECT_DIR%\jest.config.js"
echo   testEnvironment: 'jest-environment-jsdom', >> "%PROJECT_DIR%\jest.config.js"
echo   moduleNameMapper: { >> "%PROJECT_DIR%\jest.config.js"
echo     '^@/(.*)$': '<rootDir>/src/$1', >> "%PROJECT_DIR%\jest.config.js"
echo   }, >> "%PROJECT_DIR%\jest.config.js"
echo   testPathIgnorePatterns: ['<rootDir>/node_modules/', '<rootDir>/.next/'], >> "%PROJECT_DIR%\jest.config.js"
echo   collectCoverageFrom: [ >> "%PROJECT_DIR%\jest.config.js"
echo     'src/**/*.{js,jsx,ts,tsx}', >> "%PROJECT_DIR%\jest.config.js"
echo     '!src/**/*.d.ts', >> "%PROJECT_DIR%\jest.config.js"
echo     '!**/node_modules/**', >> "%PROJECT_DIR%\jest.config.js"
echo   ], >> "%PROJECT_DIR%\jest.config.js"
echo }; >> "%PROJECT_DIR%\jest.config.js"
echo. >> "%PROJECT_DIR%\jest.config.js"
echo // createJestConfig is exported this way to ensure that next/jest can load the Next.js config which is async >> "%PROJECT_DIR%\jest.config.js"
echo module.exports = createJestConfig(customJestConfig); >> "%PROJECT_DIR%\jest.config.js"

REM Create jest.setup.js
echo Creating jest.setup.js...
echo // Learn more: https://github.com/testing-library/jest-dom > "%PROJECT_DIR%\jest.setup.js"
echo import '@testing-library/jest-dom'; >> "%PROJECT_DIR%\jest.setup.js"

REM Create postcss.config.js
echo Creating postcss.config.js...
echo module.exports = { > "%PROJECT_DIR%\postcss.config.js"
echo   plugins: { >> "%PROJECT_DIR%\postcss.config.js"
echo     tailwindcss: {}, >> "%PROJECT_DIR%\postcss.config.js"
echo     autoprefixer: {}, >> "%PROJECT_DIR%\postcss.config.js"
echo   }, >> "%PROJECT_DIR%\postcss.config.js"
echo }; >> "%PROJECT_DIR%\postcss.config.js"

REM Create tailwind.config.js
echo Creating tailwind.config.js...
echo /** @type {import('tailwindcss').Config} */ > "%PROJECT_DIR%\tailwind.config.js"
echo module.exports = { >> "%PROJECT_DIR%\tailwind.config.js"
echo   content: [ >> "%PROJECT_DIR%\tailwind.config.js"
echo     './src/pages/**/*.{js,ts,jsx,tsx,mdx}', >> "%PROJECT_DIR%\tailwind.config.js"
echo     './src/components/**/*.{js,ts,jsx,tsx,mdx}', >> "%PROJECT_DIR%\tailwind.config.js"
echo     './src/app/**/*.{js,ts,jsx,tsx,mdx}', >> "%PROJECT_DIR%\tailwind.config.js"
echo   ], >> "%PROJECT_DIR%\tailwind.config.js"
echo   theme: { >> "%PROJECT_DIR%\tailwind.config.js"
echo     extend: {}, >> "%PROJECT_DIR%\tailwind.config.js"
echo   }, >> "%PROJECT_DIR%\tailwind.config.js"
echo   plugins: [], >> "%PROJECT_DIR%\tailwind.config.js"
echo }; >> "%PROJECT_DIR%\tailwind.config.js"

REM Create global CSS file
echo Creating global CSS file...
echo @tailwind base; > "%PROJECT_DIR%\src\styles\globals.css"
echo @tailwind components; >> "%PROJECT_DIR%\src\styles\globals.css"
echo @tailwind utilities; >> "%PROJECT_DIR%\src\styles\globals.css"
echo. >> "%PROJECT_DIR%\src\styles\globals.css"
echo :root { >> "%PROJECT_DIR%\src\styles\globals.css"
echo   --foreground-rgb: 0, 0, 0; >> "%PROJECT_DIR%\src\styles\globals.css"
echo   --background-rgb: 255, 255, 255; >> "%PROJECT_DIR%\src\styles\globals.css"
echo } >> "%PROJECT_DIR%\src\styles\globals.css"
echo. >> "%PROJECT_DIR%\src\styles\globals.css"
echo @media (prefers-color-scheme: dark) { >> "%PROJECT_DIR%\src\styles\globals.css"
echo   :root { >> "%PROJECT_DIR%\src\styles\globals.css"
echo     --foreground-rgb: 255, 255, 255; >> "%PROJECT_DIR%\src\styles\globals.css"
echo     --background-rgb: 0, 0, 0; >> "%PROJECT_DIR%\src\styles\globals.css"
echo   } >> "%PROJECT_DIR%\src\styles\globals.css"
echo } >> "%PROJECT_DIR%\src\styles\globals.css"
echo. >> "%PROJECT_DIR%\src\styles\globals.css"
echo body { >> "%PROJECT_DIR%\src\styles\globals.css"
echo   color: rgb(var(--foreground-rgb)); >> "%PROJECT_DIR%\src\styles\globals.css"
echo   background: rgb(var(--background-rgb)); >> "%PROJECT_DIR%\src\styles\globals.css"
echo } >> "%PROJECT_DIR%\src\styles\globals.css"

REM Create layout.tsx
echo Creating layout.tsx...
echo import '../styles/globals.css'; > "%PROJECT_DIR%\src\app\layout.tsx"
echo import type { Metadata } from 'next'; >> "%PROJECT_DIR%\src\app\layout.tsx"
echo. >> "%PROJECT_DIR%\src\app\layout.tsx"
echo export const metadata: Metadata = { >> "%PROJECT_DIR%\src\app\layout.tsx"
echo   title: '%PROJECT_NAME%', >> "%PROJECT_DIR%\src\app\layout.tsx"
echo   description: 'Created with Next.js', >> "%PROJECT_DIR%\src\app\layout.tsx"
echo }; >> "%PROJECT_DIR%\src\app\layout.tsx"
echo. >> "%PROJECT_DIR%\src\app\layout.tsx"
echo export default function RootLayout({ >> "%PROJECT_DIR%\src\app\layout.tsx"
echo   children, >> "%PROJECT_DIR%\src\app\layout.tsx"
echo }: { >> "%PROJECT_DIR%\src\app\layout.tsx"
echo   children: React.ReactNode; >> "%PROJECT_DIR%\src\app\layout.tsx"
echo }) { >> "%PROJECT_DIR%\src\app\layout.tsx"
echo   return ( >> "%PROJECT_DIR%\src\app\layout.tsx"
echo     ^<html lang="en"^> >> "%PROJECT_DIR%\src\app\layout.tsx"
echo       ^<body^>{children}^</body^> >> "%PROJECT_DIR%\src\app\layout.tsx"
echo     ^</html^> >> "%PROJECT_DIR%\src\app\layout.tsx"
echo   ); >> "%PROJECT_DIR%\src\app\layout.tsx"
echo } >> "%PROJECT_DIR%\src\app\layout.tsx"

REM Create page.tsx
echo Creating page.tsx...
echo import { Button } from '@/components/ui/Button'; > "%PROJECT_DIR%\src\app\page.tsx"
echo. >> "%PROJECT_DIR%\src\app\page.tsx"
echo export default function Home() { >> "%PROJECT_DIR%\src\app\page.tsx"
echo   return ( >> "%PROJECT_DIR%\src\app\page.tsx"
echo     ^<main className="flex min-h-screen flex-col items-center justify-between p-24"^> >> "%PROJECT_DIR%\src\app\page.tsx"
echo       ^<div className="z-10 w-full max-w-5xl items-center justify-between font-mono text-sm"^> >> "%PROJECT_DIR%\src\app\page.tsx"
echo         ^<h1 className="text-4xl font-bold mb-8 text-center"^>Welcome to %PROJECT_NAME%^</h1^> >> "%PROJECT_DIR%\src\app\page.tsx"
echo         ^<p className="text-center mb-8"^>This is a Next.js project with TypeScript, Tailwind CSS, and more.^</p^> >> "%PROJECT_DIR%\src\app\page.tsx"
echo         ^<div className="flex justify-center"^> >> "%PROJECT_DIR%\src\app\page.tsx"
echo           ^<Button^>Get Started^</Button^> >> "%PROJECT_DIR%\src\app\page.tsx"
echo         ^</div^> >> "%PROJECT_DIR%\src\app\page.tsx"
echo       ^</div^> >> "%PROJECT_DIR%\src\app\page.tsx"
echo     ^</main^> >> "%PROJECT_DIR%\src\app\page.tsx"
echo   ); >> "%PROJECT_DIR%\src\app\page.tsx"
echo } >> "%PROJECT_DIR%\src\app\page.tsx"

REM Create Button component
echo Creating Button component...
echo import { ButtonHTMLAttributes, ReactNode } from 'react'; > "%PROJECT_DIR%\src\components\ui\Button.tsx"
echo. >> "%PROJECT_DIR%\src\components\ui\Button.tsx"
echo interface ButtonProps extends ButtonHTMLAttributes<HTMLButtonElement> { >> "%PROJECT_DIR%\src\components\ui\Button.tsx"
echo   children: ReactNode; >> "%PROJECT_DIR%\src\components\ui\Button.tsx"
echo   variant?: 'primary' | 'secondary' | 'outline'; >> "%PROJECT_DIR%\src\components\ui\Button.tsx"
echo } >> "%PROJECT_DIR%\src\components\ui\Button.tsx"
echo. >> "%PROJECT_DIR%\src\components\ui\Button.tsx"
echo export function Button({ >> "%PROJECT_DIR%\src\components\ui\Button.tsx"
echo   children, >> "%PROJECT_DIR%\src\components\ui\Button.tsx"
echo   variant = 'primary', >> "%PROJECT_DIR%\src\components\ui\Button.tsx"
echo   className = '', >> "%PROJECT_DIR%\src\components\ui\Button.tsx"
echo   ...props >> "%PROJECT_DIR%\src\components\ui\Button.tsx"
echo }: ButtonProps) { >> "%PROJECT_DIR%\src\components\ui\Button.tsx"
echo   const baseStyles = 'px-4 py-2 rounded font-medium focus:outline-none focus:ring-2 focus:ring-offset-2'; >> "%PROJECT_DIR%\src\components\ui\Button.tsx"
echo. >> "%PROJECT_DIR%\src\components\ui\Button.tsx"
echo   const variantStyles = { >> "%PROJECT_DIR%\src\components\ui\Button.tsx"
echo     primary: "bg-blue-600 text-white hover:bg-blue-700 focus:ring-blue-500", >> "%PROJECT_DIR%\src\components\ui\Button.tsx"
echo     secondary: "bg-gray-600 text-white hover:bg-gray-700 focus:ring-gray-500", >> "%PROJECT_DIR%\src\components\ui\Button.tsx"
echo     outline: "border border-gray-300 bg-transparent hover:bg-gray-50 focus:ring-gray-500", >> "%PROJECT_DIR%\src\components\ui\Button.tsx"
echo   }; >> "%PROJECT_DIR%\src\components\ui\Button.tsx"
echo. >> "%PROJECT_DIR%\src\components\ui\Button.tsx"
echo   const styles = `${baseStyles} ${variantStyles[variant]} ${className}`; >> "%PROJECT_DIR%\src\components\ui\Button.tsx"
echo. >> "%PROJECT_DIR%\src\components\ui\Button.tsx"
echo   return ( >> "%PROJECT_DIR%\src\components\ui\Button.tsx"
echo     ^<button className={styles} {...props}^> >> "%PROJECT_DIR%\src\components\ui\Button.tsx"
echo       {children} >> "%PROJECT_DIR%\src\components\ui\Button.tsx"
echo     ^</button^> >> "%PROJECT_DIR%\src\components\ui\Button.tsx"
echo   ); >> "%PROJECT_DIR%\src\components\ui\Button.tsx"
echo } >> "%PROJECT_DIR%\src\components\ui\Button.tsx"

REM Create test for Button component
echo Creating test for Button component...
echo import { render, screen } from '@testing-library/react'; > "%PROJECT_DIR%\tests\components\ui\Button.test.tsx"
echo import { Button } from '@/components/ui/Button'; >> "%PROJECT_DIR%\tests\components\ui\Button.test.tsx"
echo. >> "%PROJECT_DIR%\tests\components\ui\Button.test.tsx"
echo describe('Button', () => { >> "%PROJECT_DIR%\tests\components\ui\Button.test.tsx"
echo   it('renders a button with the correct text', () => { >> "%PROJECT_DIR%\tests\components\ui\Button.test.tsx"
echo     render(^<Button^>Click me^</Button^>); >> "%PROJECT_DIR%\tests\components\ui\Button.test.tsx"
echo     const button = screen.getByRole('button', { name: /Click me/i }); >> "%PROJECT_DIR%\tests\components\ui\Button.test.tsx"
echo     expect(button).toBeInTheDocument(); >> "%PROJECT_DIR%\tests\components\ui\Button.test.tsx"
echo   }); >> "%PROJECT_DIR%\tests\components\ui\Button.test.tsx"
echo. >> "%PROJECT_DIR%\tests\components\ui\Button.test.tsx"
echo   it('applies the correct variant styles', () => { >> "%PROJECT_DIR%\tests\components\ui\Button.test.tsx"
echo     render(^<Button variant="secondary"^>Secondary^</Button^>); >> "%PROJECT_DIR%\tests\components\ui\Button.test.tsx"
echo     const button = screen.getByRole('button', { name: /Secondary/i }); >> "%PROJECT_DIR%\tests\components\ui\Button.test.tsx"
echo     expect(button).toHaveClass('bg-gray-600'); >> "%PROJECT_DIR%\tests\components\ui\Button.test.tsx"
echo   }); >> "%PROJECT_DIR%\tests\components\ui\Button.test.tsx"
echo. >> "%PROJECT_DIR%\tests\components\ui\Button.test.tsx"
echo   it('passes additional props to the button element', () => { >> "%PROJECT_DIR%\tests\components\ui\Button.test.tsx"
echo     render(^<Button data-testid="test-button"^>Test^</Button^>); >> "%PROJECT_DIR%\tests\components\ui\Button.test.tsx"
echo     const button = screen.getByTestId('test-button'); >> "%PROJECT_DIR%\tests\components\ui\Button.test.tsx"
echo     expect(button).toBeInTheDocument(); >> "%PROJECT_DIR%\tests\components\ui\Button.test.tsx"
echo   }); >> "%PROJECT_DIR%\tests\components\ui\Button.test.tsx"
echo }); >> "%PROJECT_DIR%\tests\components\ui\Button.test.tsx"

REM Create test for Home page
echo Creating test for Home page...
echo import { render, screen } from '@testing-library/react'; > "%PROJECT_DIR%\tests\app\page.test.tsx"
echo import Home from '@/app/page'; >> "%PROJECT_DIR%\tests\app\page.test.tsx"
echo. >> "%PROJECT_DIR%\tests\app\page.test.tsx"
echo // Mock the Button component to simplify testing >> "%PROJECT_DIR%\tests\app\page.test.tsx"
echo jest.mock('@/components/ui/Button', () => ({ >> "%PROJECT_DIR%\tests\app\page.test.tsx"
echo   Button: ({ children }: { children: React.ReactNode }) => ^<button^>{children}^</button^>, >> "%PROJECT_DIR%\tests\app\page.test.tsx"
echo })); >> "%PROJECT_DIR%\tests\app\page.test.tsx"
echo. >> "%PROJECT_DIR%\tests\app\page.test.tsx"
echo describe('Home page', () => { >> "%PROJECT_DIR%\tests\app\page.test.tsx"
echo   it('renders the welcome heading', () => { >> "%PROJECT_DIR%\tests\app\page.test.tsx"
echo     render(^<Home /^>); >> "%PROJECT_DIR%\tests\app\page.test.tsx"
echo     const heading = screen.getByRole('heading', { name: /Welcome to/i }); >> "%PROJECT_DIR%\tests\app\page.test.tsx"
echo     expect(heading).toBeInTheDocument(); >> "%PROJECT_DIR%\tests\app\page.test.tsx"
echo   }); >> "%PROJECT_DIR%\tests\app\page.test.tsx"
echo. >> "%PROJECT_DIR%\tests\app\page.test.tsx"
echo   it('renders the Get Started button', () => { >> "%PROJECT_DIR%\tests\app\page.test.tsx"
echo     render(^<Home /^>); >> "%PROJECT_DIR%\tests\app\page.test.tsx"
echo     const button = screen.getByRole('button', { name: /Get Started/i }); >> "%PROJECT_DIR%\tests\app\page.test.tsx"
echo     expect(button).toBeInTheDocument(); >> "%PROJECT_DIR%\tests\app\page.test.tsx"
echo   }); >> "%PROJECT_DIR%\tests\app\page.test.tsx"
echo }); >> "%PROJECT_DIR%\tests\app\page.test.tsx"

REM Create template structure test
echo Creating template structure test...
echo import fs from 'fs'; > "%PROJECT_DIR%\tests\template-structure.test.ts"
echo import path from 'path'; >> "%PROJECT_DIR%\tests\template-structure.test.ts"
echo. >> "%PROJECT_DIR%\tests\template-structure.test.ts"
echo describe('Project structure validation', () => { >> "%PROJECT_DIR%\tests\template-structure.test.ts"
echo   it('has required directories', () => { >> "%PROJECT_DIR%\tests\template-structure.test.ts"
echo     expect(fs.existsSync('src')).toBe(true); >> "%PROJECT_DIR%\tests\template-structure.test.ts"
echo     expect(fs.existsSync('src/app')).toBe(true); >> "%PROJECT_DIR%\tests\template-structure.test.ts"
echo     expect(fs.existsSync('src/components')).toBe(true); >> "%PROJECT_DIR%\tests\template-structure.test.ts"
echo     expect(fs.existsSync('src/lib')).toBe(true); >> "%PROJECT_DIR%\tests\template-structure.test.ts"
echo     expect(fs.existsSync('src/styles')).toBe(true); >> "%PROJECT_DIR%\tests\template-structure.test.ts"
echo     expect(fs.existsSync('public')).toBe(true); >> "%PROJECT_DIR%\tests\template-structure.test.ts"
echo     expect(fs.existsSync('tests')).toBe(true); >> "%PROJECT_DIR%\tests\template-structure.test.ts"
echo   }); >> "%PROJECT_DIR%\tests\template-structure.test.ts"
echo. >> "%PROJECT_DIR%\tests\template-structure.test.ts"
echo   it('has required configuration files', () => { >> "%PROJECT_DIR%\tests\template-structure.test.ts"
echo     expect(fs.existsSync('package.json')).toBe(true); >> "%PROJECT_DIR%\tests\template-structure.test.ts"
echo     expect(fs.existsSync('tsconfig.json')).toBe(true); >> "%PROJECT_DIR%\tests\template-structure.test.ts"
echo     expect(fs.existsSync('next.config.js')).toBe(true); >> "%PROJECT_DIR%\tests\template-structure.test.ts"
echo     expect(fs.existsSync('.eslintrc.json')).toBe(true); >> "%PROJECT_DIR%\tests\template-structure.test.ts"
echo     expect(fs.existsSync('.prettierrc.json')).toBe(true); >> "%PROJECT_DIR%\tests\template-structure.test.ts"
echo     expect(fs.existsSync('jest.config.js')).toBe(true); >> "%PROJECT_DIR%\tests\template-structure.test.ts"
echo     expect(fs.existsSync('tailwind.config.js')).toBe(true); >> "%PROJECT_DIR%\tests\template-structure.test.ts"
echo     expect(fs.existsSync('postcss.config.js')).toBe(true); >> "%PROJECT_DIR%\tests\template-structure.test.ts"
echo   }); >> "%PROJECT_DIR%\tests\template-structure.test.ts"
echo. >> "%PROJECT_DIR%\tests\template-structure.test.ts"
echo   it('has required app files', () => { >> "%PROJECT_DIR%\tests\template-structure.test.ts"
echo     expect(fs.existsSync('src/app/layout.tsx')).toBe(true); >> "%PROJECT_DIR%\tests\template-structure.test.ts"
echo     expect(fs.existsSync('src/app/page.tsx')).toBe(true); >> "%PROJECT_DIR%\tests\template-structure.test.ts"
echo   }); >> "%PROJECT_DIR%\tests\template-structure.test.ts"
echo. >> "%PROJECT_DIR%\tests\template-structure.test.ts"
echo   it('has required component files', () => { >> "%PROJECT_DIR%\tests\template-structure.test.ts"
echo     expect(fs.existsSync('src/components/ui/Button.tsx')).toBe(true); >> "%PROJECT_DIR%\tests\template-structure.test.ts"
echo   }); >> "%PROJECT_DIR%\tests\template-structure.test.ts"
echo. >> "%PROJECT_DIR%\tests\template-structure.test.ts"
echo   it('has required style files', () => { >> "%PROJECT_DIR%\tests\template-structure.test.ts"
echo     expect(fs.existsSync('src/styles/globals.css')).toBe(true); >> "%PROJECT_DIR%\tests\template-structure.test.ts"
echo   }); >> "%PROJECT_DIR%\tests\template-structure.test.ts"
echo }); >> "%PROJECT_DIR%\tests\template-structure.test.ts"

REM Create README.md
echo Creating README.md...
echo # %PROJECT_NAME% > "%PROJECT_DIR%\README.md"
echo. >> "%PROJECT_DIR%\README.md"
echo A modern Next.js application with TypeScript, Tailwind CSS, and testing setup. >> "%PROJECT_DIR%\README.md"
echo. >> "%PROJECT_DIR%\README.md"
echo ## Getting Started >> "%PROJECT_DIR%\README.md"
echo. >> "%PROJECT_DIR%\README.md"
echo First, install the dependencies: >> "%PROJECT_DIR%\README.md"
echo. >> "%PROJECT_DIR%\README.md"
echo ```bash >> "%PROJECT_DIR%\README.md"
echo npm install >> "%PROJECT_DIR%\README.md"
echo # or >> "%PROJECT_DIR%\README.md"
echo yarn >> "%PROJECT_DIR%\README.md"
echo # or >> "%PROJECT_DIR%\README.md"
echo pnpm install >> "%PROJECT_DIR%\README.md"
echo ``` >> "%PROJECT_DIR%\README.md"
echo. >> "%PROJECT_DIR%\README.md"
echo Then, run the development server: >> "%PROJECT_DIR%\README.md"
echo. >> "%PROJECT_DIR%\README.md"
echo ```bash >> "%PROJECT_DIR%\README.md"
echo npm run dev >> "%PROJECT_DIR%\README.md"
echo # or >> "%PROJECT_DIR%\README.md"
echo yarn dev >> "%PROJECT_DIR%\README.md"
echo # or >> "%PROJECT_DIR%\README.md"
echo pnpm dev >> "%PROJECT_DIR%\README.md"
echo ``` >> "%PROJECT_DIR%\README.md"
echo. >> "%PROJECT_DIR%\README.md"
echo Open [http://localhost:3000](http://localhost:3000) with your browser to see the result. >> "%PROJECT_DIR%\README.md"
echo. >> "%PROJECT_DIR%\README.md"
echo ## Features >> "%PROJECT_DIR%\README.md"
echo. >> "%PROJECT_DIR%\README.md"
echo - **Next.js 14**: The React framework for production >> "%PROJECT_DIR%\README.md"
echo - **TypeScript**: Static type checking >> "%PROJECT_DIR%\README.md"
echo - **Tailwind CSS**: Utility-first CSS framework >> "%PROJECT_DIR%\README.md"
echo - **ESLint**: Code linting >> "%PROJECT_DIR%\README.md"
echo - **Prettier**: Code formatting >> "%PROJECT_DIR%\README.md"
echo - **Jest & React Testing Library**: Testing framework >> "%PROJECT_DIR%\README.md"
echo. >> "%PROJECT_DIR%\README.md"
echo ## Project Structure >> "%PROJECT_DIR%\README.md"
echo. >> "%PROJECT_DIR%\README.md"
echo ```bash >> "%PROJECT_DIR%\README.md"
echo %PROJECT_NAME%/ >> "%PROJECT_DIR%\README.md"
echo ├── src/ >> "%PROJECT_DIR%\README.md"
echo │   ├── app/ >> "%PROJECT_DIR%\README.md"
echo │   │   ├── layout.tsx # Root layout >> "%PROJECT_DIR%\README.md"
echo │   │   └── page.tsx # Home page >> "%PROJECT_DIR%\README.md"
echo │   ├── components/ >> "%PROJECT_DIR%\README.md"
echo │   │   └── ui/ >> "%PROJECT_DIR%\README.md"
echo │   │       └── Button.tsx # Button component >> "%PROJECT_DIR%\README.md"
echo │   ├── lib/ # Utility functions >> "%PROJECT_DIR%\README.md"
echo │   └── styles/ >> "%PROJECT_DIR%\README.md"
echo │       └── globals.css # Global styles >> "%PROJECT_DIR%\README.md"
echo ├── public/ # Static assets >> "%PROJECT_DIR%\README.md"
echo ├── tests/ # Test files >> "%PROJECT_DIR%\README.md"
echo ├── .eslintrc.json # ESLint configuration >> "%PROJECT_DIR%\README.md"
echo ├── .prettierrc.json # Prettier configuration >> "%PROJECT_DIR%\README.md"
echo ├── jest.config.js # Jest configuration >> "%PROJECT_DIR%\README.md"
echo ├── next.config.js # Next.js configuration >> "%PROJECT_DIR%\README.md"
echo ├── package.json # Dependencies and scripts >> "%PROJECT_DIR%\README.md"
echo ├── postcss.config.js # PostCSS configuration >> "%PROJECT_DIR%\README.md"
echo ├── tailwind.config.js # Tailwind CSS configuration >> "%PROJECT_DIR%\README.md"
echo └── tsconfig.json # TypeScript configuration >> "%PROJECT_DIR%\README.md"
echo ``` >> "%PROJECT_DIR%\README.md"
echo. >> "%PROJECT_DIR%\README.md"
echo ## Available Scripts >> "%PROJECT_DIR%\README.md"
echo. >> "%PROJECT_DIR%\README.md"
echo - `npm run dev` - Run development server >> "%PROJECT_DIR%\README.md"
echo - `npm run build` - Build for production >> "%PROJECT_DIR%\README.md"
echo - `npm run start` - Start production server >> "%PROJECT_DIR%\README.md"
echo - `npm run lint` - Lint code with ESLint >> "%PROJECT_DIR%\README.md"
echo - `npm run test` - Run tests >> "%PROJECT_DIR%\README.md"
echo - `npm run test:watch` - Run tests in watch mode >> "%PROJECT_DIR%\README.md"
echo - `npm run test:coverage` - Run tests with coverage >> "%PROJECT_DIR%\README.md"

REM Create .gitignore
echo Creating .gitignore...
echo # dependencies > "%PROJECT_DIR%\.gitignore"
echo /node_modules >> "%PROJECT_DIR%\.gitignore"
echo /.pnp >> "%PROJECT_DIR%\.gitignore"
echo .pnp.js >> "%PROJECT_DIR%\.gitignore"
echo .yarn/install-state.gz >> "%PROJECT_DIR%\.gitignore"
echo. >> "%PROJECT_DIR%\.gitignore"
echo # testing >> "%PROJECT_DIR%\.gitignore"
echo /coverage >> "%PROJECT_DIR%\.gitignore"
echo. >> "%PROJECT_DIR%\.gitignore"
echo # next.js >> "%PROJECT_DIR%\.gitignore"
echo /.next/ >> "%PROJECT_DIR%\.gitignore"
echo /out/ >> "%PROJECT_DIR%\.gitignore"
echo. >> "%PROJECT_DIR%\.gitignore"
echo # production >> "%PROJECT_DIR%\.gitignore"
echo /build >> "%PROJECT_DIR%\.gitignore"
echo. >> "%PROJECT_DIR%\.gitignore"
echo # misc >> "%PROJECT_DIR%\.gitignore"
echo .DS_Store >> "%PROJECT_DIR%\.gitignore"
echo *.pem >> "%PROJECT_DIR%\.gitignore"
echo. >> "%PROJECT_DIR%\.gitignore"
echo # debug >> "%PROJECT_DIR%\.gitignore"
echo npm-debug.log* >> "%PROJECT_DIR%\.gitignore"
echo yarn-debug.log* >> "%PROJECT_DIR%\.gitignore"
echo yarn-error.log* >> "%PROJECT_DIR%\.gitignore"
echo. >> "%PROJECT_DIR%\.gitignore"
echo # local env files >> "%PROJECT_DIR%\.gitignore"
echo .env*.local >> "%PROJECT_DIR%\.gitignore"
echo. >> "%PROJECT_DIR%\.gitignore"
echo # vercel >> "%PROJECT_DIR%\.gitignore"
echo .vercel >> "%PROJECT_DIR%\.gitignore"
echo. >> "%PROJECT_DIR%\.gitignore"
echo # typescript >> "%PROJECT_DIR%\.gitignore"
echo *.tsbuildinfo >> "%PROJECT_DIR%\.gitignore"
echo next-env.d.ts >> "%PROJECT_DIR%\.gitignore"

REM Create a React/Next.js setup README
echo Creating NEXTJS_SETUP_README.md...
echo # React/Next.js Project Setup Script > "%PROJECT_DIR%\NEXTJS_SETUP_README.md"
echo. >> "%PROJECT_DIR%\NEXTJS_SETUP_README.md"
echo This script automates the creation of a new React/Next.js project with a standard directory structure and configuration files. >> "%PROJECT_DIR%\NEXTJS_SETUP_README.md"
echo. >> "%PROJECT_DIR%\NEXTJS_SETUP_README.md"
echo ## Features >> "%PROJECT_DIR%\NEXTJS_SETUP_README.md"
echo. >> "%PROJECT_DIR%\NEXTJS_SETUP_README.md"
echo - Creates a standard Next.js project structure with App Router >> "%PROJECT_DIR%\NEXTJS_SETUP_README.md"
echo - Sets up TypeScript configuration >> "%PROJECT_DIR%\NEXTJS_SETUP_README.md"
echo - Configures Tailwind CSS for styling >> "%PROJECT_DIR%\NEXTJS_SETUP_README.md"
echo - Sets up ESLint and Prettier for code quality >> "%PROJECT_DIR%\NEXTJS_SETUP_README.md"
echo - Configures Jest and React Testing Library for testing >> "%PROJECT_DIR%\NEXTJS_SETUP_README.md"
echo - Creates sample components and pages >> "%PROJECT_DIR%\NEXTJS_SETUP_README.md"
echo - Includes tests for components and pages >> "%PROJECT_DIR%\NEXTJS_SETUP_README.md"
echo - Provides a comprehensive project structure >> "%PROJECT_DIR%\NEXTJS_SETUP_README.md"
echo. >> "%PROJECT_DIR%\NEXTJS_SETUP_README.md"
echo ## Usage >> "%PROJECT_DIR%\NEXTJS_SETUP_README.md"
echo. >> "%PROJECT_DIR%\NEXTJS_SETUP_README.md"
echo ```bash >> "%PROJECT_DIR%\NEXTJS_SETUP_README.md"
echo rnjsproject.cmd project_name >> "%PROJECT_DIR%\NEXTJS_SETUP_README.md"
echo ``` >> "%PROJECT_DIR%\NEXTJS_SETUP_README.md"
echo. >> "%PROJECT_DIR%\NEXTJS_SETUP_README.md"
echo Replace `project_name` with the name of your project. >> "%PROJECT_DIR%\NEXTJS_SETUP_README.md"

REM Display completion message
echo.
echo React/Next.js project setup complete!
echo.
echo Next steps:
echo 1. Navigate to the project directory: cd %PROJECT_NAME%
echo 2. Install dependencies: npm install
echo 3. Start the development server: npm run dev
echo 4. Run tests: npm test
echo.
echo For more information, see NEXTJS_SETUP_README.md

endlocal