<script lang="ts">
	interface Props {
		message: string;
	}

	let { message }: Props = $props();
	let count = $state(0);
</script>

<div class="welcome-card">
	<h2>{message}</h2>
	<div class="counter-section">
		<p>This is a sample interactive component demonstrating Svelte 5 runes.</p>
		<button
			class="counter-button"
			onclick={() => count++}
		>
			You clicked {count} {count === 1 ? 'time' : 'times'}
		</button>
		{#if count > 0}
			<p class="counter-message">
				{count >= 10
					? "Wow, you really like clicking!"
					: "Keep clicking to see what happens!"}
			</p>
		{/if}
	</div>
</div>

<style>
	.welcome-card {
		background-color: var(--color-card-bg);
		border: 1px solid var(--color-border);
		border-radius: 8px;
		padding: 2rem;
		text-align: center;
		transition: border-color var(--transition-duration);
	}

	.welcome-card:hover {
		border-color: var(--color-primary);
	}

	.welcome-card h2 {
		color: var(--color-primary);
		margin-bottom: 1rem;
	}

	.counter-section {
		margin-top: 1.5rem;
	}

	.counter-button {
		background-color: var(--color-primary);
		color: white;
		border: none;
		padding: 0.75rem 1.5rem;
		border-radius: 6px;
		font-size: 1rem;
		font-weight: 500;
		margin-top: 1rem;
	}

	.counter-button:hover {
		background-color: var(--color-primary-hover);
		transform: translateY(-2px);
		box-shadow: 0 4px 12px rgba(255, 62, 0, 0.4);
	}

	.counter-button:active {
		transform: translateY(0);
	}

	.counter-message {
		margin-top: 1rem;
		font-style: italic;
		color: var(--color-primary);
		animation: fadeIn 0.3s ease-in;
	}

	@keyframes fadeIn {
		from {
			opacity: 0;
			transform: translateY(-10px);
		}
		to {
			opacity: 1;
			transform: translateY(0);
		}
	}
</style>
