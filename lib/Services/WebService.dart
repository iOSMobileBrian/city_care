
import 'dart:convert';
import 'dart:io';

import 'package:city_care/Models/Incident.dart';
import 'package:flutter/material.dart';

import 'package:path/path.dart';
import 'package:dio/dio.dart';

class WebService {


  Future<void> saveIncident(Incident incident) async {

    File file = File(incident.imageUrl);
    final filename = basename(file.path.replaceAll(" ", ""));

    FormData formData = FormData.fromMap({
      "title": incident.title,
      "description": incident.description,
      "image": await MultipartFile.fromFile(incident.imageUrl, filename: filename)
    });

    final url = "https://vast-savannah-75068.herokuapp.com/incidents";

    await Dio().post(
        url,
        data: formData,
        //options: Options(contentType: "application/x-www-form-urlencoded")

    );


  }

  Future<List<Incident>> getIncidents() async {

    final url = "https://vast-savannah-75068.herokuapp.com/incidents";

    final response = await Dio().get(url);


    if (response.statusCode == 200) {
      final Iterable json = response.data;
      return json.map((incident) => Incident.fromJson(incident)).toList();
    } else {
      throw Exception("there was an error");
    }
  }

}