import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget{
  final opciones =['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];
  @override
  Widget build(BuildContext context){
    return ListView(
      // children :_agregarElems()
      children: _agregaElemsAlt(),
    );
  }

  /* List<Widget> _agregarElems(){
    List<Widget> misOpciones = new List<Widget>();
    for(var opt in opciones){
      final temWidget = ListTile(
        title: Text(opt),
      );
      misOpciones..add(temWidget)
                 ..add(Divider());
    }
    return misOpciones;
  } */

  List<Widget> _agregaElemsAlt(){
    return opciones.map((e) {
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(e),
            subtitle: Text(' Alt'),
            leading: Icon(Icons.account_balance),
            trailing: Icon(Icons.arrow_right),
            onTap: (){},
          ),
          Divider()
        ],
      );
    }).toList();
  }
}