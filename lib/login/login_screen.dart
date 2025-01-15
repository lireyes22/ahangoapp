// ignore_for_file: avoid_print
import 'package:ahangoapp/providers/router_provider.dart';
import 'package:ahangoapp/services/google_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends ConsumerState<LoginScreen> {
  final GoogleAuthService _authService = GoogleAuthService();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Logo de la empresa
                    Image.asset(
                      'assets/images/ahango_logo.png', // Ruta del logo de la empresa
                      height: 120.0, // Tamaño del logo
                    ),
                    const SizedBox(height: 20.0),
                    // Texto "EK-AHAN"
                    Text(
                      'EK-AHAN',
                      style: GoogleFonts.bungee(
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    //Botón de inicio de sesión con Google
                    ElevatedButton.icon(
                      onPressed: () async {
                        
                        setState(() {
                          isLoading = true;
                        });
                        _authService.signInWithGoogle().then((value) {
                          if (value) {
                            setState(() {
                              isLoading = true;
                            });
                            ref.read(appRouterProvider).goNamed('home');
                          }
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 20.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 10,
                      ),
                      icon: Image.asset(
                        'assets/images/logo_google.png',
                        height: 24.0,
                        width: 24.0,
                      ),
                      label: Text(
                        'Iniciar sesión con Google',
                        style: GoogleFonts.bungee(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  void notificationLi(BuildContext context) {
    const snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'On Snap!',
        message:
            'This is an example error message that will be shown in the body of snackbar!',
        contentType: ContentType.success,
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
