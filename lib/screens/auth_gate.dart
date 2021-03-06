import 'package:csi464/screens/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      initialData: FirebaseAuth.instance.currentUser,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const HomePage();
        } else {
          return SignInScreen(

            headerBuilder: (context, constraints, _){
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset('assets/covidsafe.png',
                    fit: BoxFit.fitWidth,
                    width: 240,
                    height: 240,),
                ),
              );
            },
            providerConfigs: const [
              EmailProviderConfiguration(),
            ],
          );
        }
      },
    );
  }
}
