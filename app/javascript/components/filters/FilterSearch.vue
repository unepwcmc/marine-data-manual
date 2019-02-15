<template>
  <div>
    <input type="text" v-model="searchTerm" @keyup.enter="enterPressed(searchTerm)" class="filter__search">

    <div class="">
      <filter-radio-buttons
        v-on:update:search-term="applySearch"
        :options="options"
        :name="name"
        :title="title"
        :type="type"
        :searchTerm="searchTerm"
        :eventName="eventName"
        :propIsSelected="isSelected">
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

    computed: {
      noSearchTerm () {
        return this.searchTerm.length == 0
      }
    },

    methods: {
      enterPressed () { 
        const optionIndex = this.options.indexOf(this.searchTerm)
        
        if(optionIndex > 0) {
          this.applySearch(this.options[optionIndex])
        }

        if(this.noSearchTerm) {
          this.applySearch(this.searchTerm) 
          this.isSelected = null
        }
      },

      applySearch (option) {
        this.isSelected = this.noSearchTerm ? null : option
        this.searchTerm = option
        this.$emit('apply:filter')
      }
    }
  }
</script>