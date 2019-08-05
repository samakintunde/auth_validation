import 'dart:async';
import 'package:rxdart/rxdart.dart';

import 'package:auth_validation/mixins/form_validation.dart';

class Bloc extends Object with FormValidation {
  final BehaviorSubject _emailController = BehaviorSubject<String>();
  final BehaviorSubject _passwordController = BehaviorSubject<String>();

  // Process data added to stream
  Stream<String> get email => _emailController.stream.transform(validateEmail);
  Stream<String> get password =>
      _passwordController.stream.transform(validatePassword);
  Stream<bool> get isSubmitValid =>
      Observable.combineLatest2(email, password, (e, p) => true);

  // Add data to Stream
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  submitAuth() {
    final validEmail = _emailController.value;
    final validPassword = _passwordController.value;

    print('email: $validEmail');
    print('password: $validPassword');
  }

  void dispose() {
    _emailController.close();
    _passwordController.close();
  }
}
