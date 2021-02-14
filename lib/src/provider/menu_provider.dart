import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class _MenuProvider{
  List<dynamic> opciones = [];
  _MenuProvider(){
    // cargarData();
  }

  Future <List<dynamic>> cargarData() async {
    final resp = await rootBundle.loadString('recursos/menu_opts.json');
    Map optsMap = json.decode(resp);
    opciones = optsMap['rutas'];
    return opciones;
  }
}

final menuProvider = new _MenuProvider();