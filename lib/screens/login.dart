import 'package:flutter/material.dart';
import 'package:auth_validation/bloc/login_bloc.dart';

class LoginScreen extends StatelessWidget {
  Widget _buildEmailField() {
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot) {
        return TextField(
          decoration: InputDecoration(
            labelText: 'Email Address',
            hintText: 'user@domain.com',
            errorText: snapshot.error,
          ),
          keyboardType: TextInputType.emailAddress,
          onChanged: bloc.changeEmail,
        );
      },
    );
  }

  Widget _buildPasswordField() {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot) {
        return TextField(
          decoration: InputDecoration(
            labelText: 'Password',
            hintText: 'Password',
            errorText: snapshot.error,
          ),
          obscureText: true,
          onChanged: bloc.changePassword,
        );
      },
    );
  }

  Widget _buildSubmitButton() {
    return RaisedButton(
      child: Text('Submit'),
      elevation: 8.0,
      color: Colors.greenAccent,
      onPressed: () {
        print('email:');
        print('password:');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16.0, 64.0, 16.0, 16.0),
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
    );
  }
}
