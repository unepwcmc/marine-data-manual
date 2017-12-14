<template>
  <div class="flex space-between">
    <div>
      <span class="filter__title bold">Filters:</span>

      <v-filter v-for="filter in filters"
        :name="filter.name"
        :title="filter.title" 
        :options="filter.options"
        :type="filter.type">
      </v-filter>
    </div>
    
    <download-csv></download-csv>
  </div>
</template>

<script>
  import { eventHub } from "../../metadata.js"
  import VFilter from './Filter.vue'
  import DownloadCsv from '../forms/DownloadCsv.vue'

  export default {
    name: 'filters',

    components: { VFilter, DownloadCsv },

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

    created () {
      this.createSelectedFilterOptions()
    },

    mounted () {
      eventHub.$on('clickDropdown', this.updateDropdowns)
    },

    methods: {
      updateDropdowns (name) {
        this.children.forEach(filter => {
          filter.isOpen = filter.name == name
        })
      },

      createSelectedFilterOptions () {
        let array = []

        // create an empty array for each filter
        this.filters.forEach(filter => {
          if (filter.name !== undefined && filter.options !== undefined && filter.options.length > 0) {
            let obj = {}

            obj.name = filter.name
            obj.options = []
            obj.type = filter.type

            array.push(obj)
          }
        })

        this.$store.commit('setFilterOptions', array)
      },
    }
  }
</script>

<style lang="scss">
  
</style>