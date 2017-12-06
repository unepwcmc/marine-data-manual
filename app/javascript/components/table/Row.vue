<template>
  <div class="table__row-wrapper" v-show="item.isActive">
    <tr @click="toggleRow()" class="table__row" :class="{ 'table__row--active' : isOpen }" >
      <td>{{ item.category }}</td>
      <td>{{ trim(item.resource) }}</td>
      <td>{{ item.version }}</td>
      <td>{{ item.contact_organisation }}</td>
      <td>{{ item.id }}</td>
      <td><a v-if="hasMetadata" :href="item.metadata">Link</a></td>
      <td><a v-if="hasFactsheet" :href="item.factsheet">Link</a></td>
      <td>
        <span v-if="item.marine_spatial_planning" class="icon--round icon--theme icon--theme-1">MSP</span>
        <span v-if="item.education" class="icon--round icon--theme icon--theme-2">E</span>
        <span v-if="item.ecosystem_assessment" class="icon--round icon--theme icon--theme-3">EA</span>
        <span v-if="item.environmental_impact_assessment" class="icon--round icon--theme icon--theme-4">EIM</span>
        <span v-if="item.ecosystem_services" class="icon--round icon--theme icon--theme-5">ES</span>
      </td>
    </tr>
    <tr class="table__row--expandable flex" :class="{ 'table__row--open' : isOpen }">
      
      <div class="flex-2-fiths">
        <h3>Resource</h3>
        {{ item.resource }}
      </div>
      <div class="flex-3-fiths">
        <h3>Themes</h3>
        <div class="flex table__themes">
          <ul class="ul-unstyled flex-2-fiths">
            <li v-if="item.marine_spatial_planning" class="table__theme">
              <span class="icon--round icon--theme icon--theme-1">MSP</span>
              <span class="table__theme-title">{{ themeName('marine_spatial_planning') }}</span>
            </li>
            <li v-if="item.education" class="table__theme">
              <span class="icon--round icon--theme icon--theme-2">E</span>
              <span class="table__theme-title">{{ themeName('education') }}</span>
            </li>
            <li v-if="item.ecosystem_assessment" class="table__theme">
              <span class="icon--round icon--theme icon--theme-3">EA</span>
              <span class="table__theme-title">{{ themeName('ecosystem_assessment') }}</span>
            </li>
          </ul>
          <ul class="ul-unstyled flex-3-fiths">
            <li v-if="item.environmental_impact_assessment" class="table__theme">
              <span class="icon--round icon--theme icon--theme-4">EIM</span>
              <span class="table__theme-title">{{ themeName('environmental_impact_assessment') }}</span>
            </li>
            <li v-if="item.ecosystem_services" class="table__theme">
              <span class="icon--round icon--theme icon--theme-5">ES</span> 
              <span class="table__theme-title">{{ themeName('ecosystem_services') }}</span>
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
    props: {      index: {
        required: true
      },
      item: { 
        type: Object,
        required: true
      }
    },

    data () {
      return {
        isOpen: false,
        isActive: ''
      }
    },

    computed: {
      hasMetadata () {
        return this.item.metadata.length !== 0
      },

      hasFactsheet () {
        return this.item.factsheet.length !== 0
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
        return name.replace(/_/g, ' ')
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
