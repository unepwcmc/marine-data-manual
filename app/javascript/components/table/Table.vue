<template>
  <div>
    <table class="table table--head">
      <table-head :tableHeaders="tableHeaders"></table-head>
    </table>
    
    <table class="table table--body">
      <tbody>
        <row v-for="(item, index) in metadata"
          :key="index"
          :index="index"
          :item="item">
        </row>
      </tbody>
    </table>
  </div>
</template>
<script>
  import { eventHub } from '../../metadata.js'

  import TableHead from './TableHead.vue'
  import Row from './Row.vue'

  export default {
    name: 'v-table',

    components: { TableHead, Row },

    props: {
      tableHeaders: { type: Array },
      metadata: { type: Array }
    },

    mounted () {
      // eventHub.$on('getNewItems', this.getNewItems)

      // refilter the items when the filters are changed
      // eventHub.$on('callFilterItems', this.filterItems)

      // filter items on page load
      // eventHub.$emit('callFilterItems')

      // repaginate the items when the previous/next buttons are clicked
      // eventHub.$on('callPaginateItems', this.paginateItems)

      // sort the active items when a sort button is clicked
      // eventHub.$on('sort', this.sortActiveItems)

      // open/close expandable section
      eventHub.$on('toggleRow', this.toggleRow)

      //check url for theme parameter and add it to the selected filter options
      this.checkThemeParameter()
    },

    methods: {
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
            eventHub.$emit(eventSelectTheme)
            eventHub.$emit('applyFilters')
          }
        }
      },

      toggleRow (index) {
        this.children.forEach(child => {
          // open the expandable section only if it is already closed and 
          // it matches the row being clicked on
          child.isOpen = child.index === index && child.isOpen !== true
        })
      }
    }
  }
</script>

<style lang="scss">
  @import '../../scss/includes.scss';

  //--------------------------------------------------
  // animations
  //--------------------------------------------------
  @keyframes showHeader {
    from {
      transform: translateY(-100%);
    }
    to {
      transform: translateY(0);
    }
  }

  //--------------------------------------------------
  // table styles
  //--------------------------------------------------
  .table {
    border-collapse: collapse;
    table-layout: fixed;
    width: 100%;

    td, th { word-break: break-word; }
  }
</style>
