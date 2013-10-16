# GruntFile.coffee

module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON "package.json"
    shell:
      latex:
        file: null,
        options:
          stdout: true
        command: (filepath) ->
          unless filepath
            filepath = grunt.config "shell.latex.file"
          "xelatex -output-directory=dest " + filepath
    watch:
      latex:
        files: ["src/**/*.tex"]
        tasks: ["shell"]
        options:
          nospawn: true
      livereload:
        files: ["dest/**/*.pdf"]
        options:
          livereload: true
    connect:
      livereload:
        options:
          port: 8000
          base: "dest"

  grunt.loadNpmTasks "grunt-shell"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-contrib-connect"

  grunt.registerTask "build", (filepath) ->
    unless filepath
      return grunt.warn "Build num must be specified, like build:path/to/report.tex"
    grunt.task.run "shell::" + filepath

  grunt.registerTask "default", ["connect", "watch"]

  grunt.event.on "watch", (action, filepath, target) ->
    if target is "latex"
      grunt.config "shell.latex.file", filepath
