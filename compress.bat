@echo off
[ ! -d bower_components ] && echo Descargando componentes && bower install
[ -d bower_components ] && echo Actualizando componentes && bower --save update
[ ! -d elements/lib ] && mkdir elements/lib
echo Copiando dependencias
[ ! -d  elements/lib/web-animations-js ] && mkdir elements/lib/web-animations-js
cp bower_components/web-animations-js/* elements/lib/web-animations-js -r
[ ! -d elements/lib/webcomponentsjs ] && mkdir elements/lib/webcomponentsjs
cp bower_components/webcomponentsjs/* elements/lib/webcomponentsjs -r
echo Comprimiendo..... 
vulcanize elements/lib.html --inline-script --inline-css | crisper --html elements/lib/lib.v.html --js elements/lib/lib.v.js
