import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widgets/widgets.dart';
import 'screens.dart';

class VaccinationHome extends StatefulWidget {
  const VaccinationHome({Key? key}) : super(key: key);

  @override
  _VaccinationHomeState createState() => _VaccinationHomeState();
}

class _VaccinationHomeState extends State<VaccinationHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('VACCINATION'),
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
      body: Stack(
        children:<Widget>[
          /*
        Column(
                child: ListView(
                    padding: const EdgeInsets.symmetric(vertical: 30.0),
                children: const <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 120),
                    child: Text('What would you like to find?',
                      style:TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                ],
              ),
              ),
           */
          const SizedBox(height: 100.0),
          Column(
            children: <Widget>[
              const SizedBox(
                height:50,
              ),
              Flexible(
                child: GridView.count(
                    crossAxisSpacing: 10,
                    padding: const EdgeInsets.all(20),
                    mainAxisSpacing: 10,
                    primary: false,
                    children: <Widget>[
                      Container(
                          width: 20,
                          height: 20,
                          padding: const EdgeInsets.all(8),

                          child:  GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const VaccinationSites()));
                            },
                            child:Card(
                                color: Colors.red,
                                elevation: 2,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      CircleAvatar(
                                        backgroundColor: Colors.transparent,
                                        radius: 48.0,
                                        child: Image.asset('assets/vaccenter.png'),
                                      ),
                                      Expanded( child:TextButton(
                                          child: const Text('Vaccination Centers'),
                                          style: TextButton.styleFrom(
                                            primary: Colors.white,
                                          ),
                                          onPressed: () {
                                            // Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPage()));
                                          }),
                                      ),
                                    ])),
                          )
                      ),
                      Container(
                          width: 100,
                          height: 20,
                          padding: const EdgeInsets.all(8),
                          child:GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const VaccinationAvailable()));
                            },
                            child: Card(
                                color: Colors.yellow,
                                elevation: 2,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      CircleAvatar(
                                        backgroundColor: Colors.transparent,
                                        radius: 48.0,
                                        child: Image.asset('assets/availablevac.png'),
                                      ),
                                      Expanded(child: TextButton(
                                          child: const Text('Availabe Vaccines'),
                                          style: TextButton.styleFrom(
                                            primary: Colors.white,
                                          ),
                                          onPressed: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => const VaccinationAvailable()));
                                          }),
                                      )
                                    ])),)
                      ),
                      Container(
                          width: 100,
                          height: 20,
                          padding: const EdgeInsets.all(8),
                          child:GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const VaccinationBook()));
                            },
                            child: Card(
                                color: Colors.green,
                                elevation: 2,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      CircleAvatar(
                                        backgroundColor: Colors.transparent,
                                        radius: 48.0,
                                        child: Image.asset('assets/bookvac.png'),
                                      ),
                                      Expanded(child:TextButton(
                                          child: const Text('Book Vaccination'),
                                          style: TextButton.styleFrom(
                                            primary: Colors.white,
                                          ),
                                          onPressed: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => const VaccinationBook()));
                                          })
                                      ),
                                    ])),)
                      ),
                      Container(
                          width: 100,
                          height: 20,
                          padding: const EdgeInsets.all(8),
                          child:GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const BookCovidTest()));
                            },
                            child: Card(
                                color: Colors.purple,
                                elevation: 2,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      CircleAvatar(
                                        backgroundColor: Colors.transparent,
                                        radius: 48.0,
                                        child: Image.asset('assets/covidtest.jpg'),
                                      ),
                                      Expanded(child:TextButton(
                                          child: const Text('Book CovidTest'),
                                          style: TextButton.styleFrom(
                                            primary: Colors.white,
                                          ),
                                          onPressed: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => const BookCovidTest()));
                                          })
                                      ),
                                    ])),)
                      ),
                    ],
                    crossAxisCount: 2),
              )
            ],
          )
        ],
      ),
    );
  }
  }

