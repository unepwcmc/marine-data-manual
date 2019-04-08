<template>
  <div class="ajax-confirmation">
    <p v-if="error" class="ajax-confirmation__error">{{ errorMessage }}</p>

    <div 
      v-if="isActive"
      :id="modalId"
      class="ajax-confirmation__modal flex flex-column flex-center">
      <div class="ajax-confirmation__icon tick-svg" title="Success"></div>
      <h1 class="ajax-confirmation__title">{{ title }}</h1>
      <div class="ajax-confirmation__message">
        <slot></slot>      
      </div>
      <button
        :aria-haspopup="true"
        :aria-controls="modalId"
        :aria-expanded="true"
        @click="close"
        class="ajax-confirmation__button">Close</button>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    title: String,
    errorMessage: String
  },

  data() {
    return {
      isActive: false,
      error: false,
      modalId: 'ajax-confirmation-modal'
    }
  },

  mounted() {
    console.log('started')
    document.addEventListener("ajax:success", () => {
      console.log('success')
      this.open()
    })
    document.addEventListener("ajax:completed", () => {
      console.log('success')
      this.open()
    })

    document.addEventListener("ajax:error", () => {
      console.log('error')

      this.error = true
    })
  },

  methods: {
    open() {
      this.isActive = true
      this.error = false
    },

    close() {
      this.isActive = false
      this.error = false
    }
  }
}
</script>

