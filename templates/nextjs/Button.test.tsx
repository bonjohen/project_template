import { render, screen } from '@testing-library/react';
import { Button } from '@/components/ui/Button';

describe('Button', () => {
  it('renders a button with the correct text', () => {
    render(<Button>Click me</Button>);
    const button = screen.getByRole('button', { name: /Click me/i });
    expect(button).toBeInTheDocument();
  });

  it('applies the correct variant styles', () => {
    render(<Button variant="secondary">Secondary</Button>);
    const button = screen.getByRole('button', { name: /Secondary/i });
    expect(button).toHaveClass('bg-gray-600');
  });

  it('passes additional props to the button element', () => {
    render(<Button data-testid="test-button">Test</Button>);
    const button = screen.getByTestId('test-button');
    expect(button).toBeInTheDocument();
  });
});
