<template>
  <div class="height-100">
    <div class="relative">
      <input type="text" v-model="searchTerm" @keyup.enter="enterPressed()" class="filter--search">
      <i class="filter--search-icon" v-show="noSearchTerm" @click="enterPressed()"></i>
      <i class="filter--search-icon close" v-show="!noSearchTerm" @click="clear()"></i>
    </div>

    <ul class="ul-unstyled filter__options-list filter__options-list--search filter__options-padding">
      <!-- <li v-for="option in options" class="filter--search-option">
        <p 
          v-show="matches(option)" 
          @click="clickOption(option)"
          class="filter--search-label no-margin"
          :class="{ 'filter--search-label--active' : isActive(option) }">
          
          {{ trim(option) }}
        </p>
      </li> -->
      <template v-for="option in options">
        <filter-option v-show="matches(option)"
          :option="option"
          :selected="false">
        </filter-option>
      </template>
    </ul>
  </div>
</template>

<script>
  import { eventHub } from '../../metadata.js'
  import FilterOption from './FilterOption.vue'

  export default {
    name: 'filter-search',

    components: { FilterOption },

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
        children: this.$children,
        searchTerm: '',
      }
    },

    computed: {
      noSearchTerm () {
        return this.searchTerm.length == 0
      }
    },

    created () {
      eventHub.$on('resetSearchTerm', this.resetSearchTerm)
    },

    methods: {
      isActive (option) {
        return option == this.isSelected
      },

      optionId (option) {
        return option.replace(' |(|)|_', '-').toLowerCase()
      },

      trim (phrase) {
        const length = phrase.length
        let output

        if (length <= 90) {
          output = phrase
        } else {
          output = phrase.substring(0,87) + '...'
        }

        return output
      },

      matches (option) {
        const noSearch = this.searchTerm == '',
          regex = new RegExp(`${this.searchTerm}`, 'i'),
          match = option.match(regex)

        return noSearch || match
      },

      resetSearchTerm () {
        this.searchTerm = ''
      },

      clear () {
        this.resetSearchTerm()
        // this.applySearch()
        this.$emit('clear:filter')
      },

      // enterPressed () { 
      //   const optionIndex = this.options.indexOf(this.searchTerm)
        
      //   if(optionIndex > 0) {
      //     this.isSelected = this.options[optionIndex]
      //   }

      //   if(this.noSearchTerm) {
      //     this.isSelected = null
      //   }

      //   this.applySearch()
      // },

      // clickOption (option) {
      //   this.isSelected = option
      //   this.searchTerm = this.isSelected
      //   this.applySearch()
      // },

      applySearch () {
        this.resetSearchTerm()
        this.$emit('apply:filter')
      }
    }
  }
</script>