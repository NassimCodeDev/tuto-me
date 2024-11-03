import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../providers/auth_provider.dart';
import 'teachers_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  bool rememberMe = false;

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    if (isLoggedIn) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => TeachersPage()),
      );
    }
  }

  Future<void> _saveLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', rememberMe);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
        child: Center(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: SingleChildScrollView(
              child: Consumer<AuthProvider>(
                builder: (context, authProvider, child) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'مرحباً بك في تطبيق المدرسين!',
                        style: GoogleFonts.cairo(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 24),
                      Text(
                        'يرجى تسجيل الدخول للوصول إلى حسابك',
                        style: GoogleFonts.cairo(
                          fontSize: 16,
                          color: Colors.grey[700],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 32),
                      TextField(
                        controller: emailController,
                        focusNode: emailFocusNode,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        onEditingComplete: () {
                          FocusScope.of(context)
                              .requestFocus(passwordFocusNode);
                        },
                        decoration: InputDecoration(
                          hintText: 'البريد الإلكتروني',
                          hintStyle: GoogleFonts.cairo(fontSize: 14),
                          filled: true,
                          fillColor: Colors.grey[200],
                          contentPadding: EdgeInsets.symmetric(horizontal: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2),
                          ),
                          prefixIcon: Icon(Icons.email, color: Colors.grey),
                        ),
                      ),
                      SizedBox(height: 16),
                      TextField(
                        controller: passwordController,
                        focusNode: passwordFocusNode,
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.done,
                        onEditingComplete: () async {
                          await _login(authProvider);
                        },
                        decoration: InputDecoration(
                          hintText: 'كلمة المرور',
                          hintStyle: GoogleFonts.cairo(fontSize: 14),
                          filled: true,
                          fillColor: Colors.grey[200],
                          contentPadding: EdgeInsets.symmetric(horizontal: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2),
                          ),
                          prefixIcon: Icon(Icons.lock, color: Colors.grey),
                        ),
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            value: rememberMe,
                            onChanged: (value) {
                              setState(() {
                                rememberMe = value ?? false;
                              });
                            },
                          ),
                          Text(
                            'تذكرني',
                            style: GoogleFonts.cairo(fontSize: 14),
                          ),
                        ],
                      ),
                      SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: () async {
                          await _login(authProvider);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black87,
                          padding: EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 0,
                          minimumSize: Size(double.infinity, 48),
                        ),
                        child: Text(
                          'تسجيل الدخول',
                          style: GoogleFonts.cairo(
                              fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _login(AuthProvider authProvider) async {
    await authProvider.login(
      emailController.text,
      passwordController.text,
    );

    if (authProvider.isLoggedIn) {
      await _saveLoginStatus();
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("نجاح", style: GoogleFonts.cairo()),
          content: Text("تم تسجيل الدخول بنجاح!", style: GoogleFonts.cairo()),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => TeachersPage(),
                  ),
                );
              },
              child: Text("موافق", style: GoogleFonts.cairo()),
            ),
          ],
        ),
      );
    } else if (authProvider.errorMessage.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(authProvider.errorMessage, style: GoogleFonts.cairo()),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
