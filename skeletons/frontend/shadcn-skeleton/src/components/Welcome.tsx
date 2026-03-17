"use client";

import { useState } from "react";
import { Button } from "@/components/ui/button";
import {
  Card,
  CardContent,
  CardDescription,
  CardHeader,
  CardTitle,
} from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";

interface WelcomeProps {
  message: string;
}

export default function Welcome({ message }: WelcomeProps) {
  const [count, setCount] = useState(0);

  return (
    <Card>
      <CardHeader>
        <CardTitle className="text-lg">{message}</CardTitle>
        <CardDescription>
          This is a sample interactive component demonstrating React hooks with
          shadcn/ui.
        </CardDescription>
      </CardHeader>
      <CardContent className="flex flex-col items-center gap-4">
        <Button size="lg" onClick={() => setCount((c) => c + 1)}>
          You clicked {count} {count === 1 ? "time" : "times"}
        </Button>
        {count > 0 && (
          <Badge variant="secondary">
            {count >= 10
              ? "Wow, you really like clicking!"
              : "Keep clicking..."}
          </Badge>
        )}
      </CardContent>
    </Card>
  );
}
