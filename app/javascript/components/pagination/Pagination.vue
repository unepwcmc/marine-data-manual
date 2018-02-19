<template>
  <div>
    <div v-if="haveResults" class="right">
      <span class="bold">{{ firstItem }} - {{ lastItem }} of {{ totalItems }}</span>

      <button 
        v-bind="{ 'disabled' : !previousIsActive }"
        @click="changePage(previousIsActive, 'previous')"
        class="button button--previous"
        :class="{ 'button--disabled' : !previousIsActive }">
      </button>

      <button 
        v-bind="{ 'disabled' : !nextIsActive }"
        @click="changePage(nextIsActive, 'next')"
        class="button button--next"
        :class="{ 'button--disabled' : !nextIsActive }">
      </button>
    </div>

    <div v-else class="left">
      <p>There are no projects matching the selected filters options.</p>
    </div>
  </div>
</template>

<script>
  import { eventHub } from '../../metadata.js'

  export default {
    name: 'pagination',

    props: {
      itemsPerPage: Number
    },

    data () {
      return {
        totalItems: this.$store.state.totalItems,
        previousIsActive: false,
        nextIsActive: false
      }
    },

    created () {
      this.$store.commit('setItemsPerPage', this.itemsPerPage)
    },

    mounted () {
      this.updateButtons()

      eventHub.$on('callUpdateButtons', this.updateButtons)
    },

    computed: {
      firstItem () {
        let first

        if(this.totalItems == 0) { 
          first = 0

        } else if (this.totalItems < this.itemsPerPage) {
          first = 1

        } else {
          first = this.lastItem - this.itemsPerPage + 1
        }
        
        return first
      },

      lastItem () {
        let lastItem = this.itemsPerPage * this.currentPage
        
        if (lastItem > this.totalItems) {
          lastItem = this.totalItems
        }

        return lastItem
      },

      currentPage () {
        return this.$store.state.currentPage
      },

      totalPages () {
        return Math.ceil(this.totalItems / this.itemsPerPage)
      },

      haveResults () {
        return this.totalItems > 0
      }
    },

    methods: {
      updateButtons () {
        this.totalItems = this.$store.state.totalItems
        this.nextIsActive = this.currentPage < this.totalPages
        this.previousIsActive = this.currentPage > 1

        eventHub.$emit('callPaginateItems')
      },

      changePage (isActive, direction) {
        // only change the page if the button is active
        if (isActive) {
          const newPage = direction == 'next' ? this.currentPage + 1 : this.currentPage - 1
          
          this.$store.commit('updateCurrentPage', newPage)
          this.updateButtons()
        }
      }
    }
  }
</script>