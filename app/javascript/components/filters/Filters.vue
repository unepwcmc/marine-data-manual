<template>
  <div class="filters flex flex-h-between">
    <div>
      <template v-for="filter in filters">
        <v-filter v-if="filter.filter"
          :name="filter.name"
          :title="filter.title" 
          :options="filter.options"
          :type="filter.type"
          :selectMultiple="filter.selectMultiple">
        </v-filter>
      </template>
    </div>

    <button @click="clearFilters" class="filters__clear button--plain">Clear all filters</button>
  </div>
</template>

<script>
  import { eventHub } from "../../metadata.js"
  import VFilter from './Filter.vue'

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

    created () {
      this.createSelectedFilterOptions()
    },

    mounted () {
      eventHub.$on('clickDropdown', this.updateDropdowns)
    },

    methods: {
      updateDropdowns (name) {
        this.children.forEach(filter => {
          if(filter.name == name) {
            filter.isOpen = true
          } else {
            filter.cancel()  
          }
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

      clearFilters () {
        eventHub.$emit('resetFilter')
      }
    }
  }
</script>