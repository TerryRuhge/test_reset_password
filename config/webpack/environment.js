const { environment } = require('@rails/webpacker')

module.exports = environment

// enable JQUERY support
const webpack = require('webpack')
environment.plugins.prepend('Provide',
new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery'
})
)
