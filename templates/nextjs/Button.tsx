import { ButtonHTMLAttributes, ReactNode } from 'react';

interface ButtonProps extends ButtonHTMLAttributes<HTMLButtonElement> {
  children: ReactNode;
  variant?: 'primary' | 'secondary' | 'outline';
}

export function Button({
  children,
  variant = 'primary',
  className = '',
  ...props
}: ButtonProps) {
  const baseStyles = "px-4 py-2 rounded font-medium focus:outline-none focus:ring-2 focus:ring-offset-2";

  const variantStyles = {
    primary: "bg-blue-600 text-white hover:bg-blue-700 focus:ring-blue-500",
    secondary: "bg-gray-600 text-white hover:bg-gray-700 focus:ring-gray-500",
    outline: "border border-gray-300 bg-transparent hover:bg-gray-50 focus:ring-gray-500",
  };

  const styles = `${baseStyles} ${variantStyles[variant]} ${className}`;

  return (
    <button className={styles} {...props}>
      {children}
    </button>
  );
}
