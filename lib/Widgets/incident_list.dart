
import 'package:city_care/ViewModels/IncidentViewModel.dart';
import 'package:flutter/material.dart';


class IncidentList extends StatefulWidget {

  List<IncidentViewModel> incidents;
  IncidentList({this.incidents});

  @override
  _IncidentListState createState() => _IncidentListState();
}

class _IncidentListState extends State<IncidentList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.incidents == null ? 0: widget.incidents.length,
        itemBuilder: (context, index){
          final incident = widget.incidents[index];
          return ListTile(
            title: Text(widget.incidents == null ? "empty": incident.title),
          );
        });
  }
}
