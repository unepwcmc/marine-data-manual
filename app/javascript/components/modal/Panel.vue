<template>
  <div
    role="dialog"
    class="wcmc-ct-modal-panel"
    :class="sizeToPage && 'wcmc-ct-modal-panel--size-to-page'"
  >
    <div
      class="wcmc-ct-modal-panel__header"
    >
      <div
        class="wcmc-ct-modal-panel__header-content"
      >
        <slot
          name="modalHeaderContent"
          v-bind="childSlotProps"
        />
      </div>
      <div
        class="wcmc-ct-modal-panel__header-controls"
      >
        <slot
          name="modalHeaderControls"
          v-bind="childSlotProps"
        >
          <button
            v-if="closeModal"
            type="button"
            :class="[
              'wcmc-ct-modal-panel__header-control',
              'wcmc-ct-modal-panel__header-control--for-close'
            ]"
            @click="closeModal"
          >
            &#215;
          </button>
        </slot>
      </div>
    </div>
    <div
      class="wcmc-ct-modal-panel__body"
      :class="sizeToPage && 'wcmc-ct-modal-panel__body--size-to-page'"
    >
      <slot
        v-bind="childSlotProps"
      />
    </div>
    <div
      class="wcmc-ct-modal-panel__footer"
    >
      <slot
        name="modalFooterContent"
        v-bind="childSlotProps"
      />
    </div>
  </div>
</template>

<script>
export default {
  props: {
    sizeToPage: {
      type: Boolean,
      default: true
    },

    closeModal: {
      type: Function,
      default: null
    }
  },

  computed: {
    childSlotProps() {
      return { closeModal: this.closeModal }
    }
  }
};
</script>

<style lang="scss">
  .wcmc-ct-modal-panel {
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    background: #fff;
    border: 1px solid #ccc;
    box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.05);
    //
    max-width: 56rem;
  }

  .wcmc-ct-modal-panel--size-to-page {
    max-height: 95vh;
  }

  .wcmc-ct-modal-panel__header,
  .wcmc-ct-modal-panel__footer {
    padding: 1em;
  }

  .wcmc-ct-modal-panel__body {
    padding-left: 1em;
    padding-right: 1em;
  }

  .wcmc-ct-modal-panel__body--size-to-page {
    flex: 1;
    max-height: 75vh;
    min-width: 30rem;
    max-width: 95vw;
    overflow-y: auto;
  }

  .wcmc-ct-modal-panel__header {
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    justify-items: start;
  }
</style>
