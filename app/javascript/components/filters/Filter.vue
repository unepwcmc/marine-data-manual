<template>
  <div v-if="hasOptions" class="filter">
    <p
      @click="openSelect()"
      class="filter__button button"
      :class="{ 'filter__button--active' : isOpen , 'filter__button--has-selected' : hasSelected }">

      {{ title }} <span v-show="hasSelected" class="filter__button-total">{{ totalSelectedOptions }}</span>
    </p>

    <div class="filter__options" :class="{ 'filter__options--active' : isOpen }">
      <template v-if="isSearch">
        <div>
          <input type="text" v-model="searchTerm" class="filter__search">
        </div>
      </template>

      <div class="filter__options-padding ">
        <ul class="ul-unstyled filter__options-list">
          <template v-if="isSearch" v-for="option in options">
            <filter-radio v-show="matches(option)"
              :option="option"
              :selected="false"
              :name="name">
            </filter-radio>
          </template>

          <template v-else>
            <filter-option v-for="option in options"
              :option="option"
              :isTheme="isThemeFilter"
              :selected="false">
            </filter-option>
          </template>
        </ul>

        <div class="filter__buttons">
          <button @click="clear()" class="button--link bold float-left">Clear</button>
          <button @click="cancel()" class="button--link">Cancel</button>
          <button @click="apply()" class="button--link button--link--green bold">Apply</button>
        </div>
      </div>
    </div>

  </div>
</template>

<script>
  import { eventHub } from '../../metadata.js'
  import FilterOption from './FilterOption.vue'
  import FilterRadio from './FilterRadio.vue'

  export default {
    name: 'v-filter',

    components: { FilterOption, FilterRadio },

    props: {
      name: {
        type: String
      },
      title: {
        required: true,
        type: String
      },
      options: {
        type: Array
      },
      type: {
        type: String
      }
    },

    data () {
      return {
        children: this.$children,
        isOpen: false,
        activeOptions: [],
        searchTerm: ''
      }
    },

    computed: {
      // set a flag for theme options that belong to the theme filter
      // this is used to prefilter the table for an individual theme
      isThemeFilter () {
        return this.name === 'themes'
      },

      // only show the select if the filter is a real filter and not just a table title
      hasOptions () {
        return this.options != undefined && this.name != undefined
      },

      selectedOptions () {
        let selectedArray = []

        this.children.forEach(child => {
          if(this.type == 'boolean' && child.isSelected != null) {
            selectedArray.push(child.isSelected)
          } else {
            if(child.isSelected){
              selectedArray.push(child.option)
            }
          }
        })

        return selectedArray
      },

      hasSelected () {
        return this.totalSelectedOptions > 0
      },

      totalSelectedOptions () {
        return this.selectedOptions.length
      },

      filterClass () {
        return 'filter__options--' + this.name.replace('_| |(|)', '-').toLowerCase()
      },

      isSearch () {
        return this.type == 'search'
      }
    },

    created () {
      eventHub.$on('apply', this.apply)
    },

    methods: {
      matches (option) {
        const noSearch = this.searchTerm == '',
          regex = new RegExp(`${this.searchTerm}`, 'i'),
          match = option.match(regex)

        return noSearch || match
      },

      openSelect () {
        if(this.isOpen){
          this.cancel()
        } else {
          eventHub.$emit('clickDropdown', this.name)
        }
      },

      closeSelect () {
        this.isOpen = false
      },

      cancel() {
        this.closeSelect()

        // reset each option to the correct state
        this.children.forEach(child => {
          if(this.type == 'boolean') {
            child.isSelected = this.activeOptions[0]
          } else {
            child.isSelected = this.activeOptions.includes(child.option) ? true : false
          }

        })
      },

      clear () {
        // set the isSelected property on all options to false
        this.children.forEach(child => {
          child.isSelected = this.type == 'boolean' ? null : false
        })
      },

      apply () {
        this.closeSelect()

        //update the active filters array
        this.activeOptions = this.selectedOptions

        const newFilterOptions = {
          filter: this.name,
          options: this.activeOptions
        }

        this.$store.dispatch('updateFilterParameters', newFilterOptions)
        eventHub.$emit('getNewItems')
      }
    }
  }
</script>
