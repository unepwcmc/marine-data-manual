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
  import axios from 'axios'
  import { eventHub } from '../../metadata.js'
  import { setCsrfToken } from '../../helpers/request-helpers'
  import VFilter from './Filter.vue'

  export default {
    name: 'filters',

    components: { VFilter },

    props: {
      filterSrc: {
        type: String,
        required: true
      }
    },

    data () {
      return {
        filters: [],
        children: this.$children,
        SelectedFilterOptionsCreated: false
      }
    },

    created () {
      this.getNewFilters()
      eventHub.$on('getNewFilters', this.getNewFilters)
      eventHub.$on('createSelectedFilterArray', this.createSelectedFilterOptions)
    },

    mounted () {
      eventHub.$on('clickDropdown', this.updateDropdowns)
    },

    methods: {
      getNewFilters () {
        let data = {
          params: {
            filters: this.$store.state.selectedFilterOptions
          }
        }
        
        setCsrfToken(axios)
        axios.defaults.headers.common['Accept'] = 'application/json'

        axios.post(this.filterSrc, data)
        .then(response => {
          console.log(response.data)
          this.filters = response.data.filters
        })
        .catch(function (error) {
          console.log(error)
        })
      },

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
        if(this.selectedFilterOptionsCreated) { return false }

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
        this.selectedFilterOptionsCreated = true
      },

      clearFilters () {
        eventHub.$emit('resetFilter')
      }
    }
  }
</script>