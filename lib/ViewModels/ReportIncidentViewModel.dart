



import 'package:city_care/Models/Incident.dart';
import 'package:city_care/Services/WebService.dart';
import 'package:flutter/cupertino.dart';

class ReportIncidentViewModel extends ChangeNotifier{

  String title;
  String description;
  String imagePath;

  Future<void> saveIncident() async{

    final incident = Incident(title: this.title, description: this.description, imageUrl: this.imagePath);
    await WebService().saveIncident(incident);
    notifyListeners();
  }
}