# nextjs-template

A modern Next.js application with TypeScript, Tailwind CSS, and testing setup.

## Getting Started

First, install the dependencies:

```bash
npm install
# or
yarn
# or
pnpm install
```

Then, run the development server:

```bash
npm run dev
# or
yarn dev
# or
pnpm dev
```

Open [http://localhost:3000](http://localhost:3000) with your browser to see the result.

## Features

- **Next.js 14**: The React framework for production
- **TypeScript**: Static type checking
- **Tailwind CSS**: Utility-first CSS framework
- **ESLint**: Code linting
- **Prettier**: Code formatting
- **Jest & React Testing Library**: Testing framework

## Project Structure

```bash
nextjs-template/
├── src/
│   ├── app/
│   │   ├── layout.tsx # Root layout
│   │   └── page.tsx # Home page
│   ├── components/
│   │   └── ui/
│   │       └── Button.tsx # Button component
│   ├── lib/ # Utility functions
│   └── styles/
│       └── globals.css # Global styles
├── public/ # Static assets
├── tests/ # Test files
├── .eslintrc.json # ESLint configuration
├── .prettierrc.json # Prettier configuration
├── jest.config.js # Jest configuration
├── next.config.js # Next.js configuration
├── package.json # Dependencies and scripts
├── postcss.config.js # PostCSS configuration
├── tailwind.config.js # Tailwind CSS configuration
└── tsconfig.json # TypeScript configuration
```

## Available Scripts

- `npm run dev` - Run development server
- `npm run build` - Build for production
- `npm run start` - Start production server
- `npm run lint` - Lint code with ESLint
- `npm test` - Run tests
- `npm run test:watch` - Run tests in watch mode
- `npm run test:coverage` - Run tests with coverage
