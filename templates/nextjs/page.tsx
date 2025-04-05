import { Button } from '@/components/ui/Button';

export default function Home() {
  return (
    <main className="flex min-h-screen flex-col items-center justify-between p-24">
      <div className="z-10 w-full max-w-5xl items-center justify-between font-mono text-sm">
        <h1 className="text-4xl font-bold mb-8 text-center">Welcome to NextJS Template</h1>
        <p className="text-center mb-8">This is a Next.js project with TypeScript, Tailwind CSS, and more.</p>
        <div className="flex justify-center">
          <Button>Get Started</Button>
        </div>
      </div>
    </main>
  );
}
