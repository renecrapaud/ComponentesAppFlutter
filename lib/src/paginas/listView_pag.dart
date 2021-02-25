import 'package:flutter/material.dart';

class PaginadeLista extends StatefulWidget {
  @override
  _PaginadeListaState createState() => _PaginadeListaState();
}

class _PaginadeListaState extends State<PaginadeLista> {
  ScrollController _scrollController = new ScrollController();
  List<int> _listaNumeros = [];
  int _ultImgCargada = 0;
  @override
  void initState() {
    super.initState();
    _agrega10Imgs();
    _scrollController.addListener(() {
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        _agrega10Imgs();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      body: _agregaLista(),
    );
  }

  Widget _agregaLista(){
    return ListView.builder(
      controller: _scrollController,
      itemCount: _listaNumeros.length,
      itemBuilder: (BuildContext context, int index){
        final imagen = _listaNumeros[index];
        return FadeInImage(
          image: NetworkImage('https://picsum.photos/500/300/?image=$imagen'),
          placeholder: AssetImage('assets/jar-loading.gif'),
        );
      },
    );
  }

  void _agrega10Imgs(){
    for(var i = 1; i < 10; i++){
      _ultImgCargada++;
      _listaNumeros.add(_ultImgCargada);
      setState(() {

      });
    }
  }
}
