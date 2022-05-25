import 'package:csi464/screens/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/report_incident.dart';

class ReportIssues extends StatefulWidget {
  const ReportIssues({Key? key}) : super(key: key);

  @override
  _ReportIssuesState createState() => _ReportIssuesState();
}

class _ReportIssuesState extends State<ReportIssues> {
  final controllerIssue = TextEditingController();
  final controllerDescription = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text('REPORT ISSUES'),
          centerTitle: true,
          backgroundColor: Colors.blue,
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.person),
              iconSize: 28.0,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ProfilePage(),),);
              },
            ),
          ],
        ),
        body: ListView (
          padding: const EdgeInsets.all(16),
          children: <Widget>[
            TextField(
              controller :controllerIssue,
              decoration: decoration('Type Of Incident'),
            ),
            const SizedBox(height: 24),
            TextField(
              controller:controllerDescription,
              decoration: decoration('Describe Incident'),
              maxLines: 10,
            ),

            const SizedBox(height: 32),
            ElevatedButton(
                onPressed: () {
                  final test = ReportIncident(
                    typeofincident: controllerIssue.text,
                    description: controllerDescription.text,
                    id:'',
                  );
                  create360(test);
                  Navigator.pop(context);}, child: const Text('REPORT'))
          ],
        )
    );
  }
  InputDecoration decoration (String label) => InputDecoration(
    labelText:label,
    border: const OutlineInputBorder(),
  );

  Future create360(ReportIncident test) async{
    final docUser = FirebaseFirestore.instance.collection('reports').doc();
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Incident Reported.')));
    test.id = docUser.id;

    final json = test.toJSON();
    await docUser.set(json);
  }
}

