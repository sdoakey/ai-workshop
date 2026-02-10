<script lang="ts">
	import Welcome from '$lib/components/Welcome.svelte';
</script>

<svelte:head>
	<title>Svelte Skeleton App</title>
	<meta name="description" content="Svelte Skeleton Application" />
</svelte:head>

<div class="app-container">
	<header class="app-header">
		<img src="/svelte.svg" class="logo" alt="Svelte logo" />
		<h1>Svelte Skeleton Application</h1>
		<p class="subtitle">Built with SvelteKit + Svelte 5 + TypeScript</p>
	</header>

	<main class="app-main">
		<Welcome message="Welcome to your new Svelte application!" />

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
				<li>Edit <code>src/routes/+page.svelte</code> to modify this page</li>
				<li>Create new components in <code>src/lib/components/</code></li>
				<li>Add new routes in <code>src/routes/</code></li>
				<li>Hot module replacement (HMR) is enabled for instant updates</li>
			</ul>
		</div>
	</main>

	<footer class="app-footer">
		<p>Edit components to see changes instantly with HMR</p>
	</footer>
</div>

<style>
	.app-container {
		max-width: 1200px;
		margin: 0 auto;
		padding: 2rem;
		min-height: 100vh;
		display: flex;
		flex-direction: column;
	}

	.app-header {
		text-align: center;
		margin-bottom: 3rem;
		padding: 2rem 0;
	}

	.app-header .logo {
		height: 6rem;
		margin-bottom: 1rem;
		transition: filter var(--transition-duration);
	}

	.app-header .logo:hover {
		filter: drop-shadow(0 0 2em #ff3e00aa);
	}

	.app-header h1 {
		font-size: 3rem;
		margin-bottom: 0.5rem;
		color: var(--color-text);
	}

	.app-header .subtitle {
		font-size: 1.2rem;
		color: var(--color-text-secondary);
	}

	.app-main {
		flex: 1;
		display: flex;
		flex-direction: column;
		gap: 2rem;
	}

	.app-footer {
		text-align: center;
		padding: 2rem 0;
		margin-top: 3rem;
		border-top: 1px solid var(--color-border);
		color: var(--color-text-secondary);
	}

	/* Card Styles */
	.info-card,
	.getting-started {
		background-color: var(--color-card-bg);
		border: 1px solid var(--color-border);
		border-radius: 8px;
		padding: 2rem;
		transition: border-color var(--transition-duration);
	}

	.info-card:hover,
	.getting-started:hover {
		border-color: var(--color-primary);
	}

	.info-card h2,
	.getting-started h3 {
		color: var(--color-primary);
		margin-bottom: 1rem;
	}

	.info-card p:last-child {
		margin-bottom: 0;
	}
</style>
