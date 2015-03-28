gulp           = require 'gulp'
gutil          = require 'gulp-util'
coffee         = require 'gulp-coffee'
flatten        = require 'gulp-flatten'
filter         = require 'gulp-filter'
bower          = require 'gulp-bower'
bowerfiles     = require 'main-bower-files'
runSequence    = require 'run-sequence'
rimraf         = require 'rimraf'
sourcemaps     = require 'gulp-sourcemaps'
coffeelint     = require 'gulp-coffeelint'
mochaPhantomJS = require 'gulp-mocha-phantomjs'
exec           = require 'child_process'
                                     .exec
shell          = require 'gulp-shell'

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

server_proc = {}

# =============================================
# server
# =============================================
gulp.task 'server:start', ->
  server_proc = exec 'source env/bin/activate;PYTHONUNBUFFERED=1 ./manage.py runserver 0.0.0.0:8080'

gulp.task 'server:kill', ->
  process.kill server_proc.pid, 'SIGKILL'

gulp.task 'server:collectstatic', ->
  shell.task 'source env/bin/activate;python manage.py collectstatic --noinput'

# =============================================
# bower
# =============================================
gulp.task 'bower:clean:lib', (callback) ->
    rimraf "#{static_root}/lib/", callback

gulp.task 'bower:clean:components', (callback) ->
    rimraf 'bower_components/', callback

gulp.task 'bower:install', ->
  bower
    cmd: 'install'

gulp.task 'bower:js', ->
  jsFilter = filter '**/*.js'
  gulp.src bowerfiles()
    .pipe jsFilter
    .pipe flatten()
    .pipe gulp.dest "#{paths.dest.lib.js}"

gulp.task 'bower:css', ->
  cssFilter = filter '**/*.css'
  gulp.src bowerfiles()
    .pipe cssFilter
    .pipe flatten()
    .pipe gulp.dest "#{paths.dest.lib.css}"

gulp.task 'bower:font', ->
  fontFilter = filter '**/glyphicons-halflings-regular.*'
  gulp.src bowerfiles()
    .pipe fontFilter
    .pipe flatten()
    .pipe gulp.dest "#{paths.dest.lib.fonts}"

gulp.task 'bower', (callback) ->
  runSequence(
    ['bower:clean:lib', 'bower:clean:components']
    'bower:install'
    ['bower:js', 'bower:css', 'bower:font']
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
    'coffee:lint'
    'coffee:compile'
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
  gulp.src "#{paths.test.coffee}/*.html"
    .pipe gulp.dest "#{static_root}"

gulp.task 'test:mocha', ->
    stream = mochaPhantomJS
      reporter: 'spec'
    stream.write
      path: 'http://localhost:8080/static/mochaPhantomJsRunner.html'
    stream.end()
    stream
    

gulp.task 'test', (callback) ->
  runSequence(
    'test:compile'
    'test:mocha'
    callback
  )

# =============================================
# watch
# =============================================
gulp.task 'watch:forTest', ->
  runSequence 'server:runserver'
  gulp.watch "#{paths.src.coffee}/**/*.*", ['coffee:compile', 'coffee:lint', 'server:collectstatic', 'test:mocha']
  gulp.watch "#{paths.test.coffee}/**/*.*", ['test:compile', 'server:collectstatic', 'test:mocha']

# =============================================
# exit
# =============================================
gulp.task 'process:exit', ->
  process.exit()

# =============================================
# default
# =============================================

gulp.task 'default', ->
  runSequence(
    ['bower', 'coffee']
  )

# =============================================
# build to test
# =============================================
gulp.task 'cleanBuildToTest', ->
  runSequence(
    'server:start'
    ['bower', 'coffee']
    'server:collectstatic'
    'test'
    'server:kill'
    'process:exit'
  )
