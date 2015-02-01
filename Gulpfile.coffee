gulp = require 'gulp'
gutil = require 'gulp-util'

hamlc = require 'gulp-haml-coffee'
# Get and render all .hamlc files recursively
gulp.task 'hamlc', ->
  gulp.src('./haml/**/*.hamlc').
    pipe(hamlc()).
    pipe(gulp.dest('.'))

coffee = require 'gulp-coffee'
# Get and compile all .coffee files recursively
gulp.task 'coffee', ->
  gulp.src('./coffee/*.coffee').
    pipe(coffee(bare: true).on('error', gutil.log)).
    pipe(gulp.dest('.'))


# Default gulp task to run
gulp.task 'default', ->
  gulp.run 'hamlc', 'coffee'
