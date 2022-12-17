import 'dart:developer';

import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:test_app/business_logic/bloc/login/login_bloc.dart';
import 'package:test_app/data/data_provider/login_details_api.dart';
import 'package:test_app/screens/loading_indicator.dart';
import 'package:test_app/screens/login/components/login_custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/size_config.dart';
import '../home/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  //creating instance for bloc
  LoginBloc loginBloc = LoginBloc();

  LoginDetailsApi loginDetailsApi = LoginDetailsApi();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    FlutterNativeSplash.remove();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: BlocProvider(
        create: (context) => loginBloc,
        child: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              Navigator.push(context, MaterialPageRoute(builder: ((context) {
                return HomeScreen(
                  token: state.loginData.session_token ?? " ",
                );
              })));
            }
            if (state is LoginFailure) {log(state.message);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                  state.message,
                  style: const TextStyle(color: Colors.white, fontSize: 14.0),
                ),
                backgroundColor: Colors.red,
                behavior: SnackBarBehavior.floating,
                margin: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 15.0),
                duration: const Duration(milliseconds: 2000),
              ));
            }
          },
          builder: (context, state) {
            if (state is LoginLoding) {
              return const LoadingIndicator();
            }
            return SafeArea(
                child: Center(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "LOGIN",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color:Colors.black
                              .withOpacity(0.8)),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    //Email Input Field
                    LoginCustomTextFormField(
                      controller: _emailController,
                      textInputType: TextInputType.emailAddress,
                      obscureText: false,
                      width: SizeConfig.blockSizeHorizontal! * 76.38,
                      readOnly: true,
                      label: "Email *",
                    ),

                    const SizedBox(
                      height: 30.0,
                    ),

                    //Password Input Field
                    LoginCustomTextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      textInputType: TextInputType.emailAddress,
                      readOnly: true,
                      height: 40.0,
                      width: SizeConfig.blockSizeHorizontal! * 76.38,
                      label: "Password *",
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                            width: SizeConfig.blockSizeHorizontal! * 76.38,
                            child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    loginBloc.add(LoginCheck(
                                        _emailController.text,
                                        _passwordController.text));
                                  }
                                },
                                child: const Text("Login"))),
                        const SizedBox(
                          height: 5.0,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ));
          },
        ),
      ),
    );
  }
}
