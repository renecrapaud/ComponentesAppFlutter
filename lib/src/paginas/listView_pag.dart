import 'dart:async';
import 'package:flutter/material.dart';

class PaginadeLista extends StatefulWidget {
  @override
  _PaginadeListaState createState() => _PaginadeListaState();
}

class _PaginadeListaState extends State<PaginadeLista> {
  ScrollController _scrollController = new ScrollController();
  List<int> _listaNumeros = [];
  int _ultImgCargada = 0;
  bool _estaCargando = false;
  @override
  void initState() {
    super.initState();
    _agrega10Imgs();
    _scrollController.addListener(() {
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        // _agrega10Imgs();
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      body: Stack(
        children: <Widget>[
          _agregaLista(),
          _agregaImgEspera(),
        ],
      ),
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

  Future fetchData() async {
    _estaCargando = true;
    setState(() {

    });
    final duracion = new Duration(seconds: 2);
    return new Timer(duracion, respuestaHttp);
  }

  void respuestaHttp(){
    _estaCargando = false;
    _agrega10Imgs();
    _scrollController.animateTo(_scrollController.position.pixels + 100,
        duration: Duration(milliseconds: 250),
        curve: Curves.fastOutSlowIn
    );
  }

  Widget _agregaImgEspera() {
    if(_estaCargando){
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator()
            ],
          ),
          SizedBox(height: 15.0),
        ],
      );
    } else {
      return Container();
    }
  }
}
