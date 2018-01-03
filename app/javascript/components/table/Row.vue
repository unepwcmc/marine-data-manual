<template>
  <div class="table__row-wrapper" v-show="item.isActive">
    <tr @click="toggleRow()" class="table__row" :class="{ 'table__row--active' : isOpen }" >
      <td>{{ item.category }}</td>

      <td>
        <a v-if="hasResourceLink" :href="item.website_download_link" title="Visit resource website" target="_blank">{{ trim(item.resource) }}</a>
        <template v-else>{{ trim(item.resource) }}</template>
      </td>

      <td>{{ item.version }}</td>
      <td>{{ item.contact_organisation }}</td>
      <td>{{ item.id }}</td>
      <td><a v-if="hasMetadata" :href="item.metadata" title="View metadata" target="_blank">Link</a></td>
      <td><a v-if="hasFactsheet" :href="item.factsheet" title="View factsheet" target="_blank">Link</a></td>
      <td>
        <span v-for="theme in item.themes" class="table__theme-icon icon--round icon--theme" :class="themeClass(theme)"></span>
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
          <ul class="ul-unstyled">
            <li v-for="theme in item.themes" class="table__theme">
              <a :href="themeUrl(theme)" class="table__theme-link flex f-v-center">
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
        isOpen: false,
        isActive: ''
      }
    },

    computed: {
      hasMetadata () {
        return !!this.item.metadata
      },

      hasFactsheet () {
        return !!this.item.factsheet
      },

      hasResourceLink () {
        return !!this.item.website_download_link
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
