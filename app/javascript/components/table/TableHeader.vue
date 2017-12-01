<template>
  <th>
    <span class="table__header">{{ title }}</span>

    <div v-if="sortButtons" class="table__sorting" @click="sort()">
      <span alt="Sort results" class="table__sort table__sort--ascending"></span>
      <span alt="Sort results" class="table__sort table__sort--descending"></span>
    </div>
  </th>
</template>

<script>
  import { eventHub } from '../../metadata.js'
  
  export default {
    name: 'table-header',

    props: {
      name: {
        required: true,
        type: String
      },
      title: {
        required: true,
        type: String
      },
      sortButtons: {
        required: true,
        type: Boolean
      }
    },

    methods: {
      sort () {
        eventHub.$emit('sort', this.name)
      }
    }
  }
</script>