import 'package:flutter/material.dart';
import 'package:flutter_vocacion/src/models/carrera_model.dart';
import 'package:flutter_vocacion/src/providers/carreras_provider.dart';


class HomePage extends StatelessWidget {
  final carrerasProvider = new CarrerasProvider();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Home')
      ),
      body: _crearListado(),
      floatingActionButton: _crearBoton(context),
    );
  }

  Widget _crearListado(){
    return FutureBuilder(
      future: carrerasProvider.cargarCarreras(),
      builder: (BuildContext context, AsyncSnapshot<List<CarreraModel>> snapshot){
        if(snapshot.hasData ){
          final carreras = snapshot.data;
          return ListView.builder(
            itemCount: carreras.length,
            itemBuilder: (context, i) => _crearItem(context, carreras[i])
            );
        }else{
          return Center( child: CircularProgressIndicator());
        }
      }
      );
  }

  Widget _crearItem(BuildContext context, CarreraModel carrera){

  return Card(
    key: UniqueKey(),
    elevation: 20,
    child: Column(
      children: <Widget>[
        FadeInImage(
          image: NetworkImage('${carrera.imagen}'),
          placeholder: AssetImage('assets/cloud_loading.gif'),
          fadeInDuration: Duration(milliseconds: 200),
          fit: BoxFit.cover,
        ),
        Container(
          padding: EdgeInsets.all(10.0),
          child: Text('${carrera.nombreCarrera}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.blue[900]),)
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.all(10.0),
          child: Text('${carrera.area}',style: TextStyle(fontSize: 17, color: Colors.red, ),textAlign: TextAlign.left,)
          ),
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.all(10.0),
          child: Text('${carrera.descripcion}',textAlign: TextAlign.justify, style: TextStyle(fontSize: 15),)
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                onPressed: () => Navigator.pushNamed(context, 'info', arguments: carrera), 
                child: Text('Mostrar mas', style: TextStyle(color: Colors.blue[700],fontSize: 20),)
                ),
              FlatButton(
                onPressed: () => Navigator.pushNamed(context, 'carrera', arguments: carrera), 
                child: Text('Editar', style: TextStyle(color: Colors.green, fontSize: 20),)
                ),FlatButton(
                onPressed: () {carrerasProvider.borrarCarrera(carrera.id); Navigator.pushNamed(context, 'home', arguments: carrera);}, 
                child: Text('Eliminar', style: TextStyle(color: Colors.red[400], fontSize: 20),)
                ),
            ],
            )
      ],
    ),
  );
}

  _crearBoton(BuildContext context){
    return FloatingActionButton(
      child: Icon(Icons.add), 
      backgroundColor: Colors.red[600],
      onPressed: ( ()=> Navigator.pushNamed(context, 'carrera'))
    );
  }
}