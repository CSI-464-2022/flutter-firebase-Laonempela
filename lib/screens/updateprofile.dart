import 'package:csi464/screens/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/bookcovid_test.dart';
import '../models/covid_user.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({Key? key}) : super(key: key);

  @override
  _UpdateProfileState createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  final controllerName = TextEditingController();
  final controllerOmang = TextEditingController();
  final controllerPhysicalAddress = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text('UPDATE PROFILE'),
          centerTitle: true,
          backgroundColor: Colors.blue,
          elevation: 0.0,
        ),
        body: ListView (
          padding: const EdgeInsets.all(16),
          children: <Widget>[
            const SizedBox(height: 10),
            const Text('SCREENING FOR COVID-19', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            const SizedBox(height: 24),
            TextField(
              controller :controllerName,
              decoration: decoration('Enter Your Name'),
            ),
            const SizedBox(height: 24),
            TextField(
              controller:controllerOmang,
              decoration: decoration('Enter Your Omang Number'),
            ),
            const SizedBox(height: 24),
            TextField(
              controller:controllerPhysicalAddress,
              decoration: decoration('Enter Physical Address'),
              maxLines: 2,
            ),
            const SizedBox(height: 32),

            const SizedBox(height: 32),
            ElevatedButton(
                onPressed: () {
                  final test = CovidUser(
                      userId: '',
                      omang: controllerOmang.text,
                      name: controllerName.text,
                      physicalAddress: controllerPhysicalAddress.text

                  );
                  create360(test);
                  Navigator.pop(context);
                  }, child: const Text('Update Profile'))

          ],
        )
    );
  }
  InputDecoration decoration (String label) => InputDecoration(
    labelText:label,
    border: const OutlineInputBorder(),
  );

  Future create360(CovidUser test) async{
    final docUser = FirebaseFirestore.instance.collection('users').doc();
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Profile Updated')));
    test.userId = docUser.id;

    final json = test.toJson();
    await docUser.set(json);
  }

}

