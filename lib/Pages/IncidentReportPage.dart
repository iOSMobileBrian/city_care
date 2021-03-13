
import 'package:city_care/ViewModels/ReportIncidentViewModel.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import 'dart:async';


class IncidentReportPage extends StatefulWidget {

  @override
  _IncidentReportPageState createState() => _IncidentReportPageState();
}

class _IncidentReportPageState extends State<IncidentReportPage> {

  ReportIncidentViewModel _reportIncidentViewModel;


  @override
  void initState() {
    super.initState();
    _reportIncidentViewModel = Provider.of<ReportIncidentViewModel>(context, listen: false);
  }

  void _showPhotoSelectionOptions(BuildContext context){

    showModalBottomSheet(
        context: context,
        builder: (context){

          return Container(
            height: 150,
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.photo_camera),
                  title: Text("Take A Photo"),
                  onTap: (){
                    Navigator.of(context).pop();
                    _showCamera();
                  },
                ),
                ListTile(
                  onTap: (){

                    Navigator.of(context).pop();
                    _showPhotoAlbum();
                  },
                  leading: Icon(Icons.photo_album),
                  title: Text("Select a Photo"),
                )
              ],
            ),
          );

    }
    );
  }

  Future<void> _showPhotoAlbum() async{

    final image = await ImagePicker().getImage(source: ImageSource.gallery);

    setState(() {
      _reportIncidentViewModel.imagePath = image.path;
    });

  }

  Future<void> _showCamera() async{

    final image = await ImagePicker().getImage(source: ImageSource.camera);

    setState(() {
      _reportIncidentViewModel.imagePath = image.path;
    });

  }



  @override
  Widget build(BuildContext context) {

    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,

      };
      if (states.any(interactiveStates.contains)) {
        return Colors.red;
      }
      return Colors.grey;
    }

    final vm = Provider.of<ReportIncidentViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Report an incident'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            vm.imagePath == null ? Image.asset("images/IMG_1604.png"): Image.file(File(vm.imagePath)),
            ElevatedButton(onPressed: (){
              _showPhotoSelectionOptions(context);
            }, child: Text("Take Photo",style: TextStyle(color: Colors.white),),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.resolveWith(getColor),

              ),
            ),
            TextField(
              onChanged: (value) => vm.title = value,
              decoration: InputDecoration(
                labelText: "Enter an incident",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                )
              ),
            ),

            TextField(
              onChanged: (value) => vm.title = value,
              textInputAction: TextInputAction.done,
              maxLines: null,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                labelText: "Enter a description",
              ),

            ),
            Container(
              width: 130,
              height: 60,
              child: TextButton(onPressed: (){
                   vm.saveIncident();
                   Navigator.pop(context);
              },
                  child: Text("Save", style: TextStyle(fontSize:20,color: Colors.white, backgroundColor: Colors.green),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
