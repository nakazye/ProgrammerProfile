spec_require =
  paths:
    mocha: '../lib/js/mocha'
  shim:
    mocha:
      exports: 'mocha'

require = window.require || {}
for key, val of spec_require.paths
  require.paths[key] = val
for key, val of spec_require.shim
  require.shim[key] = val
