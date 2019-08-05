import 'package:flutter/material.dart';
import 'package:auth_validation/bloc/login_bloc.dart';

class BlocProvider extends InheritedWidget {
  BlocProvider({Key key, Widget child}) : super(key: key, child: child);

  final bloc = Bloc();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static Bloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(BlocProvider) as BlocProvider)
        .bloc;
  }
}
