<template>
  <li class="filter__option--checkbox">
    <input type="checkbox" :id="optionId" v-model="isSelected" class="filter__checkbox" :class="{ 'filter__checkbox--active' : isSelected }">
    <label :for="optionId" class="filter__checkbox-label">{{ option }}</label>
  </li>
</template>

<script>
  import { eventHub } from '../../metadata.js'

  export default {
    name: 'filter-option',

    props: {
      option: {
        required: true
      },
      isAlreadySelected: Boolean,
      isTheme: Boolean
    },

    data () {
      return {
        default: false,
        isSelected: false
      }
    },

    created () {
      // add event listener if the filter option belongs to the theme filter
      // this is needed to trigger pre-filtering of the data when the user 
      // is directed to the metadata list page from a theme page
      if(this.isTheme) {
        const regex = new RegExp(' ', 'g')
        const event = 'select_' + this.option.toLowerCase().replace(regex, '')
        
        eventHub.$on(event, this.preselectOption)
      }      
    },

    computed: {
      optionId () {
        const regex = new RegExp(' ', 'g'),
          regex2 = new RegExp('"', 'g')
        return this.option.replace(regex, '-').replace(regex2, '').toLowerCase() + Math.random()
      }
    },

    watch: {
      isAlreadySelected () {
        if(this.isAlreadySelected) { this.selectOption() }
      }
    },

    methods: {
      selectOption (option) {
        this.isSelected = true
      },

      preselectOption (option) {
        this.selectOption(option)
        eventHub.$emit('apply')
      }
    }
  }
</script>
