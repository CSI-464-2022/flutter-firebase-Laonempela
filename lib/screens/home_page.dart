import 'package:csi464/screens/screens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'chat/chat_screen_home.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Home '),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                  child: Text('Home'),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  )),
              const Divider(
                height: 1,
                thickness: 1,
              ),
              ListTile(
                leading: const Icon(Icons.account_circle),
                title: const Text('Profile'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const ProfilePage()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Logout'),
                onTap: () {
                  showBanner();
                  Navigator.pop(context);
                },
              ),
            ],
          )),
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
          SizedBox(height: 100.0),
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
                          width: 100,
                          height: 100,
                          padding: const EdgeInsets.all(8),

                          child:  GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const CovidInfo()));
                            },
                            child:Card(
                                color: Colors.blue,
                                elevation: 2,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      CircleAvatar(
                                        backgroundColor: Colors.transparent,
                                        radius: 48.0,
                                        child: Image.asset('assets/error_outline_24px.png'),
                                      ),
                                      Expanded( child:TextButton(
                                          child: const Text('GET KNOWLEGEBLE ON COVID-19'),
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
                          height: 100,
                          padding: const EdgeInsets.all(8),
                          child:GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const VaccinationHome()));
                            },
                            child: Card(
                                color: Colors.red,
                                elevation: 2,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      CircleAvatar(
                                        backgroundColor: Colors.transparent,
                                        radius: 48.0,
                                        child: Image.asset('assets/place_24px.png'),
                                      ),
                                      Expanded(child: TextButton(
                                          child: const Text('GET VACCINATED'),
                                          style: TextButton.styleFrom(
                                            primary: Colors.white,
                                          ),
                                          onPressed: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => const VaccinationHome()));
                                          }),
                                      )
                                    ])),)
                      ),
                      Container(
                          width: 100,
                          height: 100,
                          padding: const EdgeInsets.all(8),
                          child:GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const ReportIssues()));
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
                                        child: Image.asset('assets/notification_important_24px.png'),
                                      ),
                                      Expanded(child:TextButton(
                                          child: const Text('REPORT ISSUES'),
                                          style: TextButton.styleFrom(
                                            primary: Colors.white,
                                          ),
                                          onPressed: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => const ReportIssues()));
                                          })
                                      ),
                                    ])),)
                      ),
                      Container(
                          width: 100,
                          height: 100,
                          padding: const EdgeInsets.all(8),
                          child:GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const ChatPage()));
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
                                        child: Image.asset('assets/Vector.png'),
                                      ),
                                      Expanded(child:TextButton(
                                          child: const Text('GET CONNECTED'),
                                          style: TextButton.styleFrom(
                                            primary: Colors.white,
                                          ),
                                          onPressed: () {
                                              Navigator.push(context, MaterialPageRoute(builder: (context) => const ChatPage()));
                                          }),
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

  void showBanner() =>
      ScaffoldMessenger.of(context).showMaterialBanner(MaterialBanner(
          backgroundColor: Colors.white,
          padding: const EdgeInsets.all(18),
          content: const Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              style: TextButton.styleFrom(primary: Colors.purple),
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                FirebaseAuth.instance.signOut();
              },
              child: const Text('YES'),
            ),
            TextButton(
                style: TextButton.styleFrom(primary: Colors.purple),
                onPressed: () =>
                    ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
                child: const Text('NO'))
          ]));


}