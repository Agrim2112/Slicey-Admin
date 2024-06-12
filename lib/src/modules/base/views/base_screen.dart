import 'package:flutter/cupertino.dart';
import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:slicey_admin/src/modules/auth/bloc/sign_in_bloc/sign_in_bloc.dart';

class BaseScreen extends StatefulWidget {
  final Widget child;
  const BaseScreen(this.child,{super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInBloc,SignInState>(
      listener: (context,state){
        if(state is SignOutSuccess){
          html.window.location.reload();
        }
      },
      child: Scaffold(
        body: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child:Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell
                          (
                          onTap: (){
                            context.go('/home');
                          },
                          child: const Text(
                            "Slicey Admin",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 30
                            ),
                          ),
                        ),
                        const SizedBox(width: 80,),
                        InkWell
                          (
                          onTap: (){
                            context.go('/create');
                          },
                          child: Text(
                            "Create Pizza",
                            style: TextStyle(
                              color: Colors.grey.shade400,
                                fontWeight: FontWeight.w600,
                                fontSize: 20
                            ),
                          ),
                        ),
                      ],
                    ),
                    InkWell
                      (
                      onTap: (){
                        context.read<SignInBloc>().add(SignOutRequired());
                      },
                      child: const Row(
                        children: [
                          Text(
                            "Log Out",
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.w600,
                                fontSize: 20
                            ),
                          ),
                          SizedBox(width: 10),
                          Icon(
                            CupertinoIcons.arrow_right_to_line,
                            color: Colors.red,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                child: widget.child
            )
          ],
        ),
      ),
    );
  }
}

