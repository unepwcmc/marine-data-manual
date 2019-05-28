<template>
  <li class="filter__option--checkbox">
    <input type="checkbox" :id="optionId" v-model="isSelected" class="filter__checkbox" :class="{ 'filter__checkbox--active' : isSelected }">
    <label :for="optionId" class="filter__checkbox-label">{{ option }}</label>
  </li>
</template>

<script>
  import { eventHub } from '../../metadata.js'

  export default {
    name: 'filter-select-multiple',

    props: {
      option: {
        type: String,
        required: true
      },

      filterBy: {
        type: String,
        required: true
      }
    },

    data () {
      return {
        isSelected: false
      }
    },

    computed: {
      optionId () {
        const regex = new RegExp(' ', 'g'),
          regex2 = new RegExp('"', 'g')
        return this.option.replace(regex, '-').replace(regex2, '').toLowerCase()
      }
    },

    watch: {
      isSelected () {
        eventHub.$emit('selectMultipleOptions', { propName: this.filterBy, select: this.isSelected })
      }
    }
  }
</script>