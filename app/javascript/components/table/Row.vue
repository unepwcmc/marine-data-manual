<template>
  <div class="table__row-wrapper">
    <tr @click="toggleRow()" class="table__row" :class="{ 'table__row--active' : isOpen }" >
      <td class="table__td breakpoint-medium-up">{{ item.category }}</td>

      <td class="table__td">
        <a v-if="hasResourceLink" :href="item.website_download_link" title="Visit resource website" target="_blank">{{ trim(item.resource) }}</a>
        <template v-else>{{ trim(item.resource) }}</template>
      </td>

      <td class="table__td breakpoint-medium-up">{{ item.contact_organisation }}</td>

      <td class="table__td breakpoint-medium-up">
        <span v-for="theme in item.themes" class="table__theme-icon icon--round icon--theme" :class="themeClass(theme)"></span>
      </td>
    </tr>
    <tr class="table__row--expandable" :class="{ 'table__row--open' : isOpen }">
      <div class="table__row--expandable__td">
        <p><span class="bold">Resource:</span> {{ item.resource }}</p>
        <p><span class="bold">Version:</span> {{ item.version }}</p>
        <p><span class="bold">ID:</span> {{ item.dataset_id }}</p>
        <p><span class="bold">Language:</span> {{ item.language }}</p>
        <p><span class="bold">Metadata:</span> <a v-if="hasMetadata" :href="item.pdf_link" title="View metadata" class="external" target="_blank">Link ></a></p>
        <p><span class="bold">Factsheet:</span> <a v-if="hasFactsheet" :href="item.factsheet" title="View factsheet" class="external" target="_blank">Link ></a></p>
        <p><span class="bold">Licence:</span> <a v-if="hasLicence" :href="item.license_url" title="View licence" class="external" target="_blank">Link ></a></p>
        <p><span class="bold">Includes data for ABNJ:</span> {{ includesABNJ(item) }}</p>
      </div>
      <div class="table__row--expandable__td">
        <p class="bold">Themes:</p>
        <div class="table__themes">
          <ul class="ul-unstyled table__themes-list">
            <li v-for="theme in item.themes" class="table__theme">
              <a :href="themeUrl(theme)" class="table__theme-link flex flex-v-center">
                <span class="icon--round icon--theme" :class="themeClass(theme)"></span>
                <span class="table__theme-title">{{ theme }}</span>
              </a>
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
      item: {
        type: Object,
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
        return !!this.item.metadata
      },

      hasFactsheet () {
        return !!this.item.factsheet
      },

      hasLicence () {
        return !!this.item.license_number
      },

      hasResourceLink () {
        return !!this.item.website_download_link
      }
    },

    methods: {
      includesABNJ (item) {
        return item.abnj_rel ? 'Yes' : 'No'
      },
      
      trim (phrase) {
        const length = phrase.length
        let output

        if (length <= 90) {
          output = phrase
        } else {
          output = phrase.substring(0,87) + '...'
        }

        return output
      },

      themeName (name) {
        return name.replace(/_/g, ' ')
      },

      themeClass (name) {
        return 'icon--theme-' + name.replace(/ /g, '-').toLowerCase()
      },

      toggleRow () {
        eventHub.$emit('toggleRow', this.index)
      },

      themeUrl (theme) {
        const regex = new RegExp(' ', 'g')

        return '/' + theme.toLowerCase().replace(regex, '-')
      }
    }
  }
</script>
