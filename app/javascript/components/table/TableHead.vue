<template>
  <thead id="sticky" class="table__head" :class="{ 'table__head--stuck' : isSticky }">
    <tr class="table__row--head">
      <table-header v-for="tableHeader in tableHeaders" 
        :name="tableHeader.name"
        :title="tableHeader.title"
        :sortButtons="tableHeader.sortButtons"
        :onMobile="tableHeader.onMobile">
      </table-header>
    </tr>

    <download-csv class="table__button"></download-csv>
  </thead>
</template>

<script>
  import DownloadCsv from '../forms/DownloadCsv.vue'
  import TableHeader from './TableHeader.vue'

  export default {
    name: 'table-head',

    components: { DownloadCsv, TableHeader },

    props: {
      tableHeaders: {
        required: true,
        type: Array
      }
    },

    data() {
      return {
        stickyTrigger: 0,
        isSticky: false
      }
    },

    mounted () {
      this.setStickyTrigger()
      this.scrollHandler()
    },

    methods: {
      setStickyTrigger () {
        const stickyElement = document.getElementById('sticky')
        const stickyElementHeight = stickyElement.clientHeight
        const stickyYOffset = stickyElement.getBoundingClientRect().top + window.pageYOffset

        this.stickyTrigger = stickyElementHeight + stickyYOffset
      },

      scrollHandler () {
        setInterval( () => {
          let scrollY = window.pageYOffset

          this.isSticky = scrollY > this.stickyTrigger ? true : false
        }, 100)
      }
    }
  }
</script>