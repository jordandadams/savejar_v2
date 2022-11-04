import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/feature/auth/provider/auth_provider.dart';
import 'package:flutter_boilerplate/l10n/l10n.dart';
import 'package:flutter_boilerplate/shared/route/router.gr.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../shared/constants/app_theme.dart';

/*Center(
                              child: Image.asset(
                                testLogoString,
                                height: 85,
                                width: 85,
                              ),
                            ),*/

class SignInPage extends ConsumerWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordLoginVisibilityProvider = StateProvider<bool>((ref) => true);

  SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool _passwordLoginVisibility = ref.watch(_passwordLoginVisibilityProvider);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 1,
                    /*decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: primaryLogoTrans,
                      ),
                    ),*/
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 20),
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
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Welcome Back!',
                                        style: GoogleFonts.getFont('Montserrat', textStyle: loginTitle),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'Login to access your account below!',
                                          style: GoogleFonts.getFont('Montserrat', textStyle: loginSecondaryTitle),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                    child: TextFormField(
                                      controller: _emailController,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Email Address',
                                        labelStyle: GoogleFonts.getFont('Montserrat', textStyle: loginEmailText),
                                        hintText: 'Enter your email...',
                                        hintStyle: GoogleFonts.getFont('Montserrat', textStyle: loginEmailText),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: primaryColor,
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
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
                                        contentPadding: EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                                      ),
                                      style: GoogleFonts.getFont('Montserrat'),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                                    child: TextFormField(
                                      controller: _passwordController,
                                      obscureText: _passwordLoginVisibility,
                                      decoration: InputDecoration(
                                        labelText: 'Password',
                                        labelStyle: GoogleFonts.getFont('Montserrat', textStyle: loginEmailText),
                                        hintText: 'Enter your password...',
                                        hintStyle: GoogleFonts.getFont('Montserrat', textStyle: loginEmailText),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: primaryColor,
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
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
                                        contentPadding: EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                                        suffixIcon: InkWell(
                                          onTap: () => ref.read(_passwordLoginVisibilityProvider.state).state = false,
                                          focusNode: FocusNode(skipTraversal: true),
                                          child: Icon(
                                            _passwordLoginVisibility
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined,
                                            color: Colors.black,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                      style: GoogleFonts.getFont('Montserrat'),
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 24),
                                        child: _widgetForgotPasswordButton(context, ref),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 24),
                                        child: _widgetLoginButton(context, ref),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _widgetForgotPasswordButton(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 190,
      height: 25,
      child: InkWell(
        onTap: () => {
          context.router.push(SignUpRoute())
        },
        child: Text('Forgot Password?', style: GoogleFonts.getFont('Montserrat', textStyle: forgotPasswordText),),
      ),
    );
  }

  Widget _widgetLoginButton(BuildContext context, WidgetRef ref) {
    return Container(
      width: 120,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: primaryColor
      ),
      child: TextButton(
        onPressed: () {
          ref
              .read(authProvider.notifier)
              .login(_emailController.text, _passwordController.text);
        },
        child: Text('Login', style: GoogleFonts.getFont('Montserrat', textStyle: loginButtonText),),
      ),
    );
  }
}