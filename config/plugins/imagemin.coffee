module.exports = (lineman) ->
  app = lineman.config.application

  files:
    imagemin:
      cwd: 'dist/img'
      dest: 'dist/img'
      src: '{,*/}*.{png,jpg,jpeg,gif}'

  config:
    loadNpmTasks: app.loadNpmTasks.concat('grunt-contrib-imagemin')

    appendTasks:
      dist: app.appendTasks.dist.concat('imagemin')

    imagemin:
      dist:
        expand: true,
        cwd: '<%= files.imagemin.cwd %>'
        src: '<%= files.imagemin.src %>'
        dest: '<%= files.imagemin.dest %>'
