gulp           = require 'gulp'
gutil          = require 'gulp-util'
coffee         = require 'gulp-coffee'
flatten        = require 'gulp-flatten'
filter         = require 'gulp-filter'
runSequence    = require 'run-sequence'
bower          = require 'main-bower-files'
rimraf         = require 'rimraf'
sourcemaps     = require 'gulp-sourcemaps'
coffeelint     = require 'gulp-coffeelint'
mochaPhantomJS = require 'gulp-mocha-phantomjs'

static_root = './ProgrammerProfile/staticfiles'

paths =
  src:
    coffee:    './coffee/src'
  test:
    coffee:    './coffee/test'
  dest:
    lib:
      js:      "#{static_root}/lib/js"
      css:     "#{static_root}/lib/css"
      fonts:   "#{static_root}/lib/fonts"
    js:        "#{static_root}/js"

# =============================================
# bower
# =============================================
gulp.task 'bower:clean', (callback) ->
  rimraf "#{static_root}/lib/",
  callback

gulp.task 'bower:js', ->
  jsFilter = filter '**/*.js'
  gulp
    .src bower()
    .pipe jsFilter
    .pipe flatten()
    .pipe gulp.dest "#{paths.dest.lib.js}"

gulp.task 'bower:css', ->
  cssFilter = filter '**/*.css'
  gulp
    .src bower()
    .pipe cssFilter
    .pipe flatten()
    .pipe gulp.dest "#{paths.dest.lib.css}"

gulp.task 'bower:font', ->
  fontFilter = filter '**/glyphicons-halflings-regular.*'
  gulp
    .src bower()
    .pipe fontFilter
    .pipe flatten()
    .pipe gulp.dest "#{paths.dest.lib.fonts}"

gulp.task 'bower', ['bower:clean'], (callback) ->
  runSequence(
    ['bower:js', 'bower:css', 'bower:font'],
    callback
  )


# =============================================
# my coffee script
# =============================================
gulp.task 'coffee:lint', () ->
  gulp.src "#{paths.src.coffee}/**/*.coffee"
  .pipe coffeelint('coffeelint.json')
  .pipe coffeelint.reporter()

gulp.task 'coffee:compile', ->
  gulp.src "#{paths.src.coffee}/**/*.coffee"
  .pipe sourcemaps.init()
  .pipe coffee()
  .pipe sourcemaps.write()
  .pipe gulp.dest "#{paths.dest.js}"

gulp.task 'coffee:clean', (cb) ->
  rimraf "#{paths.dest.js}", cb

gulp.task 'coffee', ['coffee:clean'], (callback) ->
  runSequence(
    'coffee:lint',
    'coffee:compile',
    callback
  )


# =============================================
# test
# =============================================
gulp.task 'test:compile', ->
  gulp.src "#{paths.test.coffee}/**/*.coffee"
  .pipe sourcemaps.init()
  .pipe coffee()
  .pipe sourcemaps.write()
  .pipe gulp.dest "#{paths.dest.js}"

gulp.task 'test:mocha', ->
  gulp.src 'mochaPhantomJsRunner.html'
  .pipe mochaPhantomJS({reporter: 'spec'})

gulp.task 'test', ['test:compile'], (callback) ->
  runSequence(
    'test:compile',
    'test:mocha'
    callback
  )

# =============================================
# default
# =============================================

gulp.task 'default', ->
  runSequence(
    ['bower', 'coffee'],
    'test'
  )
