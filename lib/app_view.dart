import 'dart:html';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:slicey_admin/src/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:slicey_admin/src/routes/routes.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Slicey Admin",
        theme: ThemeData(
        colorScheme: ColorScheme.light(
        background: Colors.grey.shade200,
        onBackground: Colors.black,
        primary: Colors.blue,
        onPrimary: Colors.white
    )
    ),
      routerConfig: router(context.read<AuthenticationBloc>()),
    )
    ;
  }
}
