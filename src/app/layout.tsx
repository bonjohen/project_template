import '../styles/globals.css'; 
import type { Metadata } from 'next'; 
 
export const metadata: Metadata = { 
  title: 'test_nextjs_project', 
  description: 'Created with Next.js', 
}; 
 
export default function RootLayout({ 
  children, 
}: { 
  children: React.ReactNode; 
}) { 
  return ( 
    <html lang="en"> 
      <body>{children}</body> 
    </html> 
  ); 
} 
