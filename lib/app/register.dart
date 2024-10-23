import 'package:flutter/material.dart';
import 'dashboard.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white, // Warna latar belakang kotak
                borderRadius: BorderRadius.circular(16), // Sudut kotak
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2), // Warna bayangan
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: Offset(0, 3), // Posisi bayangan
                  ),
                ],
              ),
              padding: EdgeInsets.all(20), // Padding dalam kotak
              width:
                  double.infinity, // Memperpanjang kotak ke seluruh lebar layar
              constraints: BoxConstraints(
                minHeight:
                    400, // Menetapkan minimum tinggi kotak agar lebih panjang
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Ilustrasi kartun login di bagian atas
                  Image.asset(
                    'assets/login.png', // Tambahkan gambar ilustrasi login 2D
                    height: 150,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Create an Account',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Please enter your phone number to get started',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: phoneController,
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      labelStyle: TextStyle(color: Colors.green),
                      hintText: 'e.g. +62 812 3456 7890',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.green, width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    keyboardType: TextInputType.phone,
                    cursorColor: Colors.green,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to dashboard when button is pressed
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DashboardPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                    ),
                    child: Text(
                      'Register',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      backgroundColor:
          Colors.grey[200], // Warna latar belakang luar lebih terang
    );
  }
}
