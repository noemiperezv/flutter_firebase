import 'package:flutter/material.dart';
import 'package:flutter_vocacion/src/models/carrera_model.dart';
import 'package:flutter_vocacion/src/providers/carreras_provider.dart';

class  CarreraPage extends StatefulWidget {
  @override
  _CarreraPageState createState() => _CarreraPageState();
}

class _CarreraPageState extends State<CarreraPage> {
  final formKey = GlobalKey <FormState>();
  final carreraProvider = new CarrerasProvider();

  CarreraModel carrera = new CarreraModel();

  @override
  Widget build(BuildContext context) {

    final CarreraModel carData = ModalRoute.of(context).settings.arguments;
    if(carData != null){
      carrera = carData;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrera'),
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
              _crearNombre(),
              _crearImagen(),
              _crearArea(),
              _crearDescripcion(),
              _crearCaracteristicas(),
              _crearTrabajo(),
              _crearUniversidades(),
              _crearSitio(),
              _crearBoton(),
          ],
          ),
        ),
        )
      ),
    );
  }

   Widget _crearNombre(){
     return TextFormField(
       initialValue: carrera.nombreCarrera,
       textCapitalization: TextCapitalization.sentences,
       decoration:  InputDecoration(
         labelText: 'Carrera'
       ),
       onSaved: (value) => carrera.nombreCarrera = value,
       validator: (value){
         if(value.length < 3){
           return 'Ingrese el nombre de la carrera';
         }else{
           return null;
         }
       },
     );
   }
   Widget _crearArea(){
     return TextFormField(
       initialValue: carrera.area,
       textCapitalization: TextCapitalization.sentences,
       decoration:  InputDecoration(
         labelText: 'Área'
       ),
       onSaved: (value) => carrera.area = value,
       validator: (value){
         if(value.length < 3){
           return 'Ingrese el área a la que pertenece';
         }else{
           return null;
         }
       },
     );
   }
   Widget _crearDescripcion(){
     return TextFormField(
       maxLines: 5,
       initialValue: carrera.descripcion,
       textCapitalization: TextCapitalization.sentences,
       decoration:  InputDecoration(
         labelText: 'Descripción',
       ),
       onSaved: (value) => carrera.descripcion = value,
       validator: (value){
         if(value.length < 3){
           return 'Ingrese una descripción para la carrera';
         }else{
           return null;
         }
       },
     );
   }
   Widget _crearCaracteristicas(){
     return TextFormField(
       maxLines: 5,
       initialValue: carrera.caracteristicasAspirante,
       textCapitalization: TextCapitalization.sentences,
       decoration:  InputDecoration(
         labelText: 'Características del aspirante',
       ),
       onSaved: (value) => carrera.caracteristicasAspirante = value,
       validator: (value){
         if(value.length < 3){
           return 'Ingrese las características que necesita el aspirante';
         }else{
           return null;
         }
       },
     );
   }
   Widget _crearTrabajo(){
     return TextFormField(
       maxLines: 5,
       initialValue: carrera.trabajo,
       textCapitalization: TextCapitalization.sentences,
       decoration:  InputDecoration(
         labelText: 'Campo y mercado de trabajo',
       ),
       onSaved: (value) => carrera.trabajo = value,
       validator: (value){
         if(value.length < 3){
           return 'Ingrese los posibles trabajos que podra ejercer';
         }else{
           return null;
         }
       },
     );
   }
   Widget _crearUniversidades(){
     return TextFormField(
       maxLines: 5,
       initialValue: carrera.universidades,
       textCapitalization: TextCapitalization.sentences,
       decoration:  InputDecoration(
         labelText: 'Universidades que cuentan con la carrera',
       ),
       onSaved: (value) => carrera.universidades = value,
       validator: (value){
         if(value.length < 3){
           return 'Ingrese las universidades que cuentan con la carrera';
         }else{
           return null;
         }
       },
     );
   }
   Widget _crearSitio(){
     return TextFormField(
       initialValue: carrera.sitio,
       textCapitalization: TextCapitalization.sentences,
       decoration:  InputDecoration(
         labelText: 'Sitio web'
       ),
       onSaved: (value) => carrera.sitio = value,
       validator: (value){
         if(value.length < 3){
           return 'Ingrese el sitio web de la universidad';
         }else{
           return null;
         }
       },
     );
   }
   Widget _crearImagen(){
     return TextFormField(
       initialValue: carrera.imagen,
       textCapitalization: TextCapitalization.sentences,
       decoration:  InputDecoration(
         labelText: 'Imagen',
       ),
       onSaved: (value) => carrera.imagen = value,
       validator: (value){
         if(value.length < 3){
           return 'Agrega el link para una imagen';
         }else{
           return null;
         }
       },
     );
   }


   Widget _crearBoton(){
     return RaisedButton.icon(
       shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(20.0)
       ), color: Colors.red[600],
       textColor: Colors.white,
       label:Text('Guardar'),
       icon: Icon(Icons.save),
       onPressed: () {
  _submit(); Navigator.pushNamed(context, 'home'); 
},
     );
   }

   void _submit(){
     if(!formKey.currentState.validate()) return;
     formKey.currentState.save();

     if(carrera.id == null){
       carreraProvider.crearCarrera(carrera);
     }else{
       carreraProvider.editarCarrera(carrera);
     }

     
     
   }
}