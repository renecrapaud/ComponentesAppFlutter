import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Tarjetas'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: <Widget>[
          _tarjetaTipo1(),
          SizedBox(height: 30.0,),
          _tarjetaTipo2(),
        ],
      ),
    );
  }

  Widget _tarjetaTipo1() {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue),
            title: Text('Primera tarjeta - titulo'),
            subtitle:  Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. '),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('Cancelar'),
                onPressed: () {},
              ),
              FlatButton(
                child: Text('Ok'),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _tarjetaTipo2() {
    final carr = Container(
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage('https://lacf.ca/sites/default/files/images/homepage/banners/P14%20-%20brightcropped%20for%20landing%20page_%20Bridge%20in%20Gablenz%2C%20Germany%2C%20Photo%20by%20Martin%20Damboldt%20from%20Pexels.jpg'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300.0,
            fit: BoxFit.cover,
          ),
          Container(
            child: Text('Describir la imagen'),
            padding: EdgeInsets.all(10.0),
          )
        ],
      ),
    );
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: carr,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0,10.0),
          )
        ],
      ),
    );
  }
}