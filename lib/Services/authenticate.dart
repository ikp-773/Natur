import 'package:flutter/material.dart';
import 'package:natur/Models/user.dart';
import 'package:natur/Screens/home.dart';
import 'package:natur/Screens/sign_up.dart';
import 'package:provider/provider.dart';

class Authenticate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);
    return user != null ? Home() : SignUp();
  }
}
