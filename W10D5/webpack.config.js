// webpack.config.js
var path = require('path');

module.exports = {
    entry: "./getting_started_with_npm/entry.jsx",
    output: {
        filename: "./getting_started_with_npm/index.html",
    },
    devtool: 'source-map',
    resolve: {
        extensions: ['.js', '.jsx','*']
    }
};