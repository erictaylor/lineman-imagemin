module.exports = (lineman) ->
  app = lineman.config.application

  files:
    imagemin:
      cwd: 'generated/img'
      dest: 'generated/img'
      src: '{,*/}*.{png,jpg,jpeg,gif}'

  config:
    loadNpmTasks: app.loadNpmTasks.concat('grunt-contrib-imagemin')

    prependTasks:
      dist: app.prependTasks.dist.concat('imagemin')

    imagemin:
      dist:
        expand: true,
        cwd: '<%= files.imagemin.cwd %>'
        src: '<%= files.imagemin.src %>'
        dest: '<%= files.imagemin.dest %>'