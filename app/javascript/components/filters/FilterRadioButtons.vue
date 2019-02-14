<template>
  <ul>
    <li class="filter__option" v-for="option in options">
      <input type="radio" :name="name" :id="optionId(option)" :value="option" v-model="selected" class="filter__checkbox" :class="{ 'filter__checkbox--active' : isSelected(option) }">
      <label :for="optionId(option)" class="filter__checkbox-label">{{ optionTitle(option) }}</label>
    </li>
  </ul>
</template>

<script>
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
      }
    },

    data () {
      return {
        selected: null
      }
    },

    methods : {
      isSelected (option) {
        return option == this.selected
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
      }
    },
  }
</script>