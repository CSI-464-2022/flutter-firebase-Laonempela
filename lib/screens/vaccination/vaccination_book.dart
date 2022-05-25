import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/bookvaccine.dart';
import '../profile_page.dart';

class VaccinationBook extends StatefulWidget {
  const VaccinationBook({Key? key}) : super(key: key);

  @override
  _VaccinationBookState createState() => _VaccinationBookState();
}

class _VaccinationBookState extends State<VaccinationBook> {
  final controllerLocation = TextEditingController();
  final controllerVaccine = TextEditingController();
  String time = 'No Vaccination Date Choosen';
  late DateTime _mydateTime;
  String Vaccination = 'BioNTech, Pfizer vaccine';


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text('BOOK VACCINATION'),
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
            const Text('HOW DO THE COVID-19 VACCINES WORK?', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            const SizedBox(height: 5),
            const Text('The COVID-19 vaccines are a type of medicine that work by teaching our body how to recognize and fight the virus that causes COVID-19. The COVID-19 vaccines will help protect us from getting COVID-19, becoming very sick with the virus, needing to be hospitalized, or dying from COVID-19.', style: TextStyle(fontSize: 18),),
            const SizedBox(height: 35),
            const Text('CHOOSE VACCINE?', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
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
                child: const Text('Choose Vaccination Date')
            ),
            const SizedBox(height: 32),
            ElevatedButton(
                onPressed: () {
                  final test = BookVaccine(
                      id: '',
                      date: _mydateTime,
                      vaccine: Vaccination

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

  Future create360(BookVaccine test) async{
    final docUser = FirebaseFirestore.instance.collection('bookvaccine').doc();
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Record Added.')));
    test.id = docUser.id;

    final json = test.toJSON();
    await docUser.set(json);
  }
  Widget dropDown() {
    final items = [
      "BioNTech, Pfizer vaccine",
      "Johnson & Johnson vaccine",
      "Oxford, AstraZeneca vaccine"
    ];
    return Container(
      child: DropdownButton<String>(
        value: Vaccination,
        isExpanded: true,
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        items: items.map(buildMenuItem).toList(),
        onChanged: (value) => setState(() {
          this.Vaccination = value!;
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

