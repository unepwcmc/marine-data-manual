<template>
  <div class="height-100">
    <div class="relative">
      <input type="text" v-model="searchTerm" :placeholder="placeholder" class="filter--search">
      <i class="filter--search-icon" v-show="noSearchTerm" @click="applySearch()"></i>
      <i class="filter--search-icon close" v-show="!noSearchTerm" @click="clear()"></i>
    </div>

    <ul class="ul-unstyled filter__options-list filter__options-list--search filter__options-padding">
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
      },

      placeholder () {
        return `Search ${this.title}`
      }
    },

    created () {
      eventHub.$on('resetSearchTerm', this.resetSearchTerm)
    },

    methods: {
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
      },

      applySearch () {
        this.resetSearchTerm()
        this.$emit('apply:filter')
      }
    }
  }
</script>