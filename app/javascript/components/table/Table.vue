<template>
  <div>
    <table class="table table--head">
      <table-head :tableHeaders="tableHeaders"></table-head>
    </table>
    
    <table class="table table--body">
      <tbody>
        <row v-for="(item, index) in items"
          :key="index"
          :index="index"
          :item="item">
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
      tableHeaders: { type: Array },
      items: { type: Array }
    },

    mounted () {
      eventHub.$on('toggleRow', this.toggleRow)
    },

    methods: {
      toggleRow (index) {
        this.$children.forEach(child => {
          // open the expandable section only if it is already closed and 
          // it matches the row being clicked on
          child.isOpen = child.index === index && child.isOpen !== true
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

    td, th { word-break: break-word; }
  }
</style>
