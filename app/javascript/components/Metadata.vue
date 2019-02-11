<template>
  <div>
    <filters :filters="filters"></filters>

    <!-- <v-table :tableHeaders="tableHeaders" :metadata="metadata"></v-table> -->

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

  import Filters from './filters/Filters.vue'
  import Pagination from './pagination/Pagination.vue'
  import VTable from './table/Table.vue'

  export default {
    name: 'metadata',

    components: {
      Filters, Pagination, VTable
    },

    props: {
      filters: Array,
      tableHeaders: Array,
      metadata: Array,
      itemsPerPage: {
        type: Number,
        default: 10
      }
    },

    data () {
      return {
        currentPage: 1,
        pageItemsStart: 0,
        pageItemsEnd: 0,
        totalItems: 0,
        totalPages: 0,
        sortDirection: 1,
        items: []
      }
    },

    created () {
      this.getNewItems()
    },

    mounted () {
      eventHub.$on('getNewItems', this.getNewItems)
    },

    methods: {
      updateProperties (data) {
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
            requested_page: this.$store.state.requestedPage,
            filters: this.$store.state.selectedFilterOptions
          }
        }

        const csrf = document.querySelectorAll('meta[name="csrf-token"]')[0].getAttribute('content')
        axios.defaults.headers.common['X-CSRF-Token'] = csrf
        axios.defaults.headers.common['Accept'] = 'application/json'

        axios.post('/metadata-list', data)
        .then(response => {
          console.log(response.data)
          this.updateProperties(response.data)
        })
        .catch(function (error) {
          console.log(error)
        })
      },
    }
  }
</script>