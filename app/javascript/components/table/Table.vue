<template>
  <div>
    table
    <table class="table table--head">
      <!-- <table-head :filters="filters"></table-head> -->
    </table>

    <table class="table table--body">
      <tbody>
        <!-- <row v-for="item, key in items"
          :key="key"
          :item="item">
         --></row>
      </tbody>
    </table>
  </div>
</template>
<script>
  export default {
    name: 'v-table'
  }
</script>

<style>
  body {
    color: red;
  }
</style>
