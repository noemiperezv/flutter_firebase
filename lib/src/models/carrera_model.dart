// To parse this JSON data, do
//
//     final carreraModel = carreraModelFromJson(jsonString);

import 'dart:convert';

CarreraModel carreraModelFromJson(String str) => CarreraModel.fromJson(json.decode(str));

String carreraModelToJson(CarreraModel data) => json.encode(data.toJson());

class CarreraModel {
    CarreraModel({
        this.id,
        this.nombreCarrera,
        this.area,
        this.descripcion,
        this.caracteristicasAspirante,
        this.trabajo,
        this.universidades,
        this.sitio,
        this.icono,
        this.imagen,
    });

    String id;
    String nombreCarrera;
    String area;
    String descripcion;
    String caracteristicasAspirante;
    String trabajo;
    String universidades;
    String sitio;
    String icono;
    String imagen;

    factory CarreraModel.fromJson(Map<String, dynamic> json) => CarreraModel(
        id: json["id"],
        nombreCarrera: json["nombreCarrera"],
        area: json["area"],
        descripcion: json["descripcion"],
        caracteristicasAspirante: json["caracteristicasAspirante"],
        trabajo: json["trabajo"],
        universidades: json["universidades"],
        sitio: json["sitio"],
        icono: json["icono"],
        imagen: json["imagen"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombreCarrera": nombreCarrera,
        "area": area,
        "descripcion": descripcion,
        "caracteristicasAspirante": caracteristicasAspirante,
        "trabajo": trabajo,
        "universidades": universidades,
        "sitio": sitio,
        "icono": icono,
        "imagen": imagen,
    };
}
