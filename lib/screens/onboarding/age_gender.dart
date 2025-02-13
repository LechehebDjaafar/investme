import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

class AgeGenderScreen extends StatefulWidget {
  @override
  _AgeGenderScreenState createState() => _AgeGenderScreenState();
}


class _AgeGenderScreenState extends State<AgeGenderScreen> {
  int? selectedAge;
  String? selectedGender;

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
              "Tell us about yourself",
              style: GoogleFonts.poppins(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Select your age and gender to continue",
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 40),

            // Age Selector
            Text(
              "Select Age",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            DropdownButton<int>(
              value: selectedAge,
              hint: Text("Choose your age"),
              isExpanded: true,
              items: List.generate(
                100,
                (index) => DropdownMenuItem(
                  value: index + 1,
                  child: Text("${index + 1} years"),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  selectedAge = value;
                });
              },
            ),
            const SizedBox(height: 30),

            // Gender Selector
            Text(
              "Select Gender",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildGenderButton("Male", Icons.male),
                _buildGenderButton("Female", Icons.female),
                _buildGenderButton("Other", Icons.transgender),
              ],
            ),
            const Spacer(),

            // Next Button
            ElevatedButton(
              onPressed: selectedAge != null && selectedGender != null
                  ? () {
                      context.go('/onboarding/role-selection'); // انتقل لشاشة اختيار الدور // انتقل للصفحة التالية
                    }
                  : null, // عطل الزر إذا لم يتم اختيار العمر والجنس
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: const EdgeInsets.symmetric(vertical: 14),
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                "Continue",
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

  Widget _buildGenderButton(String gender, IconData icon) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedGender = gender;
        });
      },
      child: Container(
        width: 90,
        height: 90,
        decoration: BoxDecoration(
          color: selectedGender == gender ? Colors.blueAccent : Colors.grey[200],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: selectedGender == gender ? Colors.white : Colors.black54),
            const SizedBox(height: 5),
            Text(
              gender,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: selectedGender == gender ? Colors.white : Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
