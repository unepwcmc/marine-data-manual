<template>
  <tr @click="openModal()" v-show="item.isActive">
    <td>{{ item.id }}</td>
    <td :title="item.project_title">{{ projectTitle }}</td>
    <td>{{ checkForMultiples('donors') }}</td>
    <td>{{ item.status }}</td>
    <td>{{ item.category }}</td>
    <td>{{ checkForMultiples('ecosystem') }}</td>
    <td>{{ checkForMultiples('country') }}</td>
    <td>{{ checkForMultiples('ocean_based_region') }}</td>
    <td>{{ item.total_project_cost }}</td>
  </tr>
</template>

<script>
  import { eventHub } from '../../home.js'

  export default {
    name: "row",
    props: {
      item: {
        required: true,
        type: Object,
      }
    },

    computed: {
      projectTitle () {
        return this.trim(this.item.project_title)
      }
    },

    methods: {
      trim (phrase) {
        const length = phrase.length
        let output

        if (length <= 30) {
          output = phrase
        } else {
          output = phrase.substring(0,27) + '...'
        }

        return output
      }
    }
  }
</script>
