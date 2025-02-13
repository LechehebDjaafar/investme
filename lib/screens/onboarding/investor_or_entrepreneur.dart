import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

class InvestorOrEntrepreneurScreen extends StatefulWidget {
  @override
  _InvestorOrEntrepreneurScreenState createState() =>
      _InvestorOrEntrepreneurScreenState();
}

class _InvestorOrEntrepreneurScreenState
    extends State<InvestorOrEntrepreneurScreen> {
  String? selectedRole;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            Text(
              "Choose your role",
              style: GoogleFonts.poppins(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Are you an investor or an entrepreneur?",
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 40),

            // Role Selection
            _buildRoleButton("Investor", Icons.trending_up),
            const SizedBox(height: 20),
            _buildRoleButton("Entrepreneur", Icons.business_center),
            const Spacer(),

            // Register Button
            ElevatedButton(
              onPressed: selectedRole != null
                  ? () {
                      // انتقل للصفحة الرئيسية بعد التسجيل
                      context.go('/home');
                    }
                  : null, // عطل الزر إذا لم يتم اختيار الدور
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: const EdgeInsets.symmetric(vertical: 14),
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                "Register",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildRoleButton(String role, IconData icon) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedRole = role;
        });
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 18),
        decoration: BoxDecoration(
          color: selectedRole == role ? Colors.blueAccent : Colors.grey[200],
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: selectedRole == role ? Colors.blueAccent : Colors.transparent,
            width: 2,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 30,
              color: selectedRole == role ? Colors.white : Colors.black54,
            ),
            const SizedBox(width: 10),
            Text(
              role,
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: selectedRole == role ? Colors.white : Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
