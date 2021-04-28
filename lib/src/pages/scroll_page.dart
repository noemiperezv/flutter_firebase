import 'package:flutter/material.dart';
import 'package:flutter_vocacion/src/pages/home_page.dart';

class ScrollPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
      scrollDirection: Axis.vertical,
      children: <Widget>[_pagina1(), _pagina2(context)],
    ));
  }

  Widget _pagina1() {
    return Stack(
      children: <Widget>[
        _colorFondo(),
        _imagenFondo(),
        _textos(),
      ],
    );
  }

  Widget _colorFondo() {
    return Container(
        width: double.infinity,
        height: double.infinity,
        color: Color.fromRGBO(12, 11, 50, 1.0));
  }

  Widget _imagenFondo() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image(
        image: AssetImage('assets/scroll-1.png'),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _textos() {
    final estiloTexto = TextStyle(color: Colors.white, fontSize: 50.0);
    return SafeArea(
      child: Column(children: <Widget>[
        SizedBox(
          height: 20.0,
        ),
        Text('31° C', style: estiloTexto),
        Text('Martes', style: estiloTexto),
        Expanded(child: Container()),
        Icon(Icons.keyboard_arrow_down, size: 70.0, color: Colors.white)
      ]),
    );
  }

  Widget _pagina2(context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(12, 11, 50, 1.0),
      child: Center(
        child: RaisedButton(
          shape: StadiumBorder(),
          color: Colors.blue,
          textColor: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            child: Text(
              'Ver carreras',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          onPressed:() {Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));},
        ),
      ),
    );
  }
}
