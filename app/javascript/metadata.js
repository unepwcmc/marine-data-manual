import Vue from 'vue/dist/vue.esm'
import VueAnalytics from 'vue-analytics'

import store from './store/store.js'

import Accordion from './components/accordion/Accordion.vue'
import AccordionItem from './components/accordion/AccordionItem'
import VForm from './components/forms/VForm'
import Metadata from './components/Metadata.vue'
import NavBurger from './components/nav/NavBurger.vue'
import NavLink from './components/nav/NavLink.vue'
import Popout from './components/popout/Popout.vue'

if (window._railsEnv === 'production') {
  Vue.use(VueAnalytics, {
    id: 'UA-112614361-2',
    checkDuplicatedScript: true
  })
}

// create event hub and export so that it can be imported into .vue files
export const eventHub = new Vue()

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: '#v-app',
    store,
    components: { Accordion, AccordionItem, Metadata, NavBurger, NavLink, Popout, VForm }
  })
})
