import { polyfill } from 'es6-promise'
polyfill()

import Vue from 'vue/dist/vue.esm'
import Vuex from 'vuex/dist/vuex.esm'

Vue.use(Vuex)

// create store
export default new Vuex.Store({
  state: {
    totalItemsOnCurrenPage: 0,
    pageItemsStart: 0,
    pageItemsEnd: 0,
    totalItems: 0,
    requestedPage: 1,
    selectedFilterOptions: [], // an array containing an object for each filter that has an array of selected options
    sortDirection: ''
  },

  mutations: {
    updateRequestedPage (state, page) {
      this.state.requestedPage = page
    },

    updatePageItemsStart (state, total) {
      this.state.requestedPage = total
    },

    updatePageItemsEnd (state, total) {
      this.state.requestedPage = total
    },

    updateTotalItems (state, total) {
      this.state.requestedPage = totalge
    },

    updateActiveItems (state, item) {
      this.state.activeItems.push(item)
    },

    clearActiveItems () {
      this.state.activeItems = []
    },
    
    updateCurrentPage (state, currentPage) {
      this.state.currentPage = currentPage
    },

    setFilterOptions (state, options) {
      this.state.selectedFilterOptions = options
    },

    updateFilterOptions (state, newOptions) {
      // find the correct filter to update
      this.state.selectedFilterOptions.forEach(filter => {
        if(filter.name == newOptions.filter){

          // replace filter options array with newOptions array
          filter.options = newOptions.options
        }
      })
    },

    clearFilterOptions () {
      this.state.selectedFilterOptions.forEach(filter => {
        filter.options = []
      })
    },

    removeFilterOption (state, removeOption) {

      this.state.selectedFilterOptions.forEach(filter => {
        if(filter.name == removeOption.name){ 
          filter.options.forEach(option => {
            if(option == removeOption.option){
              const index = filter.options.indexOf(removeOption.option)

              filter.options.splice(index, 1)
            }
          })
        }
      })
    },

    updateModalContent (state, content) {
      this.state.modalContent = content
    },

    updateSortDirection (state, direction) {
      this.state.sortDirection = direction
    },

    setItemsPerPage (state, total) {
      this.state.itemsPerPage = total
    }
  }
})
