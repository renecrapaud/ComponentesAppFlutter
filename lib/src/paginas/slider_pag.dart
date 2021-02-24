import 'package:flutter/material.dart';

class PaginaSlide extends StatefulWidget {
  @override
  _PaginaSlideState createState() => _PaginaSlideState();
}

class _PaginaSlideState extends State<PaginaSlide> {
  double _valorSlider;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Deslizar'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _agregaSlider(),
            Expanded(
                child: _agregarImagen()
            ),
          ],
        ),
      ),
    );
  }

  Widget _agregaSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de la imagen',
      divisions: 20,
      onChanged: (valor){
        setState(() {
          _valorSlider = valor;
        });
      },
      value: _valorSlider,
      min: 10.0,
      max: 400.0,
    );
  }

  Widget _agregarImagen() {
    return Image(
      image: NetworkImage('https://cdn.pixabay.com/photo/2021/01/18/18/55/sheep-5929158__340.jpg'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }
}
