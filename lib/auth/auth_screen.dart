import 'package:firebaselogin/auth/widget/authform.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    TextTheme textTheme = Theme.of(context).textTheme;
    IconThemeData iconTheme = Theme.of(context).iconTheme;
    return Scaffold(
      backgroundColor: colorScheme.primary,
      body: AuthForm(),
    );
  }
}
