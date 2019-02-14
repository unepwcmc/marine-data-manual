<template>
  <li class="filter__option">
    <input type="radio" :name="name" :id="optionId" v-model="isSelected" class="filter__radio" :class="{ 'filter__radio--active' : isSelected }">
    <label :for="optionId" class="filter__radio-label">{{ option }}</label>
  </li>
</template>

<script>
  import { eventHub } from '../../metadata.js'

  export default {
    name: 'filter-radio',

    props: {
      option: {
        required: true,
        type: String
      },
      name: String
    },

    data () {
      return {
        isSelected: false
      }
    },

    computed : {
      optionId () {
        return this.option.replace(' |(|)|_', '-').toLowerCase()
      }
    },

    methods: {
      selectOption (option) {
        this.isSelected = true
      }
    }
  }
</script>
