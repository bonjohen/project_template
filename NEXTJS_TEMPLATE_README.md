# React/Next.js Project Template

This repository contains a template for creating modern React applications with Next.js, following best practices and including a comprehensive set of tools and configurations.

## Features

- **Next.js 14**: The latest version of the React framework with App Router
- **TypeScript**: Static type checking for improved developer experience
- **Tailwind CSS**: Utility-first CSS framework for rapid UI development
- **ESLint & Prettier**: Code linting and formatting
- **Jest & React Testing Library**: Comprehensive testing setup
- **Component Structure**: Organized component architecture
- **Responsive Design**: Mobile-first approach with Tailwind
- **Accessibility**: Built with a11y best practices in mind

## Usage

To create a new React/Next.js project using this template:

```bash
rnjsproject.cmd your_project_name
```

This will create a new directory with the specified name and set up all the necessary files and structure.

## Project Structure

The template creates the following structure:

```
your_project_name/
├── src/
│   ├── app/
│   │   ├── layout.tsx       # Root layout with metadata
│   │   └── page.tsx         # Home page
│   ├── components/
│   │   └── ui/
│   │       └── Button.tsx   # Reusable Button component
│   ├── lib/                 # Utility functions
│   └── styles/
│       └── globals.css      # Global styles with Tailwind
├── public/                  # Static assets
├── tests/
│   ├── app/
│   │   └── page.test.tsx    # Tests for Home page
│   ├── components/
│   │   └── ui/
│   │       └── Button.test.tsx  # Tests for Button component
│   └── template-structure.test.ts  # Project structure validation
├── .eslintrc.json          # ESLint configuration
├── .prettierrc.json        # Prettier configuration
├── jest.config.js          # Jest configuration
├── jest.setup.js           # Jest setup file
├── next.config.js          # Next.js configuration
├── package.json            # Dependencies and scripts
├── postcss.config.js       # PostCSS configuration
├── tailwind.config.js      # Tailwind CSS configuration
└── tsconfig.json           # TypeScript configuration
```

## Key Components

### App Router Structure

The template uses Next.js App Router, which provides:

- **Layouts**: Shared UI across routes
- **Server Components**: Improved performance and SEO
- **Metadata API**: Easy SEO management
- **Loading States**: Built-in loading UI

### UI Components

The template includes a sample Button component that demonstrates:

- TypeScript interfaces and props
- Tailwind CSS styling
- Variant support
- Accessibility considerations

### Testing Setup

The testing setup includes:

- Jest configuration for Next.js
- React Testing Library for component testing
- Sample tests for components and pages
- Project structure validation tests

## Getting Started

After creating a project:

1. Navigate to your project directory
2. Install dependencies:
   ```bash
   npm install
   ```
3. Start the development server:
   ```bash
   npm run dev
   ```
4. Open [http://localhost:3000](http://localhost:3000) to see your application

## Available Scripts

The template includes the following npm scripts:

- **dev**: Run development server
- **build**: Build for production
- **start**: Start production server
- **lint**: Lint code with ESLint
- **test**: Run tests with Jest
- **test:watch**: Run tests in watch mode
- **test:coverage**: Run tests with coverage reporting

## Extending the Template

### Adding Pages

To add a new page:

1. Create a new file in `src/app` directory
2. Export a React component as the default export
3. The file name will determine the route

### Adding Components

To add a new component:

1. Create a new file in `src/components` directory
2. Create and export your component with TypeScript types
3. Add tests in the `tests/components` directory

### Styling

The template uses Tailwind CSS for styling:

1. Use Tailwind utility classes for styling components
2. Extend the Tailwind configuration in `tailwind.config.js`
3. Add custom styles in `src/styles/globals.css`

## Comparison with Other Templates

This React/Next.js template follows similar conventions to the JavaScript and TypeScript templates:

| Feature | JavaScript Template | TypeScript Template | React/Next.js Template |
|---------|---------------------|---------------------|------------------------|
| Language | JavaScript | TypeScript | TypeScript |
| Testing | Jest | Jest with ts-jest | Jest with React Testing Library |
| Linting | ESLint | ESLint with TypeScript | ESLint with Next.js config |
| Formatting | Prettier | Prettier | Prettier |
| Package Manager | npm | npm | npm |
| Framework | None | None | Next.js |
| Styling | None | None | Tailwind CSS |
| Component Structure | None | None | Organized by feature |

## Best Practices

The template follows these best practices:

- **TypeScript**: Strong typing for better developer experience
- **Component Organization**: Logical structure for components
- **Testing**: Comprehensive test coverage
- **Accessibility**: Built-in a11y considerations
- **Performance**: Optimized for speed and SEO
- **Code Quality**: ESLint and Prettier for consistent code style
