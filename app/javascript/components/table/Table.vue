<template>
  <div>
    <table class="table table--head">
      <table-head :filters="filters"></table-head>
    </table>
    
    <table class="table table--body">
      <tbody>
        <row v-for="(item, index) in items"
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
      filters: { type: Array },
      metadata: { type: Array }
    },

    data () {
      return {
        children: this.$children,
        items: [],
        itemsOnCurrentPage: [],
        sortDirection: 1
      }
    },

    created () {
      this.$store.commit('setItems', this.metadata)

      this.$store.commit('updateTotalItems', this.$store.state.items.length)

      this.items = this.metadata
    },

    mounted () {
      // refilter the items when the filters are changed
      eventHub.$on('callFilterItems', this.filterItems)

      // filter items on page load
      eventHub.$emit('callFilterItems')

      // repaginate the items when the previous/next buttons are clicked
      eventHub.$on('callPaginateItems', this.paginateItems)

      // sort the active items when a sort button is clicked
      eventHub.$on('sort', this.sortActiveItems)

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
      },

      filterItems () {
        this.$store.commit('clearActiveItems')

        // an item must match one option from each filter (if any have been selected)
        this.items.forEach(item => {
          let filterMatch = true

          this.$store.state.selectedFilterOptions.forEach(filter => {
            
            // if there are some selected options check to see if one matches
            if (filter.options.length !== 0) {
              let optionMatch = false

              // check the boolean value for filters with type boolean
              if (filter.type === 'boolean'){

                filter.options.forEach(option => {
                  
                  if (option.toLowerCase() === filter.name) {
                    if(item[filter.name] !== null) optionMatch = true
                  } else {
                    if (item[filter.name] === null) optionMatch = true
                  }
                })

              } else if (filter.type === 'multiple') {

                const arrayOfValues = item[filter.name]

                arrayOfValues.forEach(value => {
                  filter.options.forEach(option => {
                    if (value === option) optionMatch = true
                  })
                })

              } else {
                filter.options.forEach(option => {
                  if (item[filter.name] == option) optionMatch = true
                })
              }

              // once filterMatch is set to false it will always be false and the item
              // will not be shown because it did match at least one option in every active filter
              filterMatch = filterMatch && optionMatch
            }
          })

          // only push the item id into the active items array if there are no fails
          if (filterMatch) {
            this.$store.commit('updateActiveItems', item.id)
          }
        })

        eventHub.$emit('callPaginateItems')
        this.$store.commit('updateCurrentPage', 1)
        this.$store.commit('updateTotalItems', this.$store.state.activeItems.length)
        eventHub.$emit('callUpdateButtons');
      },

      // only display the items that match the page number
      paginateItems () {
        const itemsPerPage = this.$store.state.itemsPerPage
        const pageStart = (this.$store.state.currentPage - 1) * itemsPerPage
        const pageEnd =  pageStart + itemsPerPage;

        this.itemsOnCurrentPage = this.$store.state.activeItems.slice(pageStart, pageEnd)

        // loop through all articles and update the active state
        this.items.forEach(item => {

          const isActive = this.itemsOnCurrentPage.indexOf(item.id) >= 0

          this.$set(item, 'isActive', isActive)
        })
      },

      sortActiveItems (filter) {
        console.log('sort')
        // sort the items using the main array the contains all data
        this.$store.state.items.sort(this.compare(filter))

        // trigger filtering function so that the active items array is updated with
        // the new order and the results are paginated correctly
        this.filterItems()
      },

      compare (filter) {
        // use a negative to alternate the direction of the order
        this.sortDirection = this.sortDirection * -1

        // order the items using the correct property
        return (a, b) => {
          let result = (a[filter] < b[filter]) ? -1 : (a[filter] > b[filter]) ? 1 : 0;
          
          return result * this.sortDirection;
        }
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

    td, th { word-wrap: break-word; }
  }
</style>
