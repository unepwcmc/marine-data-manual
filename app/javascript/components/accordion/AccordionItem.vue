<template>
  <div class="accordion-item" :class="{ 'accordion-item--active' : isActive }">

    <a class="accordion-item__title" @click="toggleAccordionContent()">{{ title }}</a>

    <div class="accordion-item__content-wrapper">
      <div class="accordion-item__content">
        <slot></slot>
      </div>
    </div>

  </div>  
</template>

<script>
  import { eventHub } from '../../metadata.js'

  export default {
    name: 'accordion-item',

    props: {
      id: {
        required: true,
        type: String
      },
      title: String,
      open: Boolean
    },

    data () {
      return {
        isActive: this.open
      }
    },

    methods: {
      toggleAccordionContent () {
        eventHub.$emit('calltoggleAccordionContent', this.id);
      }
    }
  }
</script>

<style lang="scss">
  @import '../../scss/includes.scss';

  .accordion-item {
    &__content-wrapper {
      overflow: hidden;
      height: auto;
      max-height: 0;

      transition: max-height .3s ease-in-out;

      .accordion-item--active & {
        max-height: rem-calc(500);
      }
    }
  }
</style>
