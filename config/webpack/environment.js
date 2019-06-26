const { environment } = require('@rails/webpacker')
const { VueLoaderPlugin } = require('vue-loader')
const vue = require('./loaders/vue')
// const merge = require('webpack-merge')

// const myCssLoaderOptions = {
//   modules: true,
//   sourceMap: true,
//   localIdentName: '[name]__[local]___[hash:base64:5]'
// }

environment.plugins.prepend('VueLoaderPlugin', new VueLoaderPlugin())
environment.loaders.prepend('vue', vue)

// const CSSLoader = environment.loaders.get('style').use.find(el => el.loader === 'css-loader')

// CSSLoader.options = merge(CSSLoader.options, myCssLoaderOptions)

module.exports = environment
