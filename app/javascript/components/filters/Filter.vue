<template>
  <div class="filter">
    <p
      @click="openSelect()"
      class="filter__button button"
      :class="{ 'filter__button--active' : isOpen , 'filter__button--has-selected' : hasSelected }">

      {{ title }} <span v-show="hasSelected" class="filter__button-total">{{ totalSelectedOptions }}</span>
    </p>

    <div class="filter__options" :class="{ 'filter__options--active' : isOpen }">

      <template v-if="type == 'search'">
        <div class="filter__options--search" :class="filterClass">
          <filter-search
            v-on:apply:filter="apply"
            v-on:clear:filter="updateAllTo(false)"
            v-on:click:selectMultipleOptions="updateAllTo"
            :options="options"
            :name="name"
            :title="title"
            :type="type"
            :selectMultiple="selectMultiple"
            :activeOptions="activeOptions">
          </filter-search>
        </div>
      </template>

      <template v-else>
        <ul class="ul-unstyled filter__options-list filter__options-padding" :class="filterClass">
          <template v-if="type == 'boolean'">
            <filter-radio-buttons
              :options="options"
              :name="name"
              :title="title"
              :type="type">
            </filter-radio-buttons>
          </template>

          <template v-else>
            <filter-option v-for="option in options" 
              :option="option"
              :isTheme="isThemeFilter"
              :selected="false">
            </filter-option>
          </template>
        </ul>
      </template>

      <div :class="['filter__buttons', { 'filter__buttons--search': type == 'search' }]">
        <button @click="updateAllTo(false)" class="button--link bold float-left">Clear</button>
        <button @click="cancel()" class="button--link">Cancel</button>
        <button @click="apply()" class="button--link button--link--green bold">Apply</button>
      </div>
    </div>
  </div>
</template>

<script>
  import { eventHub } from '../../metadata.js'
  import FilterOption from './FilterOption.vue'
  import FilterRadioButtons from './FilterRadioButtons.vue'
  import FilterSearch from './FilterSearch.vue'

  export default {
    name: 'v-filter',

    components: { FilterOption, FilterRadioButtons, FilterSearch },

    props: {
      title: {
        required: true,
        type: String
      },
      name: String,
      options: Array,
      type: String,
      selectMultiple: Object // { filterBy: String, option: String }
    },

    data () {
      return {
        children: this.$children,
        isOpen: false,
        activeOptions: []
      }
    },

    computed: {
      // set a flag for theme options that belong to the theme filter
      // this is used to prefilter the table for an individual theme
      isThemeFilter () {
        return this.name === 'themes'
      },

      hasOptions () { return this.options.length > 0 },

      selectedOptions () {
        let selectedArray = []

        if(this.hasOptions) {

          this.children.forEach(child => {
            if(this.type == 'boolean' && child.isSelected != null) {
              selectedArray.push(child.isSelected)
            } else if (this.type == 'search') {
              child.children.forEach(child => {
                if(child.isSelected){
                  selectedArray.push(child.option)
                }
              })
            } else {
              if(child.isSelected){
                selectedArray.push(child.option)
              }
            }
          })
        }
        
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
      }
    },

    created () {
      eventHub.$on('clearFilter', this.clear)
      eventHub.$on('resetFilter', this.reset)
    },

    methods: {
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

        if(this.hasOptions) {
          // reset each option to the correct state
          this.children.forEach(child => {
            if(this.type == 'boolean') {
              child.isSelected = this.activeOptions[0]
            } else if(this.type == 'search') {
              child.children.forEach(child => {
                child.isSelected = this.activeOptions.indexOf(child.option) > -1 ? true : false
              })
              child.searchTerm = ''
            } else {
              child.isSelected = this.activeOptions.indexOf(child.option) > -1 ? true : false
            }
          })
        }
      },

      updateAllTo (condition) {
        if(this.hasOptions) {
          console.log(condition)
          if(typeof condition === 'boolean') {
            // set the isSelected property on all options to true/false
            const boolean = condition
            
            this.children.forEach(child => {
              if(this.type == 'boolean') {
                child.isSelected = condition ? true : null
                return false
              } else if(this.type == 'search') {
                child.$children.forEach(child => {
                  child.isSelected = boolean
                })
                child.searchTerm = ''
              } else {
                child.isSelected = boolean
              }
            })
          } else {
            // set the isSelected property true/false depending on whether it statisfies the criteria
            this.children.forEach(child => {
              if(this.type == 'boolean') { return false 
              } else if(this.type == 'search') {
                child.children.forEach(child => {
                  if(condition.propName in child && child[condition.propName]) {
                    child.isSelected = condition.select
                  }
                })
                child.searchTerm = ''
              } else {
                if(condition.propName in child && child[condition.propName]) {
                  child.isSelected = condition.select
                }
              }
            })
          }
        }
      },

      apply () {
        this.closeSelect()
        eventHub.$emit('createSelectedFilterArray')
        eventHub.$emit('clearSearch')

        if(this.type == 'search') { eventHub.$emit('resetSearchTerm') }

        //update the active filters array
        this.activeOptions = this.selectedOptions

        const newFilterOptions = {
          filter: this.name,
          options: this.activeOptions
        }
        
        this.$store.dispatch('updateFilterParameters', newFilterOptions)
        eventHub.$emit('getNewItems')
      },

      clear () {
        this.updateAllTo(false)
      },

      reset () {
        this.updateAllTo(false)
        this.apply()
      }
    }
  }
</script>
  