import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/bookcovid_test.dart';
import '../profile_page.dart';

class BookCovidTest extends StatefulWidget {
  const BookCovidTest({Key? key}) : super(key: key);

  @override
  _BookCovidTestState createState() => _BookCovidTestState();
}

class _BookCovidTestState extends State<BookCovidTest> {
  final controllerLocation = TextEditingController();
  final controllerVaccine = TextEditingController();
  String time = 'No Covid Test Date Choosen';
  late DateTime _mydateTime;
  String covidTest = 'Polymerase chain reaction (PCR)';


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text('BOOK COVIDTEST'),
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
            const SizedBox(height: 10),
            const Text('SCREENING FOR COVID-19', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            const SizedBox(height: 5),
            const Text('Polymerase chain reaction (PCR) tests are sent away to a lab to diagnose disease', style: TextStyle(fontSize: 18),),
            const SizedBox(height: 5),
            const Text('Lateral flow tests (LFTs) can diagnose Covid-19 on the spot, but aren’t as accurate as PCR tests', style: TextStyle(fontSize: 18),),
            const SizedBox(height: 35),
            const Text('CHOOSE COVIDTEST?', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            dropDown(),
            const SizedBox(
              height: 24,
            ),
            const SizedBox(height: 24),
            Text(
              time,
              style: const TextStyle(fontSize: 20.0),
            ),
            ElevatedButton(
                onPressed: () async {
                  _mydateTime = (await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2022),
                      lastDate: DateTime(2025)
                  ))!;

                  setState(() {
                    final now = DateTime.now();
                    time = _mydateTime.toString();
                  });

                },
                child: const Text('Choose Covid Test Date')
            ),
            const SizedBox(height: 32),
            ElevatedButton(
                onPressed: () {
                  final test = BookTest(
                      id: '',
                      date: _mydateTime,
                      covidTest: covidTest

                  );
                  create360(test);
                  Navigator.pop(context);}, child: const Text('Create'))
          ],
        )
    );
  }
  InputDecoration decoration (String label) => InputDecoration(
    labelText:label,
    border: const OutlineInputBorder(),
  );

  Future create360(BookTest test) async{
    final docUser = FirebaseFirestore.instance.collection('bookcovidtest').doc();
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Test Confirmed')));
    test.id = docUser.id;

    final json = test.toJSON();
    await docUser.set(json);
  }
  Widget dropDown() {
    final items = [
      "Polymerase chain reaction (PCR)",
      "Lateral flow tests (LFTs)",
    ];
    return Container(
      child: DropdownButton<String>(
        value: covidTest,
        isExpanded: true,
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        items: items.map(buildMenuItem).toList(),
        onChanged: (value) => setState(() {
          this.covidTest = value!;
        }),
      ),
    );
  }
  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
    value: item,
    child: Text(
      item,
      style: const TextStyle(fontSize: 20),
    ),
  );
}

