<template>
  <div>
    <input type="text" v-model="searchTerm" class="filter__search">

    <div class="filter__options-padding">
      <filter-radio-buttons
        :options="options"
        :name="name"
        :title="title"
        :type="type"
        :searchTerm="searchTerm"
        >
      </filter-radio-buttons>
    </div>
  </div>
</template>

<script>
  import FilterRadioButtons from './FilterRadioButtons.vue'

  export default {
    name: 'filter-search',

    components: { FilterRadioButtons },

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
        searchTerm: ''
      }
    },

    methods: {
      
    }
  }
</script>