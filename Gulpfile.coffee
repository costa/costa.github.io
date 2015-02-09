gulp = require 'gulp'
gutil = require 'gulp-util'

HAML_FILES = './haml/*.hamlc'
hamlc = require 'gulp-haml-coffee'
# Get and render all .hamlc files recursively
gulp.task 'hamlc', ->
  gulp.src(HAML_FILES).
    pipe(hamlc()).
    pipe(gulp.dest('.'))

COFFEE_FILES = './coffee/*.coffee'
coffee = require 'gulp-coffee'
# Get and compile all .coffee files recursively
gulp.task 'coffee', ->
  gulp.src(COFFEE_FILES).
    pipe(coffee(bare: true).on('error', gutil.log)).
    pipe(gulp.dest('.'))

SCSS_FILES = './scss/*.scss'
sass = require 'gulp-sass'
gulp.task 'sass', ->
    gulp.src(SCSS_FILES)
        .pipe(sass())
        .pipe(gulp.dest('.'))

gulp.task 'watch', ->
  gulp.watch HAML_FILES, ['hamlc']
  gulp.watch SCSS_FILES, ['sass']
  gulp.watch COFFEE_FILES, ['coffee']

# Default gulp task to run
gulp.task 'default', ['hamlc', 'sass', 'coffee']
