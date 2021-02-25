import 'package:flutter/material.dart';
import 'package:componentes_app/src/paginas/listView_pag.dart';
import 'package:componentes_app/src/paginas/slider_pag.dart';
import 'package:componentes_app/src/paginas/input_pag.dart';
import 'package:componentes_app/src/paginas/contenedor_animado.dart';
import 'package:componentes_app/src/paginas/alerta_pag.dart';
import 'package:componentes_app/src/paginas/avatar_pag.dart';
import 'package:componentes_app/src/paginas/home_page.dart';
import 'package:componentes_app/src/paginas/tarjetas_pag.dart';

Map<String, WidgetBuilder> getApplicationRoutes(){
  return <String, WidgetBuilder>{
    '/' : (BuildContext context) => HomePage(),
    'alert' : (BuildContext context) => AlertPage(),
    'avatar' : (BuildContext context) => AvatarPage(),
    'card' : (BuildContext context) => CardPage(),
    'animatedContainer' : (BuildContext context) => AnimatedContainerPage(),
    'inputs' : (BuildContext context) => InputPage(),
    'slider' : (BuildContext context) => PaginaSlide(),
    'list' : (BuildContext context) => paginadeLista()
  };
}
