import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter_vocacion/src/models/carrera_model.dart';

class CarrerasProvider {

final String _url = 'https://proyectos-flutter-8a342-default-rtdb.firebaseio.com';

Future<bool> crearCarrera (CarreraModel carrera)async{
  
  final url = '$_url/carreras.json';

  final resp = await http.post(url, body: carreraModelToJson(carrera));

  final decodedData = json.decode(resp.body);
  
  print(decodedData);

  return true;

}

Future<bool> editarCarrera (CarreraModel carrera)async{
  
  final url = '$_url/carreras/${carrera.id}.json';

  final resp = await http.put(url, body: carreraModelToJson(carrera));

  final decodedData = json.decode(resp.body);
  
  print(decodedData);

  return true;

}

Future<List<CarreraModel>> cargarCarreras() async {
  final url = '$_url/carreras.json';
  final resp = await http.get(url);

  final Map<String, dynamic> decodedData = json.decode(resp.body);
  final List<CarreraModel> carreras = new List();

  if( decodedData == null ) return[];

  decodedData.forEach((id, car) {
    final carTemp = CarreraModel.fromJson(car);
    carTemp.id = id;

    carreras.add(carTemp);
   });

   //print(carreras[0].id);

  return carreras;
}

Future<int> borrarCarrera(String id)async{
  final url = '$_url/carreras/$id.json';
  final resp = await http.delete(url);

  print(resp.body);

  return 1;
}

}