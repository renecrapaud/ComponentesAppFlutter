import 'package:flutter/material.dart';
import 'package:componentes_app/src/provider/menu_provider.dart';
import 'package:componentes_app/src/utils/icono_string_util.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Componentes App"),
      ),
      body: _lista()
    );
  }

  Widget _lista() {
    // menuProvider.cargarData().then((opciones){ });
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot){
        return ListView(
          children: _elemsLista(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _elemsLista(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];
    data.forEach((element) {
      final widgetTmp = ListTile(
        title: Text(element['texto']),
        leading: getIcon(element['icon']),
        trailing: Icon(Icons.arrow_right, color: Colors.black12),
        onTap: (){

          Navigator.pushNamed(context, element['ruta']);
          /*final route = MaterialPageRoute(
            builder: (context) => AlertPage()
          );
          Navigator.push(context, route);*/
        },
      );
      opciones..add(widgetTmp)
              ..add(Divider());
    });

    return opciones;
  }
}