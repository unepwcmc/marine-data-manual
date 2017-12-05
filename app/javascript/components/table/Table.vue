<template>
  <div>
    <table class="table table--head">
      <table-head :filters="filters"></table-head>
    </table>

    <table class="table table--body">
      <tbody>
        <row v-for="(item, index) in items"
          :key="index"
          :index="index"
          :category="item.category"
          :resource="item.resource"
          :version="item.version"
          :contactOrganistion="item.contact_organistion"
          :id="item.id"
          :metadata="item.metadata"
          :factsheet="item.factsheet"
          :marineSpatialPlanning="item.marine_spatial_planning"
          :education="item.education"
          :environmentalImpactAssessment="item.environmental_impact_assessment"
          :ecosystemAssessment="item.ecosystem_assessment"
          :ecosystemServices="item.ecosystem_services">
        </row>
      </tbody>
    </table>
  </div>
</template>
<script>
  import { eventHub } from '../../metadata.js'
  import TableHead from './TableHead.vue'
  import Row from './Row.vue'

  export default {
    name: 'v-table',

    components: { TableHead, Row },

    props: {
      filters: { type: Array },
      metadata: { type: Array }
    },

    data () {
      return {
        items: [],
        children: this.$children
      }
    },

    created () {
      this.items = this.metadata
      this.$store.commit('updateTotalItems', this.items.length)
      eventHub.$on('toggleRow', this.toggleRow)
    },

    methods: {
      toggleRow (index) {
        this.children.forEach(child => {
          child.isOpen = child.index === index
        })
      }
    }
  }
</script>

<style lang="scss">
  @import '../../scss/includes.scss';
  
  //--------------------------------------------------
  // animations
  //--------------------------------------------------
  @keyframes showHeader {
    from {
      transform: translateY(-100%);
    }
    to {
      transform: translateY(0);
    }
  }

  //--------------------------------------------------
  // table styles
  //--------------------------------------------------
  .table {
    border-collapse: collapse;
    table-layout: fixed;
    width: 100%;

    &--head {
      margin-top: rem-calc(30);
    }

    &--body {
      margin-bottom: rem-calc(40);
    }

    td, th { word-wrap: break-word; }

  //**************************************************
  // column headers <th>
  //**************************************************
    &__header {
      margin-right: rem-calc(2);
      vertical-align: middle;

      display: inline-block;
    }

  //**************************************************
  // columns
  //**************************************************
    
    // fix the columns widths so that they don't change
    // size when you use the pagination 
    th,td {
      &:first-child { width: 60px; }
      &:nth-child(2) { width: 144px; }
      &:nth-child(3) { width: 130px; }
      &:nth-child(4) { width: 104px; }
      &:nth-child(5) { width: 142px; }
      &:nth-child(6) { width: 132px; }
      &:nth-child(7) { width: 118px; }
      &:nth-child(8) { width: 154px; }
      &:nth-child(9) { width: 176px; }
    }

  //**************************************************
  // sort column buttons
  //**************************************************
    &__sorting {
      opacity: .7;
      vertical-align: middle;

      display: inline-block;

      &:hover { opacity: .9; }
    }

      &__sort {
        cursor: pointer;
        width: rem-calc(8); height: rem-calc(6);

        display: block;

        &--ascending {
          // background-image: image-url('icons/arrow-up-white.svg');
          margin-bottom: rem-calc(1);
        }

        &--descending {
          // background-image: image-url('icons/arrow-down-white.svg');
        }
      }
  }
</style>
