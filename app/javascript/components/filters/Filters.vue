<template>
  <div>
    <span class="filter__title bold">Filters:</span>

    <v-filter v-for="filter in filters"
      :name="filter.name"
      :title="filter.title" 
      :options="filter.options"
      :type="filter.type">
    </v-filter>

    <!-- <download-csv class="inline-block"></download-csv> -->
  </div>
</template>

<script>
  import { eventHub } from "../../metadata.js"
  import VFilter from './Filter.vue'
  // import DownloadCsv from '../forms/DownloadCsv.vue'

  export default {
    name: 'filters',

    components: { VFilter },

    props: {
      filters: {
        type: Array
      }
    },

    data () {
      return {
        children: this.$children
      }
    },

    mounted () {
      eventHub.$on('clickDropdown', this.updateDropdowns)
    },

    methods: {
      updateDropdowns (name) {
        this.children.forEach(filter => {
          filter.isOpen = filter.name == name
        })
      }
    }
  }
</script>

<style lang="scss">
  
</style>