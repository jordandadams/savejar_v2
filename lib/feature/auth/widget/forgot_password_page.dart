import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/feature/auth/model/auth_state.dart';
import 'package:flutter_boilerplate/feature/auth/provider/auth_provider.dart';
import 'package:flutter_boilerplate/shared/route/router.gr.dart';
import 'package:flutter_boilerplate/shared/util/validator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../shared/constants/app_theme.dart';

class ForgotPasswordPage extends ConsumerWidget {
  final _emailController = TextEditingController();

  ForgotPasswordPage({Key? key}) : super(key: key);

  //form key validation
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      appBar: AppBar(
        backgroundColor: backgroundColor,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Reset Password',
                  style:
                      GoogleFonts.getFont('Montserrat', textStyle: loginTitle),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Please insert the email associated with your\naccount to receive a password reset link!',
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
                      //email input field
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                        child: TextFormField(
                          controller: _emailController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Email Address',
                            labelStyle: GoogleFonts.getFont(
                              'Montserrat',
                              textStyle: loginEmailText,
                            ),
                            hintText: 'Enter your email...',
                            hintStyle: GoogleFonts.getFont(
                              'Montserrat',
                              textStyle: loginEmailText,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
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
                          style: GoogleFonts.getFont(
                            'Montserrat',
                          ),
                          validator: (value) {
                            Validator.isValidEmail(value);
                            if (Validator.isValidEmail(value) == false) {
                              return 'Please enter a valid email!';
                            }

                            return null;
                          },
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          const SizedBox(height: 15),
                          _widgetForgotPasswordButton(context, ref),
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

  Widget _widgetForgotPasswordButton(BuildContext context, WidgetRef ref) {
    return Container(
      width: 120,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: primaryColor,
      ),
      child: TextButton(
        onPressed: () {},
        child: Text(
          'Send Reset Password Link',
          style: GoogleFonts.getFont('Montserrat', textStyle: loginButtonText),
        ),
      ),
    );
  }
}
