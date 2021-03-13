


import 'package:city_care/Services/WebService.dart';
import 'package:city_care/ViewModels/IncidentViewModel.dart';
import 'package:flutter/material.dart';


enum Status{

  empty,
  loading,
  success

}

class IncidentListViewModel extends ChangeNotifier {

  Status status = Status.empty;

  List<IncidentViewModel> incidents = [];

  Future<void> getAllIncidents() async{
      status = Status.loading;
    final results = await WebService().getIncidents();

    incidents = results.map((incident) => IncidentViewModel(incident: incident)).toList();
    status = incidents.isEmpty ?  Status.empty : Status.success;
    notifyListeners();

  }
}