<script lang="ts">
	import '../styles/global.css';
	import type { Snippet } from 'svelte';

	let { children }: { children: Snippet } = $props();
</script>

<div style="display: contents">
	{@render children()}
</div>
