import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../profile_page.dart';

class VaccinationAvailable extends StatefulWidget {
  const VaccinationAvailable({Key? key}) : super(key: key);

  @override
  _VaccinationAvailableState createState() => _VaccinationAvailableState();
}

class _VaccinationAvailableState extends State<VaccinationAvailable> {
  final firestoreRef = FirebaseFirestore.instance;
  double heightRow = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AVAILABLE VACCINES'),
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
      body: SafeArea( child: FutureBuilder<QuerySnapshot>(
          future: firestoreRef.collection('vaccines').get(),
          builder: (context, snapshot){
            if(snapshot.hasData){
              final List<DocumentSnapshot> arrData = snapshot.data!.docs;
              return ListView(children: arrData.map((data){
                return Card(child: Column(
                  children: [
                    Row(
                      children: [
                        const Expanded(flex:1,child: Text('Name')),
                        Expanded(flex:2,child:Text(data['name']))
                      ],
                    ),
                    SizedBox(height: heightRow),
                    Row(
                      children: [
                        const Expanded(flex:1,child: Text('Efficiency')),
                        Expanded(flex:2,child:Text(data['efficieny']))
                      ],
                    ),
                    SizedBox(height: heightRow),
                    Row(
                      children: [
                        const Expanded(flex:1,child: Text('No.of Booster`s')),
                        Expanded(flex:2,child:Text(data['booster']))
                      ],
                    ),
                    SizedBox(height: heightRow),
                    Row(
                      children: [
                        const Expanded(flex:1,child: Text('Side Effects')),
                        Expanded(flex:2,child:Text(data['sideeffects']))
                      ],
                    ),
                    SizedBox(height: heightRow),
                    const Text("Get Vaccinated", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
                    SizedBox(height: heightRow),
                  ],));
              }).toList(),);
            }else{
              return const Text('no data');
            }
          })),
    );
  }

}