import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({Key key}) : super(key: key);

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  var _isLogin = true;
  String _userEmail = '';
  String _userName = '';
  String _userPassword = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    TextTheme textTheme = Theme.of(context).textTheme;
    IconThemeData iconTheme = Theme.of(context).iconTheme;
    return Center(
      child: Card(
        elevation: 20,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextFormField(
                    key: ValueKey('email'),
                    onSaved: (userEmailValue) {
                      _userEmail = userEmailValue;
                    },
                    validator: (value) {
                      if (value.isNotEmpty || !value.contains("@")) {
                        return "Pleas enter a valid email address.";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email address',
                    ),
                  ),
                   if (!_isLogin)
                    TextFormField(
                      key: ValueKey('userName'),
                      onSaved: (userNameValue) {
                        _userName = userNameValue;
                      },
                      validator: (value) {
                        if (value.isNotEmpty || value.length < 8) {
                          return "Pleas Enter at least 4 characters";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'User name',
                      ),
                    ),
                  TextFormField(
                    key: ValueKey('password'),
                    onSaved: (userPasswordValue) {
                      _userPassword = userPasswordValue;
                    },
                    validator: (value) {
                      if (value.isNotEmpty || value.length > 5) {
                        return "Password must be at list 5 characters long";
                      }
                      return null;
                    },
                    obscureText: true,
                    autocorrect: false,
                    enableSuggestions: false,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                  ),
                  SizedBox(
                    height: 12,),
                  // !_isLogin?
                  RaisedButton(
                    elevation: 20,
                    child: Text(_isLogin ? 'Login' : "Signup"),
                    onPressed: _logInButton,
                  ),
                  // RaisedButton(
                  //   elevation: 20,
                  //   child: Text(_isLogin ? 'Login' : "Signup"),
                  //   onPressed: _signUpButton,
                  // ),
                  FlatButton(
                    onPressed: () {
                      setState(() {
                        _isLogin = !_isLogin;
                      });
                    },
                    child: Text(
                      _isLogin
                          ? "Create new account"
                          : 'I have an already account',
                      style: TextStyle(color: colorScheme.primary),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _logInButton() {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState.save();
      print("This Is Login: ${_userEmail}");
      print(_userName);
      print(_userPassword);
      // Use those value to send our auth request ..........
    }
  }
  void _signUpButton() {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState.save();
      print("This Is SignUp: ${_userEmail}");
      print(_userName);
      print(_userPassword);
      // Use those value to send our auth request ..........
    }
  }
}
