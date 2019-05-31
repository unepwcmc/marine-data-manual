<template>
  <div class="search">
    <input type="text" v-model="searchTerm" @keyup.enter="applySearch()" placeholder="Search" class="search__input">
    <i class="search__icon" v-show="!haveSearched" @click="applySearch()"></i>
    <i class="search__icon close" v-show="haveSearched" @click="clear()"></i>
  </div>
</template>

<script>
  import { eventHub } from '../../metadata.js'

  export default {
    name: 'search',

    noSearchTerm () {
      return this.searchTerm.length == 0
    },

    data () {
      return {
        searchTerm: '',
        haveSearched: false
      }
    },

    computed: {
      noSearchTerm () {
        return this.searchTerm.length == 0
      }
    },

    methods: {
      applySearch () {
        eventHub.$emit('clearFilter')
        this.$store.dispatch('search', this.searchTerm)
        eventHub.$emit('getNewItems')
        this.haveSearched = this.searchTerm == '' ? false : true
      },

      clear () {
        this.searchTerm = ''
        this.$store.dispatch('search', this.searchTerm)
        eventHub.$emit('getNewItems')
        this.haveSearched = false
      }
    }
  }
</script>