import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_form_validation/bloc/sign_in_bloc.dart';
import 'package:flutter_bloc_form_validation/bloc/sign_in_event.dart';
import 'package:flutter_bloc_form_validation/bloc/sign_in_state.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In With Email"),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 20
          ),
          child: ListView(
            physics: BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()
            ),
            children: [
              BlocBuilder<SignInBloc, SignInState>(
                builder: (context, state) {
                  if (state is SignInErrorState) {
                    return Text(
                      state.errorMessage,
                      style: TextStyle(
                          color: Colors.red
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              SizedBox(height: 10,),
              TextField(
                controller: emailController,
                onChanged: (val){
                  BlocProvider.of<SignInBloc>(context).add(
                    SignInTextChangedEvent(emailController.text, passwordController.text),
                  );
                },
                decoration: InputDecoration(
                    hintText: "Email Address"
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                controller: passwordController,
                onChanged: (val){
                  BlocProvider.of<SignInBloc>(context).add(
                    SignInTextChangedEvent(emailController.text, passwordController.text),
                  );
                },
                decoration: InputDecoration(
                    hintText: "Password"
                ),
              ),
              SizedBox(height: 20,),
              Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                child: BlocBuilder<SignInBloc, SignInState>(
                  builder: (context, state) {
                    if(state is SignInLoadingState){
                      return Center(
                          child: CircularProgressIndicator()
                      );
                    }
                    return CupertinoButton(
                      onPressed: () {
                        if(state is SignInValidState){
                          BlocProvider.of<SignInBloc>(context).add(
                            SignInSubmittedEvent(emailController.text, passwordController.text),
                          );
                        }
                      },
                      color: (state is SignInValidState) ? Colors.blue : Colors.grey,
                      child: Text("Sign In"),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
