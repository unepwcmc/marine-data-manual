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
    sortDirection: '',
    sortField: ''
  },

  mutations: {
    updateRequestedPage (state, page) {
      this.state.requestedPage = page
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

    updateSortDirection (state, direction) {
      this.state.sortDirection = direction
    },

    updateSortField (state, field) {
      this.state.sortField = field
    }
  },

  actions: {
    updateSortParameters ({ commit }, sortParamters) {
      commit('updateSortDirection', sortParamters.direction)
      commit('updateSortField', sortParamters.field)
    },

    updateFilterParameters ({ commit }, filterOptions) {
      commit('updateFilterOptions', filterOptions)
      commit('updateSortDirection', '')
      commit('updateSortField', '')
    }
  }
})
