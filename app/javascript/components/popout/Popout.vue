<template>
  <div :class="['popout', {'popout--active': isActive }]">
    <div class="popout__trigger" @click="togglePopout()">
      <slot name="link"></slot>
    </div>

    <div class="popout__target">
      <slot name="popout"></slot>
    </div>
  </div>
</template>

<script>
  export default {
    name: 'popout',

    data () {
      return {
        isActive: false
      }
    },

    methods: {
      togglePopout () {
        this.isActive = !this.isActive
      }
    }
  }
</script>