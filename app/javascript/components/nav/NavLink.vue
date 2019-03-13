<template>
  <a :href="href" :class="['nav__a', { 'active': currentPage }, classes]">{{ title }}</a>
</template>

<script>
  export default {
    name: 'nav-link',

    props: {
      href: { 
        type: String,
        required: true 
      },
      title: { 
        type: String,
        required: true 
      },
      currentPage: Boolean,
      classes: String
    }
  }  
</script>