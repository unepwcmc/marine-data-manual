import { polyfill } from 'es6-promise'
polyfill()

import Vue from 'vue/dist/vue.esm'
import Vuex from 'vuex/dist/vuex.esm'

Vue.use(Vuex)

// create store
export default new Vuex.Store({
  state: {
    totalItems: [], // total number of data objects
  },

  mutations: {
    updateTotalItems (state, total) {
      this.state.totalItems = total 
    }
  }
})