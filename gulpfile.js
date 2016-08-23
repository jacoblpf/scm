var gulp = require('gulp');
var Freemarker = require('freemarker.js');
var path = require('path');
var fs = require('fs');
var watchPath = require('gulp-watch-path');
var gutil = require('gulp-util');


gulp.task("default",['auto_bulid_html_tdd','auto_bulid_html_ftl']);

gulp.task('auto_bulid_html_ftl', function(){
	
	gulp.watch('./src/tpls/**/*.ftl', function(event){

		var paths = watchPath(event, 'src/tpls/', 'test/out/');
		

		//模板路径
		var ftlPath = paths.srcPath.replace(/\\/g,'/').replace('src/tpls/','');
		gutil.log("修改模板文件：" + paths.srcPath);

		//修改的文件名
		var modified = paths.srcFilename.replace('.ftl','');

		//生成的目标文件路径
		var target = "test/out/"+modified+".html";
		gutil.log("html文件："+target);

		//数据文件路径
		var dataPath = './test/data/'+ ftlPath.replace('.ftl','')+ ".tdd";
		gutil.log("数据文件："+dataPath);

		if (fs.existsSync(dataPath)){

			//获取模板数据
			var data = fs.readFileSync(dataPath, 'utf-8', function(err){
				console.log(err)
			});

			var fm = new Freemarker({
			    viewRoot: path.join(__dirname, './src/tpls/'),

			    options: {}
			});
			
			var html = fm.renderSync(ftlPath, JSON.parse(data));

			fs.open(target,"w",function(err, fd){

				if (err) {
					console.log(err)

				}else{

				  var buffer = new Buffer(html);
				  
				  fs.write(fd, buffer, 0, buffer.length, 0, function(err){
				  	
				  	if(err){
				  		console.log('写入失败')
				  	}
				  });
				}
			})
			gutil.log("刷新成功："+target);
		}
		else {
			gutil.log("数据模板不存在："+dataPath);
		}
		gutil.log("---------------------------------------------------------------");
	})
});

gulp.task('auto_bulid_html_tdd', function(){
	
	gulp.watch('./test/data/**/*.tdd', function(event){

		var paths = watchPath(event, 'test/data/', '/');

		//修改的文件名
		var modified = paths.srcFilename.replace('.tdd','');
		gutil.log("修改数据文件："+paths.srcPath);

		//模板路径
		var ftlPath = paths.srcPath.replace(/\\/g,'/').replace('test/data/','').replace('.tdd','')+'.ftl';

		gutil.log("模板文件：src/tpls/"+ftlPath);

		//数据
		var data = fs.readFileSync(paths.srcPath, 'utf-8', function(err){
			console.log(err)
		});

		//目标文件路径
		var target = 'test/out/'+modified+'.html';
		gutil.log("html文件："+ target);

		var fm = new Freemarker({
		    viewRoot: path.join(__dirname, './src/tpls/'),

		    options: {}
		});

		var html = fm.renderSync(ftlPath, JSON.parse(data));

		fs.open(target,"w",function(err, fd){

			if (err) {
				console.log(err)

			}else{

			  var buffer = new Buffer(html);
			  
			  fs.write(fd, buffer, 0, buffer.length, 0, function(err){
			  	
			  	if(err){
			  		console.log('写入失败')
			  	}
			  });
			}
		})
		gutil.log('刷新成功：'+target);
		gutil.log('-------------------------------------------------------------');
	})
})


