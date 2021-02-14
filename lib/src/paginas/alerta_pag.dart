import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina de alerta'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.call_end),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
    );
  }
}