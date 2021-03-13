
import 'package:city_care/Models/Incident.dart';

class IncidentViewModel{

  final Incident incident;

  IncidentViewModel({this.incident});

  String get title{
    return this.incident.title;
  }

  String get description{

    return this.incident.description;
  }

  String get imageURL {

    return this.incident.imageUrl;
  }
}