<template>
  <div class="accordion-item" :class="{ 'accordion-item--active' : isActive }">

    <a class="accordion-item__title" @click="toggleAccordionContent()">{{ title }}</a>

    <div class="accordion-item__content">
      <slot></slot>
    </div>

  </div>  
</template>

<script>
  import { eventHub } from '../../metadata.js',

  export default {
    name: 'accordion-item',

    props: {
      title: String
    },

    data () {
      return {
        isActive: false
      }
    },

    methods: {
      toggleAccordionContent () {
        eventHub.$emit('callToggleAccordionContent');
      }
    }
  }
</script>

<style lang="scss">
  .accordion-item {
    &__content {
      overflow: hidden;
      height: 0;
      max-height: rem-calc(1000);

      transition: height .6s linear;

      .accordion-item--active & {
        height: auto;
      }
    }
  }
</style>
