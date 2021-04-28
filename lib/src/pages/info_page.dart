import 'package:flutter/material.dart';
import 'package:flutter_vocacion/src/models/carrera_model.dart';
import 'package:flutter_vocacion/src/providers/carreras_provider.dart';

class  InfoPage extends StatefulWidget {
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  final formKey = GlobalKey <FormState>();
  final carreraProvider = new CarrerasProvider();

  CarreraModel carrera = new CarreraModel();

  @override
  Widget build(BuildContext context) {
    var icon = '${carrera.icono}';

    final CarreraModel carData = ModalRoute.of(context).settings.arguments;
    if(carData != null){
      carrera = carData;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('${carrera.area}'),
        actions: <Widget>[
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
            children: <Widget>[
              Text('${carrera.nombreCarrera}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.red[600]),),
              FadeInImage(
          image: NetworkImage('${carrera.imagen}'),
          placeholder: AssetImage('assets/cloud_loading.gif'),
          fadeInDuration: Duration(milliseconds: 200),
          fit: BoxFit.cover,
        ),
            
            Text ('Descripcion: ',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red[600], fontSize: 20),),
            Text('${carrera.descripcion}', textAlign: TextAlign.justify,style: TextStyle(fontSize: 20),),
            Icon(Icons.people, size: 100, color: Colors.red[600],),
            Text('Perfíl de Ingreso:',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red[600], fontSize: 20)),
            Text('${carrera.caracteristicasAspirante}',textAlign: TextAlign.justify,style: TextStyle(fontSize: 20)),
            Icon(Icons.work, size: 100, color:Colors.red[600]),
            Text('Campo y mercado de trabajo:', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red[600], fontSize: 20)),
            Text('${carrera.trabajo}',textAlign: TextAlign.justify,style: TextStyle(fontSize: 20)),
            Icon(Icons.school, size:100, color: Colors.red[600]),
            Text('Universidades que cuentan con la carrera:', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red[600], fontSize: 20)),
            Text('${carrera.universidades}',textAlign: TextAlign.justify,style: TextStyle(fontSize: 20)),
            Icon(Icons.web, size: 100,color: Colors.red[600]),
            Text('Sitio Web:', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red[600], fontSize: 20)),
            Text('${carrera.sitio}',textAlign: TextAlign.justify,style: TextStyle(fontSize: 20))
          ],
          ),
        ),
        )
      ),
    );
  }

   
   
}