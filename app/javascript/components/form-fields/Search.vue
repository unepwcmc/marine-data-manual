<template>
  <div class="search">
    <input type="text" v-model="searchTerm" placeholder="Search" class="search__input">
    <i class="search__icon" v-show="noSearchTerm" @click="applySearch()"></i>
    <i class="search__icon close" v-show="!noSearchTerm" @click="clear()"></i>
  </div>
</template>

<script>
  export default {
    name: 'search',

    noSearchTerm () {
      return this.searchTerm.length == 0
    },

    data () {
      return {
        searchTerm: ''
      }
    },

    computed: {
      noSearchTerm () {
        return this.searchTerm.length == 0
      }
    }
  }
</script>