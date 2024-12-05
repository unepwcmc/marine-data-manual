<template>
  <component
    :is="wrapperComponent"
  >
    <component
      :is="launcherComponent"
      ref="launcher"
      role="button"
      class="wcmc-ct-modal-launcher"
      v-bind="launcherProps"
      @click="showModal"
    >
      <slot name="launcherContent" v-bind="launcherProps" />
    </component>

    <ModalWrapper
      v-bind="wrapperProps"
    >
      <template v-slot:default="slotProps">
        <slot v-bind="slotProps" />
      </template>
    </ModalWrapper>
  </component>
</template>

<script setup>
import ModalWrapper from './Wrapper.vue';

export default {
  components: {
    ModalWrapper
  },

  props: {
    wrapperComponent: { type: String, default: 'div' },
    launcherComponent: { type: String, default: 'button' },
    launcherProps: { type: Object, default: () => ({}) }
  },

  data: () => ({ isShown: false }),

  watch: {
    isShown (newVal, oldVal) {
      if (!newVal && newVal !== oldVal) {
        this.focusOnLauncher()
      }
    },
  },

  computed: {
    wrapperProps() {
      return {
        closeModal: this.closeModal,
        isShown: this.isShown,
      }
    },
  },

  methods: {
    showModal () {
      this.isShown = true
    },

    closeModal () {
      this.isShown = false
    },

    focusOnLauncher () {
      const { $nextTick, $refs } = this;
      const { launcher } = $refs;

      $nextTick(() => {
        launcher.focus();
      })
    }
  }
};
</script>
