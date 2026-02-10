<script setup lang="ts">
import Welcome from './Welcome.vue'
</script>

<template>
  <div class="app-container">
    <header class="app-header">
      <img src="/vite.svg" class="logo" alt="Vite logo" />
      <h1>Vue Skeleton Application</h1>
      <p class="subtitle">Built with Vite + Vue + TypeScript</p>
    </header>

    <main class="app-main">
      <Welcome message="Welcome to your new Vue application!" />

      <div class="info-card">
        <h2>Ready to Build</h2>
        <p>
          This skeleton application is ready for you to add components,
          routes, and functionality. Use AI-assisted development tools
          to rapidly build your application.
        </p>
      </div>

      <div class="getting-started">
        <h3>Getting Started</h3>
        <ul>
          <li>Edit <code>src/components/App.vue</code> to modify this page</li>
          <li>Create new components in <code>src/components/</code></li>
          <li>Add styles in <code>src/styles/</code></li>
          <li>Hot module replacement (HMR) is enabled for instant updates</li>
        </ul>
      </div>
    </main>

    <footer class="app-footer">
      <p>Edit components to see changes instantly with HMR</p>
    </footer>
  </div>
</template>

<style>
@import '../styles/App.css';
</style>
