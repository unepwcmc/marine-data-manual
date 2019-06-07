<template>
  <div>
    <search></search>
    
    <filters v-if="filterSrc" :filterSrc="filterSrc"></filters>

    <v-table :tableHeaders="tableHeaders" :items="items"></v-table>

    <pagination 
      :currentPage="currentPage"
      :pageItemsStart="pageItemsStart" 
      :pageItemsEnd="pageItemsEnd" 
      :totalItems="totalItems">
    </pagination>
  </div>
</template>

<script>
  import axios from 'axios'
  import { eventHub } from '../metadata.js'
  import { setCsrfToken } from '../helpers/request-helpers'

  import Filters from './filters/Filters.vue'
  import Pagination from './pagination/Pagination.vue'
  import Search from './form-fields/Search.vue'
  import VTable from './table/Table.vue'

  export default {
    name: 'metadata',

    components: {
      Filters, Pagination, Search, VTable
    },

    props: {
      filterSrc: String,
      dataSrc: {
        type: String,
        required: true
      },
      tableHeaders: Array,
      itemsPerPage: {
        type: Number,
        default: 10
      }
    },

    data () {
      return {
        filters: [],
        currentPage: 1,
        pageItemsStart: 0,
        pageItemsEnd: 0,
        totalItems: 0,
        totalPages: 0,
        sortDirection: 1,
        items: []
      }
    },

    mounted () {
      this.checkThemeParameter()
      this.getNewItems()
      eventHub.$on('getNewItems', this.getNewItems)
    },

    methods: {
      updateProperties (data) {
        this.filters = data.filters
        this.currentPage = data.current_page
        this.pageItemsStart = data.page_items_start
        this.pageItemsEnd = data.page_items_end
        this.totalItems = data.total_items
        this.totalPages = data.total_pages
        this.items = data.items
        
      },

      getNewItems () {
        let data = {
          params: {
            filters: this.$store.state.selectedFilterOptions,
            items_per_page: this.itemsPerPage,
            requested_page: this.$store.state.requestedPage,
            sortDirection: this.$store.state.sortDirection,
            sortField: this.$store.state.sortField,
            searchTerm: this.$store.state.searchTerm
          }
        }
        
        setCsrfToken(axios)
        axios.defaults.headers.common['Accept'] = 'application/json'


        axios.post(this.dataSrc, data)
        .then(response => {
          this.updateProperties(response.data)
        })
        .catch(function (error) {
          console.log(error)
        })
      },

      checkThemeParameter () {
        let queryString = window.location.search.slice(1);
        
        if(queryString) {
          let obj = {}

          // anything after # is not part of query string, so get rid of it
          queryString = queryString.split('#')[0]

          // split the query string into its component parts
          let arr = queryString.split('&')

          for (let i=0; i<arr.length; i++) {

            // separate the keys and the values
            const a = arr[i].split('=');

            // build up object
            obj[a[0]] = a[1]
          }

          // check to see if there is a theme parameter
          if(obj['theme']){

            const eventSelectTheme = 'select_' + obj['theme']

            // trigger functions to select the theme filter option and apply the filters
            eventHub.$emit(eventSelectTheme, obj['theme'])
          }
        }
      }
    }
  }
</script>