# React/Next.js Project Template

This template creates a modern React application with Next.js, TypeScript, Tailwind CSS, and testing setup.

## Features

- **Next.js 14** with App Router
- **TypeScript** for type safety
- **Tailwind CSS** for styling
- **ESLint & Prettier** for code quality
- **Jest & React Testing Library** for testing
- **Component Structure** following best practices

## Usage

```bash
rnjsproject.cmd your_project_name
```

## Project Structure

```
your_project_name/
├── src/
│   ├── app/
│   │   ├── layout.tsx       # Root layout
│   │   └── page.tsx         # Home page
│   ├── components/
│   │   └── ui/
│   │       └── Button.tsx   # UI components
│   ├── lib/                 # Utility functions
│   └── styles/
│       └── globals.css      # Global styles
├── public/                  # Static assets
├── tests/                   # Test files
├── .eslintrc.json          # ESLint config
├── .prettierrc.json        # Prettier config
├── jest.config.js          # Jest config
├── next.config.js          # Next.js config
├── package.json            # Dependencies
├── tailwind.config.js      # Tailwind config
└── tsconfig.json           # TypeScript config
```

## Getting Started

After creating a project:

1. Install dependencies: `npm install`
2. Start the development server: `npm run dev`
3. Open [http://localhost:3000](http://localhost:3000)

## Available Scripts

- `npm run dev` - Development server
- `npm run build` - Production build
- `npm run start` - Production server
- `npm run lint` - Lint code
- `npm test` - Run tests
