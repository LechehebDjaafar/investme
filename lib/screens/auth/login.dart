import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login(BuildContext context) {
    if (_emailController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
      // الانتقال إلى الصفحة الرئيسية بعد تسجيل الدخول
      context.go('/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E2A47), // خلفية أزرق داكن
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            Text(
              "Welcome back!",
              style: GoogleFonts.poppins(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white, // نص أبيض
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Sign in to continue to InvestMe.",
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.white70, // نص رمادي فاتح
              ),
            ),
            const SizedBox(height: 40),
            // حقل البريد الإلكتروني
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(color: Colors.white), // نص أبيض
              decoration: InputDecoration(
                labelText: "Email",
                labelStyle: TextStyle(color: Colors.white70), // نص رمادي فاتح
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white54), // حدود رمادية
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: const Color(0xFF4A90E2)), // حدود زرقاء فاتحة
                ),
              ),
            ),
            const SizedBox(height: 15),
            // حقل كلمة المرور
            TextField(
              controller: _passwordController,
              obscureText: true,
              style: TextStyle(color: Colors.white), // نص أبيض
              decoration: InputDecoration(
                labelText: "Password",
                labelStyle: TextStyle(color: Colors.white70), // نص رمادي فاتح
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white54), // حدود رمادية
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: const Color(0xFF4A90E2)), // حدود زرقاء فاتحة
                ),
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // يمكنك إضافة صفحة استعادة كلمة المرور لاحقًا
                },
                child: Text(
                  "Forgot Password?",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: const Color(0xFFF4B400), // نص ذهبي
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            // زر تسجيل الدخول
            ElevatedButton(
              onPressed: () => _login(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF4B400), // زر ذهبي
                foregroundColor: Colors.white, // نص أبيض
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                "Sign In",
                style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
            const Spacer(),
            // الخيار للتسجيل إذا لم يكن لديك حساب
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account? ",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.white70, // نص رمادي فاتح
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // الانتقال إلى شاشة التسجيل
                    context.go('/onboarding/name');
                  },
                  child: Text(
                    "Create Account",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: const Color(0xFFF4B400), // نص ذهبي
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}