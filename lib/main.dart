import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:natur/Models/user.dart';
import 'package:natur/Services/auth.dart';
import 'package:natur/Services/authenticate.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel>.value(
        value: AuthServices().user,
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Natur',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Authenticate(),
        ));
  }
}
