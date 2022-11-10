import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/feature/auth/model/auth_state.dart';
import 'package:flutter_boilerplate/feature/auth/provider/auth_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/constants/app_theme.dart';

class SignUpPage extends ConsumerWidget {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  //form key validation
  final _formKey = GlobalKey<FormState>();

  SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var mediaHeight = MediaQuery.of(context).size * 1;
    var mediaWidth = MediaQuery.of(context).size * 1;
    ref.listen(authProvider, (previous, next) {
      if (next is AuthState) {
        next.maybeWhen(
          loggedIn: () {
            context.router.popUntilRoot();
          },
          orElse: () {
            {}
          },
        );
      }
    });

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 24, 0, 20),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Center(
                          child: Image.asset(
                            primaryLogoString,
                            height: 85,
                            width: 85,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  'Create Account!',
                  style:
                      GoogleFonts.getFont('Montserrat', textStyle: loginTitle),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Become a part of the SaveJar family!',
                        style: GoogleFonts.getFont('Montserrat',
                            textStyle: loginSecondaryTitle),
                      ),
                    ],
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      //name input field
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: TextFormField(
                          controller: _nameController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Full Name',
                            labelStyle: GoogleFonts.getFont('Montserrat',
                                textStyle: loginEmailText),
                            hintText: 'Enter full name...',
                            hintStyle: GoogleFonts.getFont('Montserrat',
                                textStyle: loginEmailText),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: primaryColor,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.red,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding:
                                const EdgeInsetsDirectional.fromSTEB(
                                    20, 24, 20, 24),
                          ),
                          style: GoogleFonts.getFont('Montserrat'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter Full Name';
                            }

                            return null;
                          },
                        ),
                      ),
                      //email input field
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: TextFormField(
                          controller: _emailController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: GoogleFonts.getFont('Montserrat',
                                textStyle: loginEmailText),
                            hintText: 'Enter email...',
                            hintStyle: GoogleFonts.getFont('Montserrat',
                                textStyle: loginEmailText),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: primaryColor,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.red,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.red,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding:
                                const EdgeInsetsDirectional.fromSTEB(
                                    20, 24, 20, 24),
                          ),
                          style: GoogleFonts.getFont('Montserrat'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter Email';
                            }

                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: TextFormField(
                          controller: _passwordController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: GoogleFonts.getFont('Montserrat',
                                textStyle: loginEmailText),
                            hintText: 'Enter password...',
                            hintStyle: GoogleFonts.getFont('Montserrat',
                                textStyle: loginEmailText),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: primaryColor,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.red,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.red,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding:
                                const EdgeInsetsDirectional.fromSTEB(
                                    20, 24, 20, 24),
                          ),
                          style: GoogleFonts.getFont('Montserrat'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter Password';
                            }

                            return null;
                          },
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          const SizedBox(height: 30),
                          _widgetSignUpButton(context, ref),
                          const SizedBox(height: 15),
                          Text(
                            'Already a user?',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.getFont(
                              'Montserrat',
                              textStyle: loginSecondaryTitle,
                            ),
                          ),
                          const SizedBox(height: 15),
                          _widgetSignInButton(context, ref),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _widgetSignInButton(BuildContext context, WidgetRef ref) {
    return Container(
      width: 120,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: primaryColor,
      ),
      child: TextButton(
        onPressed: () {
          context.router.pop();
        },
        child: Text(
          'Sign in',
          style: GoogleFonts.getFont('Montserrat', textStyle: loginButtonText),
        ),
      ),
    );
  }

  Widget _widgetSignUpButton(BuildContext context, WidgetRef ref) {
    return Container(
      width: 120,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: primaryColor,
      ),
      child: TextButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            ref.read(authProvider.notifier).signUp(
                  _nameController.text,
                  _emailController.text,
                  _passwordController.text,
                );
          }
        },
        child: Text(
          'Sign up',
          style: GoogleFonts.getFont('Montserrat', textStyle: loginButtonText),
        ),
      ),
    );
  }
}
