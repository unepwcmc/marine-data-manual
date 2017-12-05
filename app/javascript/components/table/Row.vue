<template>
  <div>
    <tr class="table__row" @click="toggleRow()">
      <td>{{ category }}</td>
      <td>{{ trim(resource) }}</td>
      <td>{{ version }}</td>
      <td>{{ contactOrganistion }}</td>
      <td>{{ id }}</td>
      <td><a v-if="hasMetadata" :href="metadata">Link</a></td>
      <td><a v-if="hasFactsheet" :href="factsheet">Link</a></td>
      <td>
        <span v-if="marineSpatialPlanning" class="icon--round icon--theme icon--theme-1">MSP</span>
        <span v-if="education" class="icon--round icon--theme icon--theme-2">E</span>
        <span v-if="environmentalImpactAssessment" class="icon--round icon--theme icon--theme-3">EIM</span>
        <span v-if="ecosystemAssessment" class="icon--round icon--theme icon--theme-4">EA</span>
        <span v-if="ecosystemServices" class="icon--round icon--theme icon--theme-5">ES</span>
      </td>
    </tr>
    <tr class="table__row--expandable" :class="{ 'table__row--open' : isOpen }">
      <td colspan="8">
        <a href="">{{ resource }}</a>
      </td>
    </tr>
  </div>
</template>

<script>
  import { eventHub } from '../../metadata.js'

  export default {
    name: "row",
    props: {
      index: {
        required: true
      },
      category: { 
        type: String,
        required: true
      },
      resource: { 
        type: String 
      },
      version: { 
        type: String 
      },
      contactOrganistion: { 
        type: String 
      },
      id: { 
        type: Number 
      },
      metadata: { 
        type: String,
        required: true
      },
      factsheet: { 
        type: String,
        required: true
      },
      marineSpatialPlanning: {
        type: Boolean,
        required: true
      },
      education: {
        type: Boolean,
        required: true
      },
      environmentalImpactAssessment: {
        type: Boolean,
        required: true
      },
      ecosystemAssessment: {
        type: Boolean,
        required: true
      },
      ecosystemServices: {
        type: Boolean,
        required: true
      }
    },

    data () {
      return {
        isOpen: false
      }
    },

    computed: {
      hasMetadata () {
        return this.metadata.length !== 0
      },

      hasFactsheet () {
        return this.factsheet.length !== 0
      },
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
      },

      toggleRow () {
        eventHub.$emit('toggleRow', this.index)
      }
    }
  }
</script>

<style lang="scss">
  @import '../../scss/includes.scss';

  .table__row {
    cursor: pointer;

    &--expandable {
      overflow: hidden;
      height: auto;
      max-height: 0;

      display: block;

      transition: max-height .8s ease-in-out;
    }
    
    &--open { max-height: rem-calc(100); }
  }
</style>