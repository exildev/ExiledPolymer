@echo off
IF "H" == "H" (
	IF EXIST bower_components/ ( 
		echo Actualizando componentes
		bower --save update
		PAUSE
		IF NOT EXIST elements/lib/ (
			echo creando directorio...
			mkdir elements/lib
		) ELSE (
			echo el directorio ya existe
		)
		GOTO :A
	) ELSE (
		echo Descargando componentes
		bower install
	)
	echo Copiando dependencias
	IF NOT EXIST elements/lib/web-animations-js mkdir elements/lib/web-animations-js
	cp bower_components/web-animations-js/* elements/lib/web-animations-js -r
	IF NOT EXIST elements/lib/webcomponentsjs mkdir elements/lib/webcomponentsjs
	cp bower_components/webcomponentsjs/* elements/lib/webcomponentsjs -r
	echo Comprimiendo..... 
	vulcanize elements/lib.html --inline-script --inline-css | crisper --html elements/lib/lib.v.html --js elements/lib/lib.v.js
)
