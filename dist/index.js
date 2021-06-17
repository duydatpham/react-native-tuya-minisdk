
'use strict'

if (process.env.NODE_ENV === 'production') {
  module.exports = require('./react-native-tuya-minisdk.cjs.production.min.js')
} else {
  module.exports = require('./react-native-tuya-minisdk.cjs.development.js')
}
