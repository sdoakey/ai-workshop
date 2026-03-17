import Welcome from "@/components/Welcome";
import {
  Card,
  CardContent,
  CardDescription,
  CardHeader,
  CardTitle,
} from "@/components/ui/card";

export default function Home() {
  return (
    <div className="mx-auto flex min-h-screen max-w-3xl flex-col px-4 py-8">
      <header className="mb-8 text-center">
        <h1 className="mb-2 text-4xl font-bold tracking-tight">
          shadcn Skeleton Application
        </h1>
        <p className="text-muted-foreground">
          Built with Next.js + shadcn/ui + TypeScript
        </p>
      </header>

      <main className="flex flex-1 flex-col gap-6">
        <Welcome message="Welcome to your new shadcn/ui application!" />

        <Card>
          <CardHeader>
            <CardTitle>Ready to Build</CardTitle>
            <CardDescription>
              This skeleton application is ready for you to add pages,
              components, and API routes. Use AI-assisted development tools to
              rapidly build your application.
            </CardDescription>
          </CardHeader>
        </Card>

        <Card>
          <CardHeader>
            <CardTitle>Getting Started</CardTitle>
          </CardHeader>
          <CardContent>
            <ul className="list-inside list-disc space-y-2 text-sm text-muted-foreground">
              <li>
                Edit <code className="text-foreground">src/app/page.tsx</code>{" "}
                to modify this page
              </li>
              <li>
                Add shadcn/ui components with{" "}
                <code className="text-foreground">npx shadcn@latest add</code>
              </li>
              <li>
                Create new pages in{" "}
                <code className="text-foreground">src/app/</code> using the App
                Router
              </li>
              <li>
                Add custom components in{" "}
                <code className="text-foreground">src/components/</code>
              </li>
              <li>Fast Refresh is enabled for instant updates</li>
            </ul>
          </CardContent>
        </Card>
      </main>

      <footer className="mt-8 border-t pt-6 text-center text-sm text-muted-foreground">
        <p>
          Edit pages and components to see changes instantly with Fast Refresh
        </p>
      </footer>
    </div>
  );
}
