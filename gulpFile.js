var gulp=require('gulp');
//	connect=require('gulp-connect');
//
//gulp.task('connect',function(){
//	connect.server({
//            root: 'isparql',
//            port:3020
//	});
//});
//
//gulp.task('default',['connect']);

var connect = require('gulp-connect');
var modRewrite = require('connect-modrewrite');

gulp.task('connect', function (done) {
  connect.server({
    //root: [paths.connectRoot],
    port: 3020,
    livereload: true,
    debug: true,
    middleware: function() {
      return [
        modRewrite([
            //'^(.*)$  /isparql/$1'
            '/isparql/(.*) /$1 [L]'
        ])
      ]
    }
  });
});
