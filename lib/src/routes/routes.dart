import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:slicey_admin/src/blocs/authentication_bloc/authentication_bloc.dart';

final _navKey = GlobalKey<NavigatorState>();
final _shellNavigationavKey = GlobalKey<NavigatorState>();

GoRouter router (AuthenticationBloc authBloc){

  return GoRouter(
    navigatorKey: _navKey,
    initialLocation: '/',
    redirect: (context,state){
      if(authBloc.state == AuthenticationState.unknown()){
        return '/';
      }
    },
    routes:[

    ] );
}