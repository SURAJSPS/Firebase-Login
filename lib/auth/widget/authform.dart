import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({Key key}) : super(key: key);

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final emailController = TextEditingController();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final confPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var _isLogin = true;
  var _userEmail = '';
  var _userName = '';
  var _userPassword = '';
  var _userConformPassword = '';

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
                  _emailAddress(),
                  SizedBox(
                    height: 10,
                  ),
                  if (!_isLogin) _uName(),
                  SizedBox(
                    height: 10,
                  ),
                  _password(),
                  SizedBox(
                    height: 10,
                  ),
                  if (!_isLogin) _confPassword(),
                  SizedBox(
                    height: 12,
                  ),
                  // !_isLogin?
                  _isLogin ? _logInButton() : _signupButton(),
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

  // mail id widget
  Widget _emailAddress() {
    Size size = MediaQuery.of(context).size;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    TextTheme textTheme = Theme.of(context).textTheme;
    IconThemeData iconTheme = Theme.of(context).iconTheme;
    return TextFormField(
      controller: emailController,
      key: ValueKey('email'),
      onSaved: (value) {
        _userEmail = value;
      },
      validator: (value) {
        if (!value.isNotEmpty || !value.contains("@")) {
          return "Pleas enter a valid email address.";
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.email,size: 15,),
        suffixIcon: IconButton(
          onPressed: () {
            emailController.clear();
          },
          icon: Icon(
            Icons.clear,
            size: 15,
          ),
        ),
        labelText: 'Email address',
        hintText: 'Email address',
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: colorScheme.primary)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorScheme.primary),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }

  // user name widget
  Widget _uName() {
    Size size = MediaQuery.of(context).size;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    TextTheme textTheme = Theme.of(context).textTheme;
    IconThemeData iconTheme = Theme.of(context).iconTheme;
    return TextFormField(
       controller: userNameController,
      key: ValueKey('userName'),
      onSaved: (value) {
        _userName = value;
      },
      validator: (value) {
        if (!value.isNotEmpty || value.length < 4) {
          return "Pleas Enter at least 4 characters";
        }
        return null;
      },
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person,size: 18,),
        suffixIcon: IconButton(
          onPressed: () {
            userNameController.clear();
          },
          icon: Icon(
            Icons.clear,
            size: 15,
          ),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: colorScheme.primary)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorScheme.primary),
          borderRadius: BorderRadius.circular(30),
        ),
        labelText: 'User name',
      ),
    );
  }

  // password widget
  Widget _password() {
    Size size = MediaQuery.of(context).size;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    TextTheme textTheme = Theme.of(context).textTheme;
    IconThemeData iconTheme = Theme.of(context).iconTheme;
    return TextFormField(
      controller: passwordController,
      key: ValueKey('password'),
      onSaved: (value) {
        _userPassword = value;
      },
      validator: (value) {
        if (!value.isNotEmpty || value.length < 4) {
          return "Password must be at list 5 characters long";
        }
        return null;
      },
      // maxLength: 10,
      obscureText: true,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.shield,size: 15,),
          suffixIcon: IconButton(
            onPressed: () {
              passwordController.clear();
            },
            icon: Icon(
              Icons.clear,
              size: 15,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: colorScheme.primary),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(color: colorScheme.primary),
          ),
          labelText: 'Password',
          hintText: 'Password'),
    );
  }

  // conform password widget
  Widget _confPassword() {
    Size size = MediaQuery.of(context).size;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    TextTheme textTheme = Theme.of(context).textTheme;
    IconThemeData iconTheme = Theme.of(context).iconTheme;
    return TextFormField(
      controller: confPasswordController,
      key: ValueKey('conformPassword'),
      validator: (value) {
        if (value.isEmpty || value.length < 4) {
          return "Your password should not match";
        }
        return null;
      },
      onSaved: (value) {
        _userConformPassword = value;
      },
      obscureText: true,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.shield,size: 15,),
          suffixIcon: IconButton(
            onPressed: () {
              confPasswordController.clear();
            },
            icon: Icon(
              Icons.clear,
              size: 15,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: colorScheme.primary),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: colorScheme.primary),
          ),
          labelText: 'Conform password',
          hintText: "Conform password"),
    );
  }

  // login button widget
  Widget _logInButton() {
    Size size = MediaQuery.of(context).size;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    TextTheme textTheme = Theme.of(context).textTheme;
    IconThemeData iconTheme = Theme.of(context).iconTheme;
    return RaisedButton(
      elevation: 20,
      child: Text(_isLogin ? 'Login' : "Signup"),
      onPressed: _logInClick,
    );
  }

  // signup button widget
  Widget _signupButton() {
    Size size = MediaQuery.of(context).size;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    TextTheme textTheme = Theme.of(context).textTheme;
    IconThemeData iconTheme = Theme.of(context).iconTheme;
    return RaisedButton(
      //This is use for SignUp
      elevation: 20,
      child: Text(_isLogin ? 'Login' : "Signup"),
      onPressed: _signUpClick,
    );
  }

// login function
  void _logInClick() {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState.save();
      print("This Is Login: ${_userEmail}");
      print("This Is Password: ${_userPassword}");
      print("This Is User Name: ${_userName}");
      // Use those value to send our auth request  for login..........
    }
  }

// signup function
  void _signUpClick() {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState.save();
      print("This Is SignUp: ${_userEmail}");
      print("This Is SignUp: ${_userName}");
      print("This Is SignUp: ${_userPassword}");
      print("This Is SignUp: ${_userConformPassword}");
      // Use those value to send our auth request for signup..........
    }
  }
}
