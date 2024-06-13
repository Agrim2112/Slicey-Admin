import 'dart:js';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:slicey_admin/src/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:slicey_admin/src/modules/create_pizza/bloc/upload_picture_bloc/upload_picture_bloc.dart';
import 'package:pizza_repository/pizza_repository.dart';
import '../modules/auth/bloc/sign_in_bloc/sign_in_bloc.dart';
import '../modules/auth/views/sign_in_screen.dart';
import '../modules/base/views/base_screen.dart';
import '../modules/create_pizza/views/create_pizza_screen.dart';
import '../modules/home/views/home_screen.dart';
import '../modules/splash/views/splash_screen.dart';

final _navKey = GlobalKey<NavigatorState>();
final _shellNavigationavKey = GlobalKey<NavigatorState>();

GoRouter router(AuthenticationBloc authBloc) {
  return GoRouter(
      navigatorKey: _navKey,
      initialLocation: '/',
      redirect: (context, state) {
        if (authBloc.state == AuthenticationState.unknown()) {
          return '/';
        }
      },
      routes: [
        ShellRoute(
            navigatorKey: _shellNavigationavKey,
            builder: (context, state, child) {
              if (state.fullPath == '/login' || state.fullPath == '/') {
                return child;
              }
              else {
                return BlocProvider<SignInBloc>(
                  create: (context) =>
                      SignInBloc(
                          context
                              .read<AuthenticationBloc>()
                              .userRepository
                      ),
                  child: BaseScreen(child),
                );
              }
            },
            routes: [
              GoRoute(
                  path: '/',
                  builder: (context, state) =>
                  BlocProvider<AuthenticationBloc>.value(
                      value: BlocProvider.of<AuthenticationBloc>(context),
                      child: const SplashScreen()
                  )
              ),
              GoRoute(
                  path: '/login',
                  builder: (context, state) =>
                  BlocProvider<AuthenticationBloc>.value(
                      value: BlocProvider.of<AuthenticationBloc>(context),
                      child: BlocProvider<SignInBloc>(
                        create: (context) =>
                            SignInBloc(
                                context
                                    .read<AuthenticationBloc>()
                                    .userRepository
                            ),
                        child: const SignInScreen(),
                      )
                  )
              ),
              GoRoute(
                  path: '/home',
                  builder: (context, state) => const HomeScreen()
              ),
              GoRoute(
                  path: '/create',
                  builder: (context, state) => BlocProvider(
                        create: (context) => UploadPictureBloc(FirebasePizzaRepo()),
                        child: const CreateScreen(),
                      )
              )
            ]
        )
      ]);
}