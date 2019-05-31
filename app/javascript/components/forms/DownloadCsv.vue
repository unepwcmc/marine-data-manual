<template>
  <a
    @click="download()"
    title="Download CSV file"
    class="inline-block button button--download button--green filter__download">
    Download
  </a>
</template>

<script>
  import axios from 'axios'

  export default {
    name: 'download-csv',

    methods: {
      download () {
        this.$ga.event('Button - Download Metadata CSV', 'click', 'Click download metadata csv')
        
        const csrf = document.querySelectorAll('meta[name="csrf-token"]')[0].getAttribute('content'),
        data = {
          params: {
            filters: this.$store.state.selectedFilterOptions,
            items_per_page: this.itemsPerPage,
            requested_page: this.$store.state.requestedPage,
            sortDirection: this.$store.state.sortDirection,
            sortField: this.$store.state.sortField
          }
        },
        config = {
          headers: {
            'X-CSRF-Token': csrf,
            'Accept': 'text/csv',
            'responseType': 'blob'
          }
        }

        axios.post('/download', data, config)
          .then((response) => {
            const date = new Date().toJSON().slice(0,10),
              filename = `marine-data-manual-${date}.csv`

            this.createBlob(filename, response.data)
            this.$ga.event('AJAX - Download Metadata CSV', 'request', 'Metadata csv request successful')
          })
          .catch(function (error) {
            console.log(error)
            this.$ga.event('AJAX- Download Metadata CSV', 'request', 'Metadata csv request failed')
          })
      },

      createBlob (filename, data) {
        let blob = new Blob([data])

        if (typeof window.navigator.msSaveBlob !== 'undefined') {
          // IE workaround for "HTML7007: One or more blob URLs were
          // revoked by closing the blob for which they were created.
          // These URLs will no longer resolve as the data backing
          // the URL has been freed."
          window.navigator.msSaveBlob(blob, filename)

        } else {
          const blobURL = window.URL.createObjectURL(blob),
            tempLink = document.createElement('a')

          // Safari thinks _blank anchor are pop ups. We only want to set _blank
          // target if the browser does not support the HTML5 download attribute.
          // This allows you to download files in desktop safari if pop up blocking
          // is enabled.
          if (typeof tempLink.download === 'undefined') {
              tempLink.setAttribute('target', '_blank')
          }

          tempLink.href = blobURL
          tempLink.setAttribute('download', filename)
          this.simulateClick(tempLink)
          window.URL.revokeObjectURL(blobURL)
        }
      },

      simulateClick (element) {
        // created because standard .click() doesn't work in Firefox
        const event = new MouseEvent('click', {
          bubbles: true,
          cancelable: true,
          view: window
        })
        // If cancelled, don't dispatch our event
        var canceled = !element.dispatchEvent(event)
      }
    }
  }
</script>
