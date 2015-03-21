gulp        = require 'gulp'
gutil       = require 'gulp-util'
runSequence = require 'run-sequence'
bower       = require 'main-bower-files'
flatten     = require 'gulp-flatten'
filter      = require 'gulp-filter'
rimraf      = require('rimraf');

static_root = './ProgrammerProfile/staticfiles'

paths =
  dest:
    lib:
      js:      "#{static_root}/lib/js"
      css:     "#{static_root}/lib/css"
      fonts:   "#{static_root}/lib/fonts"
      
# =============================================
# bower
# =============================================
gulp.task 'bower:clean', (cb) ->
  rimraf "#{static_root}/lib/", cb

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

gulp.task 'default', ->
  runSequence(
    'bower'
  )
