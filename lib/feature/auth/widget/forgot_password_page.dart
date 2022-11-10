import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/feature/auth/model/auth_state.dart';
import 'package:flutter_boilerplate/feature/auth/provider/auth_provider.dart';
import 'package:flutter_boilerplate/shared/route/router.gr.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../shared/constants/app_theme.dart';

class ForgotPasswordPage extends ConsumerWidget {
  final _passwordController = TextEditingController();
  final passwordLoginVisibilityProvider = StateProvider<bool>((ref) => false);

  ForgotPasswordPage({Key? key}) : super(key: key);

  //form key validation
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool passwordLoginVisibility = ref.watch(passwordLoginVisibilityProvider);
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
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 200, 0, 10),
                  child: Text(
                    'Reset Password',
                    style: GoogleFonts.getFont('Montserrat',
                        textStyle: loginTitle),
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      //password input field
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                        child: TextFormField(
                          controller: _passwordController,
                          obscureText: passwordLoginVisibility,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: GoogleFonts.getFont(
                              'Montserrat',
                              textStyle: loginEmailText,
                            ),
                            hintText: 'Enter your password...',
                            hintStyle: GoogleFonts.getFont(
                              'Montserrat',
                              textStyle: loginEmailText,
                            ),
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
                            suffixIcon: InkWell(
                              onTap: () => ref
                                  .read(
                                    passwordLoginVisibilityProvider.state,
                                  )
                                  .state = false,
                              focusNode: FocusNode(skipTraversal: true),
                              child: Icon(
                                passwordLoginVisibility
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color: Colors.black,
                                size: 20,
                              ),
                            ),
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
          'Reset Password',
          style: GoogleFonts.getFont('Montserrat', textStyle: loginButtonText),
        ),
      ),
    );
  }
}
