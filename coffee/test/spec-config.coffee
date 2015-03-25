spec_require =
  paths:
    mocha: '../../../node_modules/mocha/mocha'
  shim:
    mocha:
      exports: 'mocha'

require = window.require || {}
require.baseUrl = './ProgrammerProfile/staticfiles/js/'
for key, val of spec_require.paths
  require.paths[key] = val
for key, val of spec_require.shim
  require.shim[key] = val
