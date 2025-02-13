import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  backgroundColor: Colors.blueAccent, // خلفية زرقاء فاتحة
  body: Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'InvestMe',
          style: GoogleFonts.poppins(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: Colors.white, // نص أبيض
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Welcome to the platform for investors and entrepreneurs!',
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: 18,
            color: Colors.white70, // نص رمادي فاتح
          ),
        ),
        const SizedBox(height: 40),
        ElevatedButton(
          onPressed: () {
            context.go('/onboarding/name');
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white, // زر أبيض
            foregroundColor: Colors.blueAccent, // نص أزرق
          ),
          child: Text(
            'Create Account',
            style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(height: 20),
        TextButton(
          onPressed: () {
            context.go('/login');
          },
          child: Text(
            'Log In',
            style: GoogleFonts.poppins(
              fontSize: 18,
              color: Colors.white, // نص أبيض
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    ),
  ),
);
  }
}