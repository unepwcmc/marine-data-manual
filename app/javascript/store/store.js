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
    sortField: '',
    searchTerm: ''
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
      console.log('this.state.selectedFilterOptions', this.state.selectedFilterOptions)
      this.state.selectedFilterOptions.forEach(filter => {
        if(filter.name == newOptions.filter){

          // replace filter options array with newOptions array
          filter.options = newOptions.options
        }
      })
    },

    updateSortDirection (state, direction) {
      this.state.sortDirection = direction
    },

    updateSortField (state, field) {
      this.state.sortField = field
    },

    updateSearchTerm (state, searchTerm) {
      this.state.searchTerm = searchTerm
    }
  },

  actions: {
    updateSortParameters ({ commit }, sortParamters) {
      commit('updateSortDirection', sortParamters.direction)
      commit('updateSortField', sortParamters.field)
      commit('updateRequestedPage', 1)
    },

    updateFilterParameters ({ commit }, filterOptions) {
      console.log('store filterOptions', filterOptions)
      commit('updateFilterOptions', filterOptions)
      commit('updateSortDirection', '')
      commit('updateSortField', '')
      commit('updateRequestedPage', 1)
    },

    search ({ commit }, searchTerm) {
      commit('updateSearchTerm', searchTerm)
      commit('updateSortDirection', '')
      commit('updateSortField', '')
      commit('updateRequestedPage', 1)
    }
  }
})
