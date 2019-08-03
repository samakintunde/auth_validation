import 'package:flutter/material.dart';
import 'package:auth_validation/mixins/form_validation.dart';

class LoginScreen extends StatefulWidget {
  LoginScreenState createState() => LoginScreenState();
}

// Use of mixins allows us to use all the functions in the mixin
class LoginScreenState extends State<LoginScreen> with FormValidation {
  final _formKey = GlobalKey<FormState>();

  String _email;
  String _password;

  Widget _buildEmailField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Email Address',
        hintText: 'user@domain.com',
      ),
      keyboardType: TextInputType.emailAddress,
      onSaved: (String value) => _email = value,
      validator: (String value) => validateEmail(value),
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Password',
      ),
      obscureText: true,
      onSaved: (String value) => _password = value,
      validator: (String value) => validatePassword(value, 6),
    );
  }

  Widget _buildSubmitButton() {
    return RaisedButton(
      child: Text('Submit'),
      elevation: 8.0,
      color: Colors.greenAccent,
      onPressed: () {
        if (_formKey.currentState.validate()) {
          _formKey.currentState.save();
          print('email: $_email');
          print('password: $_password');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16.0, 64.0, 16.0, 16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(16.0),
              margin: const EdgeInsets.only(bottom: 36.0),
              color: Colors.greenAccent,
              child: Text(
                'Auth Validator',
                textAlign: TextAlign.center,
              ),
            ),
            _buildEmailField(),
            SizedBox(
              height: 16.0,
            ),
            _buildPasswordField(),
            SizedBox(
              height: 16.0,
            ),
            _buildSubmitButton(),
          ],
        ),
      ),
    );
  }
}
