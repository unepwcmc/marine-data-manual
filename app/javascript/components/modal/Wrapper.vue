<template>
  <div
    class="wcmc-ct-modal-wrapper"
  >
    <div
      v-if="isShown"
      ref="content"
      tabindex="0"
      class="wcmc-ct-modal-wrapper__content"
      @click.stop.prevent="closeModal"
    >
      <div @click.stop style="margin: 0 auto">
        <slot v-bind="{ closeModal }" />
      </div>
    </div>
    <div
      v-show="isShown"
      class="wcmc-ct-modal-wrapper__overlay"
      @click.stop="closeModal"
    />
  </div>
</template>

<script>
export default {
  props: {
    isShown: { type: Boolean, default: false },
    closeModal: { type: Function, default: null },
  }
}
</script>

<style scoped lang="scss">
  @import '../../scss/includes.scss';

  .wcmc-ct-modal-wrapper {
    position: absolute;
  }

  .wcmc-ct-modal-wrapper__overlay {
    position: fixed;
    height: 100%;
    width: 100%;
    left: 0;
    top: 0;
    right: 0;
    bottom: 0;
    overflow: visible;
    background: rgba(64,64,64,0.25);
    z-index: 1299;
  }

  .wcmc-ct-modal-wrapper__content {
    position: fixed;
    height: 100vh;
    width: 100vw;
    left: 0;
    top: 0;
    right: 0;
    bottom: 0;
    display: flex;
    flex-direction: column;
    justify-content: center;
    justify-items: center;
    padding: 0.25em;
    padding: 1em;
    z-index: 1300;
  }
</style>
