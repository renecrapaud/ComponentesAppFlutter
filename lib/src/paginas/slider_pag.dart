import 'package:flutter/material.dart';

class PaginaSlide extends StatefulWidget {
  @override
  _PaginaSlideState createState() => _PaginaSlideState();
}

class _PaginaSlideState extends State<PaginaSlide> {
  double _valorSlider = 100;
  bool _bloqueaCambioTam = false;
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
            _agregaCheckBox(),
            _agregaSwitch(),
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
      value: _valorSlider,
      divisions: 20,
      onChanged: (_bloqueaCambioTam) ? null : (valor){
        setState(() {
          _valorSlider = valor;
        });
      },
      min: 10.0,
      max: 400.0
    );
  }

  Widget _agregarImagen() {
    return Image(
      image: NetworkImage('https://cdn.pixabay.com/photo/2021/01/18/18/55/sheep-5929158__340.jpg'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }

  Widget _agregaCheckBox() {
    return CheckboxListTile(
      title: Text('Bloquear Slider'),
      value: _bloqueaCambioTam,
      onChanged: (valor){
        setState(() {
          _bloqueaCambioTam = valor;
        });
      },
    );
    /* return Checkbox(
      value: _bloqueaCambioTam,
      onChanged: (valor){
        setState(() {
          _bloqueaCambioTam = valor;
        });
      },
    ); */
  }

  Widget _agregaSwitch() {
    return SwitchListTile(
      title: Text('Bloquear Slider'),
      value: _bloqueaCambioTam,
      onChanged: (valor){
        setState(() {
          _bloqueaCambioTam = valor;
        });
      },
    );
  }
}
