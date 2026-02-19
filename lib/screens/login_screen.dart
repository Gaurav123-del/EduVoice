// import 'package:flutter/material.dart';
// import 'package:edu_voice_main/screens/student/student_dashboard.dart';
// import 'package:edu_voice_main/screens/teacher/teracher_dashboard.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen>
//     with SingleTickerProviderStateMixin {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   late AnimationController _controller;
//   late Animation<double> _fadeIn;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 1),
//     );
//     _fadeIn = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
//     _controller.forward();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   void _handleLogin(String email, String password, BuildContext context) {
//     final userEmail = email.trim().toLowerCase();

//     if (userEmail == 'teacher@gmail.com') {
//       _navigateWithSlide(const TeacherDashboard());
//     } else if (userEmail == 'student@gmail.com') {
//       _navigateWithSlide(const StudentDashboard());
//     } else {
//       showDialog(
//         context: context,
//         builder: (context) => const AlertDialog(
//           title: Text('Invalid Email'),
//           content: Text('Use teacher@gmail.com or student@gmail.com'),
//         ),
//       );
//     }
//   }

//   void _navigateWithSlide(Widget nextPage) {
//     Navigator.pushReplacement(
//       context,
//       PageRouteBuilder(
//         transitionDuration: const Duration(milliseconds: 600),
//         pageBuilder: (context, animation, secondaryAnimation) => nextPage,
//         transitionsBuilder: (context, animation, secondaryAnimation, child) {
//           const begin = Offset(1.0, 0.0);
//           const end = Offset.zero;
//           const curve = Curves.easeInOut;

//           final tween = Tween(
//             begin: begin,
//             end: end,
//           ).chain(CurveTween(curve: curve));
//           final offsetAnimation = animation.drive(tween);

//           return SlideTransition(position: offsetAnimation, child: child);
//         },
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 170, 143, 135),
//       body: SafeArea(
//         child: FadeTransition(
//           opacity: _fadeIn,
//           child: SingleChildScrollView(
//             padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 40),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Image.asset('assets/images/logo.png', width: 70, height: 70),
//                 const SizedBox(height: 8),
//                 const Text(
//                   'EduVoice',
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontFamily: 'TimesNewRoman',
//                     fontWeight: FontWeight.bold,
//                     color: Color.fromARGB(255, 255, 162, 0),
//                   ),
//                 ),
//                 const SizedBox(height: 24),
//                 const Text(
//                   'Nice to see You',
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
//                 ),
//                 const SizedBox(height: 8),
//                 const Text(
//                   'Enter your details to Log into your account',
//                   style: TextStyle(fontSize: 14),
//                 ),
//                 const SizedBox(height: 32),

//                 /// Email
//                 TextField(
//                   controller: _emailController,
//                   decoration: InputDecoration(
//                     hintText: 'email@domain.com',
//                     filled: true,
//                     fillColor: Colors.white,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 16),

//                 /// Password
//                 TextField(
//                   controller: _passwordController,
//                   obscureText: true,
//                   decoration: InputDecoration(
//                     hintText: 'Password',
//                     filled: true,
//                     fillColor: Colors.white,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 24),

//                 /// Continue Button
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       _handleLogin(
//                         _emailController.text.trim(),
//                         _passwordController.text.trim(),
//                         context,
//                       );
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.black,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       padding: const EdgeInsets.symmetric(vertical: 16),
//                     ),
//                     child: const Text(
//                       'Continue',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 18,
//                         letterSpacing: 0.8,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 24),

//                 /// Divider
//                 Row(
//                   children: const [
//                     Expanded(child: Divider(color: Colors.black)),
//                     Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 8),
//                       child: Text('or'),
//                     ),
//                     Expanded(child: Divider(color: Colors.black)),
//                   ],
//                 ),
//                 const SizedBox(height: 24),

//                 /// Google and Apple Button
//                 const SizedBox(height: 20),
//             ElevatedButton.icon(
//               onPressed: () {},
//               icon: const Icon(Icons.g_mobiledata),
//               label: const Text('Continue with Google'),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.white,
//                 foregroundColor: Colors.black,
//                 minimumSize: const Size(double.infinity, 50),
//                 side: const BorderSide(color: Colors.black),
//               ),
//             ),
//             const SizedBox(height: 10),
//             ElevatedButton.icon(
//               onPressed: () {},
//               icon: const Icon(Icons.apple),
//               label: const Text('Continue with Apple'),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.white,
//                 foregroundColor: Colors.black,
//                 minimumSize: const Size(double.infinity, 50),
//                 side: const BorderSide(color: Colors.black),
//               ),
//             ),

//                 /// Terms
//                 const SizedBox(height: 24),
//                  const Text(
//                    'By clicking continue, you agree to our Terms of Service and Privacy Policy',
//                    textAlign: TextAlign.center,
//                    style: TextStyle(fontSize: 12),
//                  )  
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:my_new_app/api/auth_api.dart';
// // Make sure you import your actual AuthApi:

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen>
//     with SingleTickerProviderStateMixin {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController usernameController = TextEditingController();

//   final FlutterSecureStorage secureStorage = FlutterSecureStorage();

//   late AnimationController _controller;
//   late Animation<double> _fadeIn;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 1),
//     );
//     _fadeIn = Tween<double>(
//       begin: 0,
//       end: 1,
//     ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
//     _controller.forward();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   Future<void> handleLogin(
//     String email,
//     String password,
//     String username,
//     BuildContext context,
//   ) async {
//     if (email.isEmpty || password.isEmpty || username.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("❌ All fields are required")),
//       );
//       return;
//     }
//     try {
//       final response = await AuthApi.loginUser(
//         // data sent to the API
//         emailController.text.trim(),
//         passwordController.text.trim(),
//         usernameController.text.trim(),
//       );

//       print(
//         "Status Code: ${response['statusCode']}",
//       ); //this is the reposne after successfull login with status code
//       print(
//         "Full Response Body: ${response['body']}",
//       ); // this is fully response get from the API there is show role token authentication and all.

//       // ✅ Extract token from response['body']
//       final token =
//           response['body']['token']; //save the token in to the variable from the API
//       final role = response['body']['role']; //save role from the API response

//       if (response['statusCode'] == 200) {// this is the main condition where to check when status code == 200 getting from the backend then we will excuted all the navigation to the required routes.
//         await secureStorage.write(key: 'login_token', value: token);
//         await secureStorage.write(key: 'user_role', value: role);
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text("✅ Login Success: ${response['body']['token']}"),
//           ),
//         );

//         if (response['body']['role'] == 'teacher') {
//           //here implemented the functionality navigate according to getting role base from the API after login
//           Navigator.pushNamed(
//             context,
//             "/tdashboard",
//           ); //this is teacher dashboard
//         } else {
//           Navigator.pushNamed(
//             context,
//             "/dashboard",
//           ); // this is student dashboard
//         }
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text("❌ ${response['body']['error']}"),
//           ), //here is throw the erro when you hit the API or send wrong data or all things cover in it
//         );
//       }
//     } catch (e) {
//       // throw the exception error when try internal function not working.
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(SnackBar(content: Text("❌ Login Failed")));
//     }
//   }

//   // void _navigateWithSlide(Widget nextPage) {
//   //   Navigator.pushReplacement(
//   //     context,
//   //     PageRouteBuilder(
//   //       transitionDuration: const Duration(milliseconds: 600),
//   //       pageBuilder: (context, animation, secondaryAnimation) => nextPage,
//   //       transitionsBuilder: (context, animation, secondaryAnimation, child) {
//   //         const begin = Offset(1.0, 0.0);
//   //         const end = Offset.zero;
//   //         const curve = Curves.easeInOut;

//   //         final tween = Tween(
//   //           begin: begin,
//   //           end: end,
//   //         ).chain(CurveTween(curve: curve));
//   //         final offsetAnimation = animation.drive(tween);

//   //         return SlideTransition(position: offsetAnimation, child: child);
//   //       },
//   //     ),
//   //   );
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 170, 143, 135),
//       body: SafeArea(
//         child: FadeTransition(
//           opacity: _fadeIn,
//           child: SingleChildScrollView(
//             padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 40),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Image.asset('assets/images/logo.png', width: 50, height: 50),
//                 const SizedBox(height: 8),
//                 const Text(
//                   'EduVoice',
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black87,
//                   ),
//                 ),
//                 const SizedBox(height: 24),
//                 const Text(
//                   'Nice to see You',
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
//                 ),
//                 const SizedBox(height: 8),
//                 const Text(
//                   'Enter your details to Log into your account',
//                   style: TextStyle(fontSize: 14),
//                 ),
//                 const SizedBox(height: 32),

//                 /// Email
//                 TextField(
//                   controller: emailController,
//                   decoration: InputDecoration(
//                     hintText: 'email@domain.com',
//                     filled: true,
//                     fillColor: Colors.white,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 16),

//                 /// Password
//                 TextField(
//                   controller: passwordController,
//                   obscureText: true,
//                   decoration: InputDecoration(
//                     hintText: 'Password',
//                     filled: true,
//                     fillColor: Colors.white,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 16),

//                 /// Username
//                 TextField(
//                   controller: usernameController,
//                   decoration: InputDecoration(
//                     hintText: 'Username',
//                     filled: true,
//                     fillColor: Colors.white,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                 ),

//                 const SizedBox(height: 24),
//                 // SizedBox(
//                 //   width: double.infinity,
//                 //   child: ElevatedButton(
//                 //     onPressed: () {
//                 //       handleLogin(
//                 //        email,
//                 //         context,
//                 //       );
//                 //     },
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       String email = emailController.text.trim();
//                       String password = passwordController.text.trim();
//                       String username = usernameController.text.trim();

//                       if (email.isEmpty ||
//                           password.isEmpty ||
//                           username.isEmpty) {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(
//                             content: Text("⚠ Please enter email & password"),
//                           ),
//                         );
//                       } else {
//                         handleLogin(
//                           email,
//                           password,
//                           username,
//                           context,
//                         ); // ✅ API Call
//                       }
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.black,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       padding: const EdgeInsets.symmetric(vertical: 16),
//                     ),
//                     child: const Text(
//                       'Continue',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 18,
//                         letterSpacing: 0.8,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 24),
//                 Row(
//                   children: const [
//                     Expanded(child: Divider(color: Colors.black)),
//                     Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 8),
//                       child: Text('or'),
//                     ),
//                     Expanded(child: Divider(color: Colors.black)),
//                   ],
//                 ),
//                 const SizedBox(height: 24),
//                 SizedBox(
//                   width: double.infinity,
//                   child: OutlinedButton.icon(
//                     onPressed: () {},
//                     icon: const Icon(Icons.g_mobiledata, size: 24),
//                     label: const Text('Continue with Google'),
//                     style: OutlinedButton.styleFrom(
//                       padding: const EdgeInsets.symmetric(vertical: 14),
//                       side: const BorderSide(color: Colors.grey),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 24),
//                 const Text(
//                   'By clicking continue, you agree to our Terms of Service and Privacy Policy',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(fontSize: 12),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:edu_voice_main/screens/student/student_dashboard.dart';
// import 'package:edu_voice_main/screens/teacher/teracher_dashboard.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen>
//     with SingleTickerProviderStateMixin {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   late AnimationController _controller;
//   late Animation<double> _fadeIn;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 1),
//     );
//     _fadeIn = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
//     _controller.forward();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   void _handleLogin(String email, String password, BuildContext context) {
//     final userEmail = email.trim().toLowerCase();

//     if (userEmail == 'teacher@gmail.com') {
//       _navigateWithSlide(const TeacherDashboard());
//     } else if (userEmail == 'student@gmail.com') {
//       _navigateWithSlide(const StudentDashboard());
//     } else {
//       showDialog(
//         context: context,
//         builder: (context) => const AlertDialog(
//           title: Text('Invalid Email'),
//           content: Text('Use teacher@gmail.com or student@gmail.com'),
//         ),
//       );
//     }
//   }

//   void _navigateWithSlide(Widget nextPage) {
//     Navigator.pushReplacement(
//       context,
//       PageRouteBuilder(
//         transitionDuration: const Duration(milliseconds: 600),
//         pageBuilder: (context, animation, secondaryAnimation) => nextPage,
//         transitionsBuilder: (context, animation, secondaryAnimation, child) {
//           const begin = Offset(1.0, 0.0);
//           const end = Offset.zero;
//           const curve = Curves.easeInOut;

//           final tween = Tween(
//             begin: begin,
//             end: end,
//           ).chain(CurveTween(curve: curve));
//           final offsetAnimation = animation.drive(tween);

//           return SlideTransition(position: offsetAnimation, child: child);
//         },
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Color(0xFF6A11CB), Color(0xFF2575FC)], // Purple to Blue gradient
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: SafeArea(
//           child: FadeTransition(
//             opacity: _fadeIn,
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 40),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   /// Logo
//                   Image.asset('assets/images/logo.png', width: 80, height: 80),
//                   const SizedBox(height: 12),
//                   const Text(
//                     'EduVoice',
//                     style: TextStyle(
//                       fontSize: 26,
//                       fontFamily: 'TimesNewRoman',
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                       letterSpacing: 1.2,
//                     ),
//                   ),
//                   const SizedBox(height: 30),

//                   /// Welcome
//                   const Text(
//                     'Welcome Back 👋',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 26,
//                       color: Colors.white,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   const Text(
//                     'Log in to continue your learning journey',
//                     style: TextStyle(fontSize: 14, color: Colors.white70),
//                   ),
//                   const SizedBox(height: 40),

//                   /// Email
//                   _buildTextField(_emailController, "Email", Icons.email, false),
//                   const SizedBox(height: 16),

//                   /// Password
//                   _buildTextField(_passwordController, "Password", Icons.lock, true),
//                   const SizedBox(height: 28),

//                   /// Continue Button
//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         _handleLogin(
//                           _emailController.text.trim(),
//                           _passwordController.text.trim(),
//                           context,
//                         );
//                       },
//                       style: ElevatedButton.styleFrom(
//                         padding: const EdgeInsets.symmetric(vertical: 16),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         elevation: 5,
//                         backgroundColor: Colors.transparent,
//                         shadowColor: Colors.black45,
//                       ).copyWith(
//                         backgroundColor: MaterialStateProperty.resolveWith(
//                           (states) => null,
//                         ),
//                       ),
//                       child: Ink(
//                         decoration: BoxDecoration(
//                           gradient: const LinearGradient(
//                             colors: [Color(0xFF43E97B), Color(0xFF38F9D7)], // Green to Cyan gradient
//                           ),
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         child: Container(
//                           alignment: Alignment.center,
//                           padding: const EdgeInsets.symmetric(vertical: 16),
//                           child: const Text(
//                             'Continue',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 18,
//                               letterSpacing: 1,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 24),

//                   /// Divider
//                   Row(
//                     children: const [
//                       Expanded(child: Divider(color: Colors.white70)),
//                       Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 8),
//                         child: Text('or', style: TextStyle(color: Colors.white)),
//                       ),
//                       Expanded(child: Divider(color: Colors.white70)),
//                     ],
//                   ),
//                   const SizedBox(height: 24),

//                   /// Google Button
//                   ElevatedButton.icon(
//                     onPressed: () {},
//                     icon: const Icon(Icons.g_mobiledata, size: 28),
//                     label: const Text('Continue with Google'),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.white,
//                       foregroundColor: Colors.black,
//                       minimumSize: const Size(double.infinity, 50),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 12),

//                   /// Apple Button
//                   ElevatedButton.icon(
//                     onPressed: () {},
//                     icon: const Icon(Icons.apple, size: 28),
//                     label: const Text('Continue with Apple'),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.black,
//                       foregroundColor: Colors.white,
//                       minimumSize: const Size(double.infinity, 50),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                   ),

//                   /// Terms
//                   const SizedBox(height: 30),
//                   const Text(
//                     'By continuing, you agree to our\nTerms of Service & Privacy Policy',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(fontSize: 12, color: Colors.white70),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   /// Reusable Input Field Widget
//   Widget _buildTextField(TextEditingController controller, String hint, IconData icon, bool isPassword) {
//     return TextField(
//       controller: controller,
//       obscureText: isPassword,
//       style: const TextStyle(color: Colors.black),
//       decoration: InputDecoration(
//         hintText: hint,
//         prefixIcon: Icon(icon, color: Colors.blue),
//         filled: true,
//         fillColor: Colors.white,
//         contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: BorderSide.none,
//         ),
//       ),
//     );
//   }

// import 'package:flutter/material.dart';
// import 'package:edu_voice_main/screens/student/student_dashboard.dart';
// import 'package:edu_voice_main/screens/teacher/teracher_dashboard.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen>
//     with SingleTickerProviderStateMixin {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   late AnimationController _controller;
//   late Animation<double> _fadeIn;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 2),
//     );
//     _fadeIn = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
//     _controller.forward();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   void _handleLogin(String email, String password, BuildContext context) {
//     final userEmail = email.trim().toLowerCase();

//     if (userEmail == 'teacher@gmail.com') {
//       _navigateWithSlide(const TeacherDashboard());
//     } else if (userEmail == 'student@gmail.com') {
//       _navigateWithSlide(const StudentDashboard());
//     } else {
//       showDialog(
//         context: context,
//         builder: (context) => const AlertDialog(
//           title: Text('Invalid Email'),
//           content: Text('Use teacher@gmail.com or student@gmail.com'),
//         ),
//       );
//     }
//   }

//   void _navigateWithSlide(Widget nextPage) {
//     Navigator.pushReplacement(
//       context,
//       PageRouteBuilder(
//         transitionDuration: const Duration(milliseconds: 600),
//         pageBuilder: (context, animation, secondaryAnimation) => nextPage,
//         transitionsBuilder: (context, animation, secondaryAnimation, child) {
//           const begin = Offset(1.0, 0.0);
//           const end = Offset.zero;
//           const curve = Curves.easeInOut;

//           final tween = Tween(
//             begin: begin,
//             end: end,
//           ).chain(CurveTween(curve: curve));
//           final offsetAnimation = animation.drive(tween);

//           return SlideTransition(position: offsetAnimation, child: child);
//         },
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Color(0xFF0F2027), Color(0xFF203A43), Color(0xFF2C5364)],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: SafeArea(
//           child: FadeTransition(
//             opacity: _fadeIn,
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 40),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   /// Logo
//                   Hero(
//                     tag: "logo",
//                     child: Image.asset('assets/images/logo.png',
//                         width: 90, height: 90),
//                   ),
//                   const SizedBox(height: 14),
//                   const Text(
//                     'EduVoice',
//                     style: TextStyle(
//                       fontSize: 30,
//                       fontFamily: 'TimesNewRoman',
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                       letterSpacing: 1.5,
//                       shadows: [
//                         Shadow(
//                           offset: Offset(2, 2),
//                           blurRadius: 8,
//                           color: Colors.black45,
//                         )
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 40),

//                   /// Glass Card Container
//                   Container(
//                     padding: const EdgeInsets.all(20),
//                     decoration: BoxDecoration(
//                       color: Colors.white.withOpacity(0.1),
//                       borderRadius: BorderRadius.circular(20),
//                       border: Border.all(color: Colors.white24, width: 1),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.2),
//                           blurRadius: 10,
//                           offset: const Offset(0, 5),
//                         ),
//                       ],
//                     ),
//                     child: Column(
//                       children: [
//                         /// Title
//                         const Text(
//                           'Login to Continue',
//                           style: TextStyle(
//                             fontSize: 20,
//                             color: Colors.white,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                         const SizedBox(height: 20),

//                         /// Email
//                         _buildTextField(
//                           _emailController,
//                           "Email",
//                           Icons.email,
//                           false,
//                         ),
//                         const SizedBox(height: 16),

//                         /// Password
//                         _buildTextField(
//                           _passwordController,
//                           "Password",
//                           Icons.lock,
//                           true,
//                         ),
//                         const SizedBox(height: 28),

//                         /// Continue Button
//                         SizedBox(
//                           width: double.infinity,
//                           child: ElevatedButton(
//                             onPressed: () {
//                               _handleLogin(
//                                 _emailController.text.trim(),
//                                 _passwordController.text.trim(),
//                                 context,
//                               );
//                             },
//                             style: ElevatedButton.styleFrom(
//                               padding:
//                                   const EdgeInsets.symmetric(vertical: 16),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(14),
//                               ),
//                               elevation: 8,
//                               backgroundColor: Colors.transparent,
//                             ),
//                             child: Ink(
//                               decoration: BoxDecoration(
//                                 gradient: const LinearGradient(
//                                   colors: [Color(0xFF43E97B), Color(0xFF38F9D7)],
//                                 ),
//                                 borderRadius: BorderRadius.circular(14),
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.tealAccent.withOpacity(0.6),
//                                     blurRadius: 15,
//                                     offset: const Offset(0, 4),
//                                   ),
//                                 ],
//                               ),
//                               child: Container(
//                                 alignment: Alignment.center,
//                                 padding:
//                                     const EdgeInsets.symmetric(vertical: 16),
//                                 child: const Text(
//                                   'Continue',
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 18,
//                                     letterSpacing: 1,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),

//                   const SizedBox(height: 30),

//                   /// Divider
//                   Row(
//                     children: const [
//                       Expanded(child: Divider(color: Colors.white54)),
//                       Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 8),
//                         child: Text('or',
//                             style: TextStyle(color: Colors.white70)),
//                       ),
//                       Expanded(child: Divider(color: Colors.white54)),
//                     ],
//                   ),
//                   const SizedBox(height: 24),

//                   /// Google Button
//                   _socialButton(
//                     onPressed: () {},
//                     icon: Icons.g_mobiledata,
//                     text: "Continue with Google",
//                     bgColor: Colors.white,
//                     fgColor: Colors.black,
//                   ),
//                   const SizedBox(height: 14),

//                   /// Apple Button
//                   _socialButton(
//                     onPressed: () {},
//                     icon: Icons.apple,
//                     text: "Continue with Apple",
//                     bgColor: Colors.black,
//                     fgColor: Colors.white,
//                   ),

//                   const SizedBox(height: 30),

//                   /// Terms
//                   const Text(
//                     'By continuing, you agree to our\nTerms of Service & Privacy Policy',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(fontSize: 12, color: Colors.white70),
//                   ),

//                   const SizedBox(height: 20),

//                   /// Sign Up Option
//                   GestureDetector(
//                     onTap: () {
//                       // Navigate to signup page
//                     },
//                     child: const Text(
//                       "Don’t have an account? Sign Up",
//                       style: TextStyle(
//                         color: Colors.tealAccent,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   /// Reusable Input Field
//   Widget _buildTextField(
//     TextEditingController controller,
//     String hint,
//     IconData icon,
//     bool isPassword,
//   ) {
//     return TextField(
//       controller: controller,
//       obscureText: isPassword,
//       style: const TextStyle(color: Colors.white),
//       decoration: InputDecoration(
//         hintText: hint,
//         hintStyle: const TextStyle(color: Colors.white70),
//         prefixIcon: Icon(icon, color: Colors.tealAccent),
//         filled: true,
//         fillColor: Colors.white.withOpacity(0.05),
//         contentPadding:
//             const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(14),
//           borderSide: const BorderSide(color: Colors.white30),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(14),
//           borderSide: const BorderSide(color: Colors.tealAccent, width: 1.5),
//         ),
//       ),
//     );
//   }

//   /// Social Login Buttons
//   Widget _socialButton({
//     required VoidCallback onPressed,
//     required IconData icon,
//     required String text,
//     required Color bgColor,
//     required Color fgColor,
//   }) {
//     return ElevatedButton.icon(
//       onPressed: onPressed,
//       icon: Icon(icon, size: 26, color: fgColor),
//       label: Text(
//         text,
//         style: TextStyle(color: fgColor, fontWeight: FontWeight.w600),
//       ),
//       style: ElevatedButton.styleFrom(
//         backgroundColor: bgColor,
//         minimumSize: const Size(double.infinity, 52),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(14),
//         ),
//         elevation: 5,
//         shadowColor: Colors.black26,
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:edu_voice_main/screens/student/student_dashboard.dart';
// import 'package:edu_voice_main/screens/teacher/teracher_dashboard.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen>
//     with SingleTickerProviderStateMixin {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   late AnimationController _controller;
//   late Animation<double> _fadeIn;

//   @override
//   void initState() {
//     super.initState();
//     _controller =
//         AnimationController(vsync: this, duration: const Duration(seconds: 2));
//     _fadeIn = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
//     _controller.forward();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   void _handleLogin(String email, String password, BuildContext context) {
//     final userEmail = email.trim().toLowerCase();

//     if (userEmail == 'teacher@gmail.com') {
//       _navigateWithSlide(const TeacherDashboard());
//     } else if (userEmail == 'student@gmail.com') {
//       _navigateWithSlide(const StudentDashboard());
//     } else {
//       showDialog(
//         context: context,
//         builder: (context) => const AlertDialog(
//           title: Text('Invalid Email'),
//           content: Text('Use teacher@gmail.com or student@gmail.com'),
//         ),
//       );
//     }
//   }

//   void _navigateWithSlide(Widget nextPage) {
//     Navigator.pushReplacement(
//       context,
//       PageRouteBuilder(
//         transitionDuration: const Duration(milliseconds: 700),
//         pageBuilder: (context, animation, secondaryAnimation) => nextPage,
//         transitionsBuilder: (context, animation, secondaryAnimation, child) {
//           final tween = Tween(begin: const Offset(0.0, 1.0), end: Offset.zero)
//               .chain(CurveTween(curve: Curves.easeInOut));
//           return SlideTransition(position: animation.drive(tween), child: child);
//         },
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: AnimatedContainer(
//         duration: const Duration(seconds: 2),
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Color(0xFF4e54c8), Color(0xFF8f94fb)],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: SafeArea(
//           child: FadeTransition(
//             opacity: _fadeIn,
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
//               child: Column(
//                 children: [
//                   const SizedBox(height: 30),

//                   /// Illustration
//                   Hero(
//                     tag: "logo",
//                     child: Image.asset(
//                       'assets/images/logo.png',
//                       width: 100,
//                       height: 100,
//                     ),
//                   ),
//                   const SizedBox(height: 14),
//                   const Text(
//                     "EduVoice",
//                     style: TextStyle(
//                       fontSize: 25,
//                       fontWeight: FontWeight.bold,
//                       letterSpacing: 1.2,
//                       color: Colors.white,
//                     ),
//                   ),
//                   const SizedBox(height: 40),

//                   /// Glass Card
//                   Container(
//                     padding: const EdgeInsets.all(20),
//                     decoration: BoxDecoration(
//                       color: Colors.white.withOpacity(0.1),
//                       borderRadius: BorderRadius.circular(24),
//                       border: Border.all(color: Colors.white24, width: 1),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.25),
//                           blurRadius: 20,
//                           offset: const Offset(0, 10),
//                         ),
//                       ],
//                     ),
//                     child: Column(
//                       children: [
//                         const Text(
//                           "Welcome Back 👋",
//                           style: TextStyle(
//                             fontSize: 22,
//                             fontWeight: FontWeight.w600,
//                             color: Colors.white,
//                           ),
//                         ),
//                         const SizedBox(height: 8),
//                         const Text(
//                           "Login to your account to continue",
//                           style: TextStyle(color: Colors.white70, fontSize: 14),
//                         ),
//                         const SizedBox(height: 24),

//                         /// Email
//                         _buildTextField(
//                           _emailController,
//                           "Email Address",
//                           Icons.email_outlined,
//                           false,
//                         ),
//                         const SizedBox(height: 16),

//                         /// Password
//                         _buildTextField(
//                           _passwordController,
//                           "Password",
//                           Icons.lock_outline,
//                           true,
//                         ),
//                         const SizedBox(height: 28),

//                         /// Gradient Continue Button
//                         GestureDetector(
//                           onTap: () {
//                             _handleLogin(
//                               _emailController.text.trim(),
//                               _passwordController.text.trim(),
//                               context,
//                             );
//                           },
//                           child: Container(
//                             width: double.infinity,
//                             padding: const EdgeInsets.symmetric(vertical: 16),
//                             decoration: BoxDecoration(
//                               gradient: const LinearGradient(
//                                 colors: [Color(0xFF00c6ff), Color(0xFF0072ff)],
//                                 begin: Alignment.centerLeft,
//                                 end: Alignment.centerRight,
//                               ),
//                               borderRadius: BorderRadius.circular(16),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.blueAccent.withOpacity(0.6),
//                                   blurRadius: 15,
//                                   offset: const Offset(0, 4),
//                                 ),
//                               ],
//                             ),
//                             child: const Center(
//                               child: Text(
//                                 "Continue",
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                   letterSpacing: 1,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),

//                   const SizedBox(height: 30),

//                   /// Divider
//                   Row(
//                     children: const [
//                       Expanded(child: Divider(color: Colors.white54)),
//                       Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 8),
//                         child: Text("or",
//                             style: TextStyle(color: Colors.white70)),
//                       ),
//                       Expanded(child: Divider(color: Colors.white54)),
//                     ],
//                   ),
//                   const SizedBox(height: 24),

//                   /// Social Logins
//                   _socialButton(
//                     icon: Icons.g_mobiledata,
//                     text: "Continue with Google",
//                     bgColor: Colors.white,
//                     fgColor: Colors.black,
//                   ),
//                   const SizedBox(height: 14),
//                   _socialButton(
//                     icon: Icons.apple,
//                     text: "Continue with Apple",
//                     bgColor: Colors.black,
//                     fgColor: Colors.white,
//                   ),

//                   const SizedBox(height: 30),

//                   /// Terms & Signup
//                   const Text(
//                     "By continuing, you agree to our\nTerms of Service & Privacy Policy",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(fontSize: 12, color: Colors.white70),
//                   ),
//                   const SizedBox(height: 20),
//                   GestureDetector(
//                     onTap: () {
//                       // Navigate to signup page
//                     },
//                     child: const Text(
//                       "Don’t have an account? Sign Up",
//                       style: TextStyle(
//                         color: Colors.cyanAccent,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   /// Reusable Input Field
//   Widget _buildTextField(
//     TextEditingController controller,
//     String hint,
//     IconData icon,
//     bool isPassword,
//   ) {
//     return TextField(
//       controller: controller,
//       obscureText: isPassword,
//       style: const TextStyle(color: Colors.white),
//       decoration: InputDecoration(
//         hintText: hint,
//         hintStyle: const TextStyle(color: Colors.white54),
//         prefixIcon: Icon(icon, color: Colors.cyanAccent),
//         filled: true,
//         fillColor: Colors.white.withOpacity(0.05),
//         contentPadding:
//             const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(16),
//           borderSide: const BorderSide(color: Colors.white24),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(16),
//           borderSide: const BorderSide(color: Colors.cyanAccent, width: 1.5),
//         ),
//       ),
//     );
//   }

//   /// Reusable Social Button
//   Widget _socialButton({
//     required IconData icon,
//     required String text,
//     required Color bgColor,
//     required Color fgColor,
//   }) {
//     return ElevatedButton.icon(
//       onPressed: () {},
//       icon: Icon(icon, size: 28, color: fgColor),
//       label: Text(
//         text,
//         style: TextStyle(
//           color: fgColor,
//           fontWeight: FontWeight.w600,
//         ),
//       ),
//       style: ElevatedButton.styleFrom(
//         backgroundColor: bgColor,
//         minimumSize: const Size(double.infinity, 52),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(16),
//         ),
//         elevation: 6,
//         shadowColor: Colors.black38,
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:edu_voice_main/screens/student/student_dashboard.dart';
// import 'package:edu_voice_main/screens/teacher/teracher_dashboard.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen>
//     with SingleTickerProviderStateMixin {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   late AnimationController _controller;
//   late Animation<double> _fadeIn;

//   @override
//   void initState() {
//     super.initState();
//     _controller =
//         AnimationController(vsync: this, duration: const Duration(seconds: 2));
//     _fadeIn = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
//     _controller.forward();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   void _handleLogin(String email, String password, BuildContext context) {
//     final userEmail = email.trim().toLowerCase();

//     if (userEmail == 'teacher@gmail.com') {
//       _navigateWithSlide(const TeacherDashboard());
//     } else if (userEmail == 'student@gmail.com') {
//       _navigateWithSlide(const StudentDashboard());
//     } else {
//       showDialog(
//         context: context,
//         builder: (context) => const AlertDialog(
//           title: Text('Invalid Email'),
//           content: Text('Use teacher@gmail.com or student@gmail.com'),
//         ),
//       );
//     }
//   }

//   void _navigateWithSlide(Widget nextPage) {
//     Navigator.pushReplacement(
//       context,
//       PageRouteBuilder(
//         transitionDuration: const Duration(milliseconds: 700),
//         pageBuilder: (context, animation, secondaryAnimation) => nextPage,
//         transitionsBuilder: (context, animation, secondaryAnimation, child) {
//           final tween = Tween(begin: const Offset(0.0, 1.0), end: Offset.zero)
//               .chain(CurveTween(curve: Curves.easeInOut));
//           return SlideTransition(position: animation.drive(tween), child: child);
//         },
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: AnimatedContainer(
//         duration: const Duration(seconds: 2),
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Color(0xFF4e54c8), Color(0xFF8f94fb)],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: SafeArea(
//           child: FadeTransition(
//             opacity: _fadeIn,
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
//               child: Column(
//                 children: [
//                   const SizedBox(height: 30),

//                   /// Illustration / Logo
//                   Hero(
//                     tag: "logo",
//                     child: Image.asset(
//                       'assets/images/logo.png',
//                       width: 120,
//                       height: 120,
//                     ),
//                   ),
//                   const SizedBox(height: 14),
//                   const Text(
//                     "EduVoice",
//                     style: TextStyle(
//                       fontSize: 32,
//                       fontWeight: FontWeight.bold,
//                       letterSpacing: 1.2,
//                       color: Colors.white,
//                     ),
//                   ),
//                   const SizedBox(height: 40),

//                   /// Glass Card
//                   Container(
//                     padding: const EdgeInsets.all(20),
//                     decoration: BoxDecoration(
//                       color: Colors.white.withOpacity(0.1),
//                       borderRadius: BorderRadius.circular(24),
//                       border: Border.all(color: Colors.white24, width: 1),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.25),
//                           blurRadius: 20,
//                           offset: const Offset(0, 10),
//                         ),
//                       ],
//                     ),
//                     child: Column(
//                       children: [
//                         const Text(
//                           "Welcome Back 👋",
//                           style: TextStyle(
//                             fontSize: 22,
//                             fontWeight: FontWeight.w600,
//                             color: Colors.white,
//                           ),
//                         ),
//                         const SizedBox(height: 8),
//                         const Text(
//                           "Login to your account to continue",
//                           style: TextStyle(color: Colors.white70, fontSize: 14),
//                         ),
//                         const SizedBox(height: 24),

//                         /// Email
//                         _buildTextField(
//                           _emailController,
//                           "Email Address",
//                           Icons.email_outlined,
//                           false,
//                         ),
//                         const SizedBox(height: 16),

//                         /// Password
//                         _buildTextField(
//                           _passwordController,
//                           "Password",
//                           Icons.lock_outline,
//                           true,
//                         ),
//                         const SizedBox(height: 28),

//                         /// Gradient Continue Button
//                         GestureDetector(
//                           onTap: () {
//                             _handleLogin(
//                               _emailController.text.trim(),
//                               _passwordController.text.trim(),
//                               context,
//                             );
//                           },
//                           child: Container(
//                             width: double.infinity,
//                             padding: const EdgeInsets.symmetric(vertical: 16),
//                             decoration: BoxDecoration(
//                               gradient: const LinearGradient(
//                                 colors: [Color(0xFF00c6ff), Color(0xFF0072ff)],
//                                 begin: Alignment.centerLeft,
//                                 end: Alignment.centerRight,
//                               ),
//                               borderRadius: BorderRadius.circular(16),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.blueAccent.withOpacity(0.6),
//                                   blurRadius: 15,
//                                   offset: const Offset(0, 4),
//                                 ),
//                               ],
//                             ),
//                             child: const Center(
//                               child: Text(
//                                 "Continue",
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                   letterSpacing: 1,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),

//                   const SizedBox(height: 30),

//                   /// Divider
//                   Row(
//                     children: const [
//                       Expanded(child: Divider(color: Colors.white54)),
//                       Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 8),
//                         child: Text("or",
//                             style: TextStyle(color: Colors.white70)),
//                       ),
//                       Expanded(child: Divider(color: Colors.white54)),
//                     ],
//                   ),
//                   const SizedBox(height: 24),

//                   /// Social Logins
//                   _socialButton(
//                     icon: Icons.g_mobiledata,
//                     text: "Continue with Google",
//                     bgColor: Colors.white,
//                     fgColor: Colors.black,
//                   ),
//                   const SizedBox(height: 14),
//                   _socialButton(
//                     icon: Icons.apple,
//                     text: "Continue with Apple",
//                     bgColor: Colors.black,
//                     fgColor: Colors.white,
//                   ),

//                   const SizedBox(height: 30),

//                   /// Terms only
//                   const Text(
//                     "By continuing, you agree to our\nTerms of Service & Privacy Policy",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(fontSize: 12, color: Colors.white70),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   /// Reusable Input Field
//   Widget _buildTextField(
//     TextEditingController controller,
//     String hint,
//     IconData icon,
//     bool isPassword,
//   ) {
//     return TextField(
//       controller: controller,
//       obscureText: isPassword,
//       style: const TextStyle(color: Colors.white),
//       decoration: InputDecoration(
//         hintText: hint,
//         hintStyle: const TextStyle(color: Colors.white54),
//         prefixIcon: Icon(icon, color: Colors.cyanAccent),
//         filled: true,
//         fillColor: Colors.white.withOpacity(0.05),
//         contentPadding:
//             const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(16),
//           borderSide: const BorderSide(color: Colors.white24),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(16),
//           borderSide: const BorderSide(color: Colors.cyanAccent, width: 1.5),
//         ),
//       ),
//     );
//   }

//   /// Reusable Social Button
//   Widget _socialButton({
//     required IconData icon,
//     required String text,
//     required Color bgColor,
//     required Color fgColor,
//   }) {
//     return ElevatedButton.icon(
//       onPressed: () {},
//       icon: Icon(icon, size: 28, color: fgColor),
//       label: Text(
//         text,
//         style: TextStyle(
//           color: fgColor,
//           fontWeight: FontWeight.w600,
//         ),
//       ),
//       style: ElevatedButton.styleFrom(
//         backgroundColor: bgColor,
//         minimumSize: const Size(double.infinity, 52),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(16),
//         ),
//         elevation: 6,
//         shadowColor: Colors.black38,
//       ),
//     );
//   }
// }





import 'package:flutter/material.dart';
import 'package:edu_voice_main/screens/student/student_dashboard.dart';
import 'package:edu_voice_main/screens/teacher/teracher_dashboard.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late AnimationController _controller;
  late Animation<double> _fadeIn;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _fadeIn = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin(String email, String password, BuildContext context) {
    final userEmail = email.trim().toLowerCase();

    if (userEmail == 't') {
      _navigateWithSlide(const TeacherDashboard());
    } else if (userEmail == 's') {
      _navigateWithSlide(const StudentDashboard());
    } else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text('Invalid Email'),
          content: Text('Use teacher@gmail.com or student@gmail.com'),
        ),
      );
    }
  }

  void _navigateWithSlide(Widget nextPage) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 700),
        pageBuilder: (context, animation, secondaryAnimation) => nextPage,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final tween = Tween(begin: const Offset(0.0, 1.0), end: Offset.zero)
              .chain(CurveTween(curve: Curves.easeInOut));
          return SlideTransition(position: animation.drive(tween), child: child);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(seconds: 2),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFB923C), Color(0xFF0077B6)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: FadeTransition(
            opacity: _fadeIn,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
              child: Column(
                children: [
                  const SizedBox(height: 30),

                  /// Logo
                  Hero(
                    tag: "logo",
                    child: Image.asset(
                      'assets/images/logo.png',
                      width: 120,
                      height: 120,
                    ),
                  ),
                  const SizedBox(height: 14),
                  const Text(
                    "EduVoice",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                      color: Color(0xFFFF9800),
                    ),
                  ),
                  const SizedBox(height: 40),

                  /// Glass Card
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: Colors.white24, width: 1),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        const Text(
                          "Welcome Back 👋",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Login to your account to continue",
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                        const SizedBox(height: 24),

                        /// Email
                        _buildTextField(
                          _emailController,
                          "Email Address",
                          Icons.email_outlined,
                          false,
                        ),
                        const SizedBox(height: 16),

                        /// Password
                        _buildTextField(
                          _passwordController,
                          "Password",
                          Icons.lock_outline,
                          true,
                        ),
                        const SizedBox(height: 28),

                        /// Orange + Blue Gradient Button
                        GestureDetector(
                          onTap: () {
                            _handleLogin(
                              _emailController.text.trim(),
                              _passwordController.text.trim(),
                              context,
                            );
                          },
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xFFFF6F00), // Deep Orange
                                  Color(0xFF0D47A1), // Strong Blue
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.orangeAccent.withOpacity(0.6),
                                  blurRadius: 15,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: const Center(
                              child: Text(
                                "Continue",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  /// Divider
                  Row(
                    children: const [
                      Expanded(child: Divider(color: Colors.white54)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Text("or",
                            style: TextStyle(color: Colors.white70)),
                      ),
                      Expanded(child: Divider(color: Colors.white54)),
                    ],
                  ),
                  const SizedBox(height: 24),

                  /// Social Logins
                  _socialButton(
                    icon: Icons.g_mobiledata,
                    text: "Continue with Google",
                    bgColor: Colors.white,
                    fgColor: Colors.black,
                  ),
                  const SizedBox(height: 14),
                  _socialButton(
                    icon: Icons.apple,
                    text: "Continue with Apple",
                    bgColor: Colors.black,
                    fgColor: Colors.white,
                  ),

                  const SizedBox(height: 30),

                  /// Terms
                  const Text(
                    "By continuing, you agree to our\nTerms of Service & Privacy Policy",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, color: Colors.white70),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Reusable Input Field
  Widget _buildTextField(
    TextEditingController controller,
    String hint,
    IconData icon,
    bool isPassword,
  ) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white54),
        prefixIcon: Icon(icon, color: Colors.orangeAccent),
        filled: true,
        fillColor: Colors.white.withOpacity(0.05),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.white24),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.orangeAccent, width: 1.5),
        ),
      ),
    );
  }

  /// Reusable Social Button
  Widget _socialButton({
    required IconData icon,
    required String text,
    required Color bgColor,
    required Color fgColor,
  }) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(icon, size: 28, color: fgColor),
      label: Text(
        text,
        style: TextStyle(
          color: fgColor,
          fontWeight: FontWeight.w600,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        minimumSize: const Size(double.infinity, 52),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 6,
        shadowColor: Colors.black38,
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:edu_voice_main/screens/student/student_dashboard.dart';
// import 'package:edu_voice_main/screens/teacher/teracher_dashboard.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen>
//     with SingleTickerProviderStateMixin {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   late AnimationController _controller;
//   late Animation<double> _fadeIn;

//   @override
//   void initState() {
//     super.initState();
//     _controller =
//         AnimationController(vsync: this, duration: const Duration(seconds: 2));
//     _fadeIn = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
//     _controller.forward();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   void _handleLogin(String email, String password, BuildContext context) {
//     final userEmail = email.trim().toLowerCase();

//     if (userEmail == 't') {
//       _navigateWithSlide(const TeacherDashboard());
//     } else if (userEmail == 's') {
//       _navigateWithSlide(const StudentDashboard());
//     } else {
//       showDialog(
//         context: context,
//         builder: (context) => const AlertDialog(
//           title: Text('Invalid Email'),
//           content: Text('Use teacher@gmail.com or student@gmail.com'),
//         ),
//       );
//     }
//   }

//   void _navigateWithSlide(Widget nextPage) {
//     Navigator.pushReplacement(
//       context,
//       PageRouteBuilder(
//         transitionDuration: const Duration(milliseconds: 700),
//         pageBuilder: (context, animation, secondaryAnimation) => nextPage,
//         transitionsBuilder: (context, animation, secondaryAnimation, child) {
//           final tween = Tween(begin: const Offset(0.0, 1.0), end: Offset.zero)
//               .chain(CurveTween(curve: Curves.easeInOut));
//           return SlideTransition(position: animation.drive(tween), child: child);
//         },
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF5F5F5), // Light Grey Background
//       body: SafeArea(
//         child: FadeTransition(
//           opacity: _fadeIn,
//           child: SingleChildScrollView(
//             padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
//             child: Column(
//               children: [
//                 const SizedBox(height: 30),

//                 /// LOGO
//                 Hero(
//                   tag: "logo",
//                   child: Image.asset(
//                     'assets/images/logo.png',
//                     width: 180,
//                     height: 180,
//                   ),
//                 ),
//                 const SizedBox(height: 14),

//                 const Text(
//                   "EduVoice",
//                   style: TextStyle(
//                     fontSize: 30,
//                     fontWeight: FontWeight.bold,
//                     color: Color.fromARGB(221, 120, 115, 115),
//                   ),
//                 ),

//                 const SizedBox(height: 40),

//                 /// WHITE CARD
//                 Container(
//                   padding: const EdgeInsets.all(22),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(24),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.08),
//                         blurRadius: 20,
//                         offset: const Offset(0, 8),
//                       ),
//                     ],
//                   ),
//                   child: Column(
//                     children: [
//                       const Text(
//                         "Welcome Back 👋",
//                         style: TextStyle(
//                           fontSize: 22,
//                           fontWeight: FontWeight.w600,
//                           color: Color.fromARGB(221, 120, 115, 115),
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                       const Text(
//                         "Login to your account to continue",
//                         style: TextStyle(color: Colors.black54),
//                       ),
//                       const SizedBox(height: 24),

//                       _buildTextField(
//                         _emailController,
//                         "Email Address",
//                         Icons.email_outlined,
//                         false,
//                       ),
//                       const SizedBox(height: 16),

//                       _buildTextField(
//                         _passwordController,
//                         "Password",
//                         Icons.lock_outline,
//                         true,
//                       ),
//                       const SizedBox(height: 28),

//                       /// GREY BUTTON
//                       GestureDetector(
//                         onTap: () {
//                           _handleLogin(
//                             _emailController.text.trim(),
//                             _passwordController.text.trim(),
//                             context,
//                           );
//                         },
//                         child: Container(
//                           width: double.infinity,
//                           padding: const EdgeInsets.symmetric(vertical: 16),
//                           decoration: BoxDecoration(
//                             gradient: const LinearGradient(
//                               colors: [
//                                 Color(0xFFBDBDBD),
//                                 Color(0xFF616161),
//                               ],
//                             ),
//                             borderRadius: BorderRadius.circular(16),
//                           ),
//                           child: const Center(
//                             child: Text(
//                               "Continue",
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),

//                 const SizedBox(height: 30),

//                 Row(
//                   children: const [
//                     Expanded(child: Divider(color: Colors.black26)),
//                     Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 8),
//                       child: Text("or",
//                           style: TextStyle(color: Colors.black54)),
//                     ),
//                     Expanded(child: Divider(color: Colors.black26)),
//                   ],
//                 ),

//                 const SizedBox(height: 24),

//                 _socialButton(
//                   icon: Icons.g_mobiledata,
//                   text: "Continue with Google",
//                   bgColor: Colors.white,
//                   fgColor: Colors.black,
//                 ),
//                 const SizedBox(height: 14),
//                 _socialButton(
//                   icon: Icons.apple,
//                   text: "Continue with Apple",
//                   bgColor: Colors.black,
//                   fgColor: Colors.white,
//                 ),

//                 const SizedBox(height: 30),

//                 const Text(
//                   "By continuing, you agree to our\nTerms of Service & Privacy Policy",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(fontSize: 12, color: Colors.black54),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   /// INPUT FIELD (GREY STYLE)
//   Widget _buildTextField(
//     TextEditingController controller,
//     String hint,
//     IconData icon,
//     bool isPassword,
//   ) {
//     return TextField(
//       controller: controller,
//       obscureText: isPassword,
//       decoration: InputDecoration(
//         hintText: hint,
//         prefixIcon: Icon(icon, color: Colors.grey),
//         filled: true,
//         fillColor: const Color(0xFFF1F1F1),
//         contentPadding:
//             const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(16),
//           borderSide: BorderSide.none,
//         ),
//       ),
//     );
//   }

//   Widget _socialButton({
//     required IconData icon,
//     required String text,
//     required Color bgColor,
//     required Color fgColor,
//   }) {
//     return ElevatedButton.icon(
//       onPressed: () {},
//       icon: Icon(icon, size: 28, color: fgColor),
//       label: Text(
//         text,
//         style: TextStyle(color: fgColor, fontWeight: FontWeight.w600),
//       ),
//       style: ElevatedButton.styleFrom(
//         backgroundColor: bgColor,
//         minimumSize: const Size(double.infinity, 52),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(16),
//         ),
//         elevation: 3,
//       ),
//     );
//   }
// }
