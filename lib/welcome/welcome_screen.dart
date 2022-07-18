import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_form_validation/bloc/sign_in_bloc.dart';
import 'package:flutter_bloc_form_validation/screens/sign_in.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Center(
              child: Text(
                "Example",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.bottomCenter,
                child: CupertinoButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BlocProvider(
                                  create: (context) => SignInBloc(),
                                  child: SignInScreen(),
                                )
                        ));
                  },
                  color: Colors.blue,
                  child: Text("Sign in with Email"),
                ),
              )
            ],
          )
        ],
      ),
    ));
  }
}
