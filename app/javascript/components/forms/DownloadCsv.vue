<template>
  <a
    @click="download()"
    title="Download CSV file"
    class="inline-block button button--download button--green filter__download">
    CSV
  </a>
</template>

<script>
  import axios from 'axios'

  export default {
    name: 'download-csv',

    methods: {
      download () {
        let data = {
          params: {
            filters: this.$store.state.selectedFilterOptions,
            items_per_page: this.itemsPerPage,
            requested_page: this.$store.state.requestedPage,
            sortDirection: this.$store.state.sortDirection,
            sortField: this.$store.state.sortField
          }
        }

        const csrf = document.querySelectorAll('meta[name="csrf-token"]')[0].getAttribute('content')
        axios.defaults.headers.common['X-CSRF-Token'] = csrf
        axios.defaults.headers.common['Accept'] = 'application/json'

        axios.post('/download', data)
          .then(function (response) {
            console.log(response);
          })
          .catch(function (error) {
            console.log(error)
          })
      }
    }
  }
</script>
