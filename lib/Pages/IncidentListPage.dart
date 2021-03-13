
import 'package:city_care/Pages/IncidentReportPage.dart';
import 'package:city_care/ViewModels/IncidentListViewModel.dart';
import 'package:city_care/ViewModels/ReportIncidentViewModel.dart';
import 'package:city_care/Widgets/incident_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IncidentListPage extends StatefulWidget {


  @override
  _IncidentListPageState createState() => _IncidentListPageState();
}

class _IncidentListPageState extends State<IncidentListPage> {
  Future<void> _reportIncident(BuildContext context) async {

    await Navigator.push(context, MaterialPageRoute(builder: (context) => ChangeNotifierProvider(
      create: (context) => ReportIncidentViewModel(),
        child: IncidentReportPage()),fullscreenDialog: true));
  }

  @override
  void initState() {
    super.initState();

    _populateAllIncidents();

  }

  void _populateAllIncidents() async {

    Provider.of<IncidentListViewModel>(context, listen: false).getAllIncidents();

  }

  Widget _updateUI(IncidentListViewModel vm){

    switch(vm.status) {

      case Status.loading:
        return Align(
          child: CircularProgressIndicator(),
        );

      case Status.empty:
        return Text("No incidents found");
      case Status.success:
        return IncidentList(incidents: vm.incidents,);
    }

  }

  @override
  Widget build(BuildContext context) {

final vm = Provider.of<IncidentListViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("City Care"),
        backgroundColor: Colors.blueGrey,
      ),

      body: Stack(
        children: [
          _updateUI(vm),
          SafeArea(
            child: Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                child: Icon(Icons.add, size: 40,),
                  backgroundColor: Colors.blueGrey,

                  onPressed: (){

                  _reportIncident(context);

              }),
            ),
          )
        ],
      ),
    );
  }
}
