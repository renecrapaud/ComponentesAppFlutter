import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = '';
  String _email = '';
  String _fecha = '';
  String _opcSeleccionada = "Primera opción";
  List<String> _listaOpcs = ['Primera opción','Segunda Opción', 'Tercera Opción'];
  TextEditingController _controlEntradaFecha = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Entradas de texto'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _agregaEntrada(),
          Divider(),
          _agregaEntradaCorreo(),
          Divider(),
          _agrEntContrasena(),
          Divider(),
          _agregaEntradaFecha(context),
          Divider(),
          _agregaListaSelec(),
          Divider(),
          _copiarNombre(),
        ],
      ),
    );
  }

  Widget _agregaEntrada() {
    return TextField(
      autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        counter: Text('Letras ${_nombre.length}'),
        hintText: 'Nombre de la persona',
        labelText: 'Nombre',
        helperText: 'Primer nombre',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle),
      ),
      onChanged: (valor){
        setState(() {
          _nombre = valor;
        });
      },
    );
  }

  Widget _copiarNombre() {
    return ListTile(
      title: Text('Nombre es: $_nombre'),
      subtitle: Text('Email: $_email'),
    );
  }

  Widget _agregaEntradaCorreo() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: 'Dirección de correo',
        labelText: 'Correo electrónico',
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email),
      ),
      onChanged: (valor){
        setState(() {
          _email = valor;
        });
      },
    );
  }

  Widget _agrEntContrasena() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: 'Contraseña',
        labelText: 'Contraseña',
        suffixIcon: Icon(Icons.lock_open),
        icon: Icon(Icons.lock),
      ),
    );
  }

  Widget _agregaEntradaFecha(BuildContext context) {
    return TextField(
      controller: _controlEntradaFecha,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: 'Fecha de nacimiento',
        labelText: 'Fecha de nacimiento',
        suffixIcon: Icon(Icons.perm_contact_calendar),
        icon: Icon(Icons.calendar_today),
      ),
      onTap: (){
        FocusScope.of(context).requestFocus(new FocusNode());
        _seleccionaFecha(context);
      },
    );
  }

  void _seleccionaFecha(BuildContext context) async {
    DateTime seleccionada = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2019),
        lastDate: new DateTime(2025),
        locale: Locale('es', 'MX'),
    );

    if(seleccionada != null){
      setState(() {
        _fecha = seleccionada.toString();
        _controlEntradaFecha.text = _fecha;
      });
    }
  }

  List<DropdownMenuItem<String>> obtOpcsDropDwn(){
    List<DropdownMenuItem<String>> lista = new List();
    _listaOpcs.forEach((opcion) {
      lista.add(DropdownMenuItem(
        child: Text(opcion),
        value: opcion,
      ));
    });
    return lista;
  }

  Widget _agregaListaSelec() {
    return DropdownButton(
      value: _opcSeleccionada,
      items: obtOpcsDropDwn(),
      onChanged: (opc){
        setState(() {
          _opcSeleccionada = opc;
        });
      },
    );
  }

}

