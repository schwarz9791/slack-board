// config/webpack.js

var webpack = require('webpack');
var path = require('path');
var entry = require("../tasks/entry");

// compile js assets into a single bundle file
module.exports.webpack = {
  options: {
    cache: true,
    entry: (function() {
      var valueGenerator = function(filename) { return "./assets/js/" + entry.splitext(filename); };
      var _entry = entry.entryFiles("./views", undefined, valueGenerator);

      return _entry;
    }()),
    output: {
      path: path.join(__dirname, "../.tmp/public/dist/js"),
      publicPath: "dist/",
      filename: "[name].js",
      chunkFilename: "[chunkhash].js"
    },
    resolve: {
      // jQueryなどはnpmでインストールした物を読み込むため、`node_modules`以下にパスを通しておく。
      modulesDirectories: ["node_modules"]
    },
    module: {
      preLoaders: [
      ],
      loaders: [
        // requires "npm install --save-dev babel-loader"
        { test: /\.tag$/, loader: 'tag', query: {template: "jade"} },
        { test: /\.js$/, loader: "babel-loader", query: {presets: ["es2015"]} },
        { test: /\.css$/, loader: 'style!css' }
      ]
    }
  },

  // docs: https://webpack.github.io/docs/node.js-api.html#compiler
  watchOptions: {
    aggregateTimeout: 300
  }
};
