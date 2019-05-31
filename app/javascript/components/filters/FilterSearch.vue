<template>
  <div class="height-100">
    <div class="filter--search">
      <input type="text" v-model="searchTerm" :placeholder="placeholder" class="search__input">
      <i class="search__icon" v-show="noSearchTerm" @click="applySearch()"></i>
      <i class="search__icon close" v-show="!noSearchTerm" @click="clear()"></i>
    </div>

    <ul class="ul-unstyled filter__options-list filter__options-list--search filter__options-padding">
      <filter-select-multiple v-if="selectMultiple"
        :option="selectMultiple.title"
        :filterBy="selectMultiple.filter"
        v-on:click:selectMultiple="selectMultipleOptions"
        >
      </filter-select-multiple>

      <template v-for="option in options">
        <filter-option v-show="matches(option)"
          :option="option"
          :selected="false"
          ref="childOption">
        </filter-option>
      </template>
    </ul>
  </div>
</template>

<script>
  import { eventHub } from '../../metadata.js'
  import FilterOption from './FilterOption.vue'
  import FilterSelectMultiple from './FilterSelectMultiple.vue'

  export default {
    name: 'filter-search',

    components: { FilterOption, FilterSelectMultiple },

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
      selectMultiple: Object
    },

    data () {
      return {
        children: {},
        searchTerm: ''
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

    mounted () {
      this.children = this.$refs.childOption
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
      },

      selectMultipleOptions (object) {
        this.$emit('click:selectMultipleOptions', object)
      }
    }
  }
</script>