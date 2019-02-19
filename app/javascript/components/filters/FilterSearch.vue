<template>
  <div>
    <div class="relative">
      <input type="text" v-model="searchTerm" @keyup.enter="enterPressed()" class="filter__search">
      <i class="filter__search-icon" v-show="noSearchTerm" @click="enterPressed()"></i>
      <i class="filter__search-icon close" v-show="!noSearchTerm" @click="clear()"></i>
    </div>

    <ul class="ul-unstyled">
      <li v-for="option in options">
        <p v-show="matches(option)" class="no-margin">
          <label 
            @click="clickOption(option)"
            class="filter__search-label" 
            :class="{ 'filter__search-label--active' : isActive(option) }">
            {{ option }}
          </label>
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