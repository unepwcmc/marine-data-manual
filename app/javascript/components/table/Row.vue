<template>
  <div class="table__row-wrapper">
    <tr @click="toggleRow()" class="table__row" :class="{ 'table__row--active' : isOpen }" >
      <td>{{ category }}</td>
      <td>{{ trim(resource) }}</td>
      <td>{{ version }}</td>
      <td>{{ contactOrganisation }}</td>
      <td>{{ id }}</td>
      <td><a v-if="hasMetadata" :href="metadata">Link</a></td>
      <td><a v-if="hasFactsheet" :href="factsheet">Link</a></td>
      <td>
        <span v-if="marineSpatialPlanning" class="icon--round icon--theme icon--theme-1">MSP</span>
        <span v-if="education" class="icon--round icon--theme icon--theme-2">E</span>
        <span v-if="ecosystemAssessment" class="icon--round icon--theme icon--theme-3">EA</span>
        <span v-if="environmentalImpactAssessment" class="icon--round icon--theme icon--theme-4">EIM</span>
        <span v-if="ecosystemServices" class="icon--round icon--theme icon--theme-5">ES</span>
      </td>
    </tr>
    <tr class="table__row--expandable flex" :class="{ 'table__row--open' : isOpen }">
      
      <div class="flex-2-fiths">
        <h3>Resource</h3>
        {{ resource }}
      </div>
      <div class="flex-3-fiths">
        <h3>Themes</h3>
        <div class="flex table__themes">
          <ul class="ul-unstyled flex-2-fiths">
            <li v-if="marineSpatialPlanning" class="table__theme">
              <span class="icon--round icon--theme icon--theme-1">MSP</span>
              <span class="table__theme-title">{{ themeName('marineSpatialPlanning') }}</span>
            </li>
            <li v-if="education" class="table__theme">
              <span class="icon--round icon--theme icon--theme-2">E</span>
              <span class="table__theme-title">{{ themeName('education') }}</span>
            </li>
            <li v-if="ecosystemAssessment" class="table__theme">
              <span class="icon--round icon--theme icon--theme-3">EA</span>
              <span class="table__theme-title">{{ themeName('ecosystemAssessment') }}</span>
            </li>
          </ul>
          <ul class="ul-unstyled flex-3-fiths">
            <li v-if="environmentalImpactAssessment" class="table__theme">
              <span class="icon--round icon--theme icon--theme-4">EIM</span>
              <span class="table__theme-title">{{ themeName('environmentalImpactAssessment') }}</span>
            </li>
            <li v-if="ecosystemServices" class="table__theme">
              <span class="icon--round icon--theme icon--theme-5">ES</span> 
              <span class="table__theme-title">{{ themeName('ecosystemServices') }}</span>
            </li>
          </ul>
        </div>
      </div>
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
      contactOrganisation: { 
        type: String 
      },
      id: { 
        type: String 
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
      },

      themeName (name) {
        return name.replace(/([A-Z])/g, ' $1')
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

      transition: max-height .3s ease-in-out;
    }
    
    &--open { 
      max-height: rem-calc(212);
    }
  }
</style>
