<template>
  <th :class="{ 'breakpoint-medium-up': !onMobile }">
    <span class="table__header">{{ title }}</span>

    <div v-if="sortButtons" class="table__sorting" @click="sort()">
      <span alt="Sort results" class="table__sort"></span>
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
      },

      onMobile: {
        type: Boolean,
        default: false
      }
    },

    methods: {
      sort () {
        eventHub.$emit('sort', this.name)
      }
    }
  }
</script>