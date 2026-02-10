<script setup lang="ts">
import { ref, computed } from 'vue'

const props = defineProps<{
  message: string
}>()

const count = ref(0)

const counterMessage = computed(() => {
  if (count.value === 0) return ''
  return count.value >= 10
    ? "Wow, you really like clicking!"
    : "Keep clicking to see what happens!"
})
</script>

<template>
  <div class="welcome-card">
    <h2>{{ props.message }}</h2>
    <div class="counter-section">
      <p>This is a sample interactive component demonstrating Vue reactivity.</p>
      <button
        class="counter-button"
        @click="count++"
      >
        You clicked {{ count }} {{ count === 1 ? 'time' : 'times' }}
      </button>
      <p v-if="count > 0" class="counter-message">
        {{ counterMessage }}
      </p>
    </div>
  </div>
</template>
