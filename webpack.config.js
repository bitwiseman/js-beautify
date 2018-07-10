var path = require('path');

var legacy = {
  mode: 'none',
  entry: {
    beautify_js: './js/src/javascript/index.js',
    beautify_css: './js/src/css/index.js',
    beautify_html: './js/src/html/index.js'
  },
  resolve: {
    modules: [ path.resolve(__dirname, "js/src") ]
  },
  output: {
    library: 'legacy_[name]',
    filename: 'legacy_[name].js',
    path: path.resolve(__dirname, 'dist')
  }
};

var dist_full = {
  entry: './js/src/index.js',
  mode: 'none',
  resolve: {
    modules: [ path.resolve(__dirname, "js/src") ]
  },
  output: {
    library: 'beautifier',
    libraryTarget: 'umd',
    umdNamedDefine: true,
    libraryExport: 'default',
    // Enable output modules to be used in browser or Node.
    // See: https://github.com/webpack/webpack/issues/6522
    globalObject: "typeof self !== 'undefined' ? self : this",
    filename: 'beautifier.js',
    path: path.resolve(__dirname, 'dist')
  }
};

var dist_prod = {
  entry: './js/src/index.js',
  mode: 'production',
  resolve: {
    modules: [ path.resolve(__dirname, "js/src") ]
  },
  output: {
    library: 'beautifier',
    libraryTarget: 'umd',
    umdNamedDefine: true,
    libraryExport: 'default',
    // Enable output modules to be used in browser or Node.
    // See: https://github.com/webpack/webpack/issues/6522
    globalObject: "typeof self !== 'undefined' ? self : this",
    filename: 'beautifier.min.js',
    path: path.resolve(__dirname, 'dist')
  }
};


module.exports = [dist_full, dist_prod, legacy];
