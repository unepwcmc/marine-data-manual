<template>
  <div>
    <template v-if="type == 'search'">
      <li v-for="option in options">
        <p v-show="matches(option)" class="no-margin">
          <input type="radio" :name="name" :id="optionId(option)" :value="option" v-model="isSelected" class="hide">
          <label :for="optionId(option)" 
            @click="search(option)"
            class="filter__search-label" 
            :class="{ 'filter__search-label--active' : isActive(option) }">
            {{ optionTitle(option) }}
          </label>
        </p>
      </li>
    </template>

    <template v-else>
      <li class="filter__option--checkbox" v-for="option in options">
        <input type="radio" :name="name" :id="optionId(option)" :value="option" v-model="isSelected" class="filter__checkbox" :class="{ 'filter__checkbox--active' : isActive(option) }">
        <label :for="optionId(option)" class="filter__checkbox-label">{{ optionTitle(option) }}</label>
      </li>
    </template>
  </div>
</template>

<script>
  import { eventHub } from '../../metadata.js'

  export default {
    name: 'filter-radio-button',

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
      searchTerm: String,
      eventName: String
    },

    data () {
      return {
        isSelected: null
      }
    },

    methods : {
      isActive (option) {
        return option == this.isSelected
      },

      optionId (option) {
        const title = this.optionTitle(option)
        return title.replace(' |(|)|_', '-').toLowerCase()
      },

      optionTitle (option) {
        return this.type == 'boolean' ? this.booleanTitle(option) : option
      },

      booleanTitle (boolean) {
        return boolean ? this.title : `No ${this.title}`
      },

      matches (option) {
        const noSearch = this.searchTerm == '',
          regex = new RegExp(`${this.searchTerm}`, 'i'),
          match = option.match(regex)

        return noSearch || match
      },

      search(option) {
        console.log('emit ')
        this.$emit('update:search-term', option)
      }
    },
  }
</script>