<template>
  <div class="height-100">
    <div class="relative">
      <input type="text" v-model="searchTerm" @keyup.enter="enterPressed()" class="filter--search">
      <i class="filter--search-icon" v-show="noSearchTerm" @click="enterPressed()"></i>
      <i class="filter--search-icon close" v-show="!noSearchTerm" @click="clear()"></i>
    </div>

    <ul class="ul-unstyled filter__options-list filter__options-list--search">
      <li v-for="option in options" class="filter--search-option">
        <p 
          v-show="matches(option)" 
          @click="clickOption(option)"
          class="filter--search-label no-margin"
          :class="{ 'filter--search-label--active' : isActive(option) }">
          
          {{ option }}
        </p>
      </li>
    </ul>
  </div>
</template>

<script>
  import { eventHub } from '../../metadata.js'

  export default {
    name: 'filter-search',

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
      isActive (option) {
        return option == this.isSelected
      },

      optionId (option) {
        return option.replace(' |(|)|_', '-').toLowerCase()
      },

      matches (option) {
        const noSearch = this.searchTerm == '',
          regex = new RegExp(`${this.searchTerm}`, 'i'),
          match = option.match(regex)

        return noSearch || match
      },

      clear () {
        this.searchTerm = ''
        this.isSelected = null
        this.applySearch()
      },

      enterPressed () { 
        const optionIndex = this.options.indexOf(this.searchTerm)
        
        if(optionIndex > 0) {
          this.isSelected = this.options[optionIndex]
        }

        if(this.noSearchTerm) {
          this.isSelected = null
        }

        this.applySearch()
      },

      clickOption (option) {
        this.isSelected = option
        this.searchTerm = this.isSelected
        this.applySearch()
      },

      applySearch () {
        this.$emit('apply:filter')
      }
    }
  }
</script>