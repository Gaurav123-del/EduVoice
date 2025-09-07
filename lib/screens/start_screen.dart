import 'package:flutter/material.dart';
import 'login_Screen.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeIn;
  late Animation<Offset> _slideUp;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    );

    _fadeIn = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _slideUp = Tween<Offset>(begin: const Offset(0, 0.2), end: Offset.zero)
        .animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// ✅ Slide transition for Get Started
  void _navigateToLogin() {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (_, __, ___) => const LoginScreen(),
        transitionsBuilder: (_, animation, __, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.easeInOut;

          var tween = Tween(begin: begin, end: end).chain(
            CurveTween(curve: curve),
          );
          return SlideTransition(position: animation.drive(tween), child: child);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // ✅ Background image
          Image.asset(
            'assets/images/bg.png',
            fit: BoxFit.cover,
          ),

          // ✅ Overlay
          Container(
            color: Colors.black.withAlpha(128),
          ),

          SafeArea(
            child: FadeTransition(
              opacity: _fadeIn,
              child: SlideTransition(
                position: _slideUp,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // ✅ Logo
                    Container(
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black45,
                            blurRadius: 20,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: Image.asset(
                        'assets/images/logo.png',
                        width: 120,
                        height: 120,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // ✅ App name
                    const AnimatedDefaultTextStyle(
                      duration: Duration(milliseconds: 800),
                      style: TextStyle(
                        fontSize: 34,
                        fontFamily: 'TimesNewRoman',
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 215, 0),
                        letterSpacing: 1.2,
                      ),
                      child: Text('EduVoice'),
                    ),
                    const SizedBox(height: 20),

                    // ✅ Tagline
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32.0),
                      child: AnimatedDefaultTextStyle(
                        duration: Duration(milliseconds: 800),
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'TimesNewRoman',
                          color: Colors.white,
                          height: 1.4,
                        ),
                        child: Text(
                          '“Revisit your school lectures anytime with our easy-to-use app.”',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(height: 60),

                    // ✅ Get Started Button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _navigateToLogin,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            elevation: 6,
                          ),
                          child: const Text(
                            'Get Started',
                            style: TextStyle(
                              fontFamily: 'TimesNewRoman',
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.8,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
