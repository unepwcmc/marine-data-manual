<template>
  <!-- <tr @click="toggleExpand()" v-show="item.isActive"> -->
  <tr class="table__row">
    <td>{{ category }}</td>
    <td>{{ resource }}</td>
    <td>{{ version }}</td>
    <td>{{ contactOrganisation }}</td>
    <td>{{ id }}</td>
    <td><a v-if="hasMetadata" :href="metadata">Link</a></td>
    <td><a v-if="hasFactsheet" :href="factsheet">Link</a></td>
    <td>themes</td>
  </tr>
</template>

<script>
  import { eventHub } from '../../metadata.js'

  export default {
    name: "row",
    props: {
      category: {
        type: String
      },
      resource: {
        type: String
      },
      version: {
        type: String
      },
      contactOrganisation: {
        type: String
      },
      id: {
        type: Number
      },
      metadata: {
        type: String
      },
      factsheet: {
        type: String
      },
    },

    computed: {
      hasMetadata () {
        return this.metadata.length !== 0
      },
      hasFactsheet () {
        return this.factsheet.length !== 0
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

<style lang="scss">
  @import '../../scss/includes.scss';

  .table__row {
    background-color: $grey-light;
    cursor: pointer;

    &:nth-child(even){ background-color: $blue-light; }

    &:hover { background-color: $grey; }
  }
</style>
