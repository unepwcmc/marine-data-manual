<template>
  <div>
    <input type="text" v-model="searchTerm" @keyup.enter="applySearch()" class="filter__search">

    <div class="">
      <filter-radio-buttons
        v-on:update:search-term="applySearch"
        :options="options"
        :name="name"
        :title="title"
        :type="type"
        :searchTerm="searchTerm"
        :eventName="eventName">
      </filter-radio-buttons>
    </div>
  </div>
</template>

<script>
  import { eventHub } from '../../metadata.js'
  import FilterRadioButtons from './FilterRadioButtons.vue'

  export default {
    name: 'filter-search',

    components: { FilterRadioButtons },

    props: {
      options: {
        required: true,
        type: Array
      },
      name: {
        required: true,
        type: String
      },
      title: {
        required: true,
        type: String
      },
      type: {
        required: true,
        type: String
      },
      eventName: {
        required: true,
        type: String
      }
    },

    data () {
      return {
        searchTerm: '',
        isSelected: null
      }
    },

    mounted () {
      eventHub.$on('updateSearchTerm', this.updateSearchTerm)
    },

    methods: {
      updateSearchTerm (searchTerm) {
        this.searchTerm = searchTerm
      },

      applySearch (option) {
        this.searchTerm = option
        this.isSelected = option
        this.$emit('apply:filter')
      }
    }
  }
</script>