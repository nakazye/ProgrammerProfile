gulp    = require 'gulp'
gutil   = require 'gulp-util'
bower   = require 'main-bower-files'
flatten = require 'gulp-flatten'
filter  = require 'gulp-filter'

static_root = './ProgrammerProfile/staticfiles'

paths =
  dest:
    lib:
      js:      "#{static_root}/lib/js"
      css:     "#{static_root}/lib/css"
      fonts:   "#{static_root}/lib/fonts"
      

gulp.task 'default', ->
  console.log 'gulp!'

gulp.task 'bower', ->
  # js files
  jsFilter = filter '**/*.js'
  gulp
    .src bower()
    .pipe jsFilter
    .pipe flatten()
    .pipe gulp.dest "#{paths.dest.lib.js}"

  # css files
  cssFilter = filter '**/*.css'
  gulp
    .src bower()
    .pipe cssFilter
    .pipe flatten()
    .pipe gulp.dest "#{paths.dest.lib.css}"

  # font files
  fontFilter = filter '**/glyphicons-halflings-regular.*'
  gulp
    .src bower()
    .pipe fontFilter
    .pipe flatten()
    .pipe gulp.dest "#{paths.dest.lib.fonts}"
  
