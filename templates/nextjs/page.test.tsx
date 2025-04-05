import { render, screen } from '@testing-library/react';
import Home from '@/app/page';

// Mock the Button component to simplify testing
jest.mock('@/components/ui/Button', () => ({
  Button: ({ children }: { children: React.ReactNode }) => <button>{children}</button>,
}));

describe('Home page', () => {
  it('renders the welcome heading', () => {
    render(<Home />);
    const heading = screen.getByRole('heading', { name: /Welcome to/i });
    expect(heading).toBeInTheDocument();
  });

  it('renders the Get Started button', () => {
    render(<Home />);
    const button = screen.getByRole('button', { name: /Get Started/i });
    expect(button).toBeInTheDocument();
  });
});
