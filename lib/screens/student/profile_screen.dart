// import 'package:flutter/material.dart';

// import 'sprofile/my_profile_screen.dart';
// import 'sprofile/change_password_screen.dart';
// import 'sprofile/attendance_screen.dart';
// import 'package:edu_voice_main/screens/login_Screen.dart';
// import 'sprofile/my_courses_screen.dart';
// import 'sprofile/fee_status_screen.dart';
// import 'sprofile/help_support_screen.dart';

// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF2F5F8),
//       appBar: AppBar(
//         title: const Text('My Profile'),
//         elevation: 0,
//         flexibleSpace: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               colors: [Color(0xFF2196F3), Color(0xFF21CBF3)],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             // ✅ Avatar
//             CircleAvatar(
//               radius: 50,
//               backgroundImage: const AssetImage(
//                 'assets/images/profile_placeholder.png',
//               ),
//               backgroundColor: Colors.grey[300],
//             ),
//             const SizedBox(height: 12),
//             const Text(
//               'Gaurav Kumar',
//               style: TextStyle(
//                 fontSize: 22,
//                 fontWeight: FontWeight.bold,
//                 color: Color(0xFF1E88E5),
//               ),
//             ),
//             const SizedBox(height: 4),
//             const Text(
//               'B.Tech CSE, 3rd Year',
//               style: TextStyle(color: Colors.black54),
//             ),
//             const SizedBox(height: 2),
//             const Text(
//               'Roll No: GU-2023-3443',
//               style: TextStyle(color: Colors.black54),
//             ),
//             const SizedBox(height: 24),

//             // ✅ Options
//             _buildProfileOption(
//               context,
//               icon: Icons.edit,
//               text: 'My Profile',
//               destination: const MyProfileScreen(),
//             ),
//             _buildProfileOption(
//               context,
//               icon: Icons.lock,
//               text: 'Change Password',
//               destination: const ChangePasswordScreen(),
//             ),
//             _buildProfileOption(
//               context,
//               icon: Icons.check_circle_outline,
//               text: 'View Attendance',
//               destination: const AttendanceScreen(),
//             ),
//             _buildProfileOption(
//               context,
//               icon: Icons.book,
//               text: 'My Courses',
//               destination: const MyCoursesScreen(),
//             ),
//             _buildProfileOption(
//               context,
//               icon: Icons.payment,
//               text: 'Fee Status',
//               destination: const FeeStatusScreen(),
//             ),
//             _buildProfileOption(
//               context,
//               icon: Icons.help_outline,
//               text: 'Help & Support',
//               destination: const HelpSupportScreen(),
//             ),

//             const SizedBox(height: 24),

//             // // ✅ AI Assistant
//             // Container(
//             //   padding: const EdgeInsets.all(16),
//             //   decoration: BoxDecoration(
//             //     gradient: const LinearGradient(
//             //       colors: [Color(0xFFFFF9C4), Color(0xFFFFF176)],
//             //       begin: Alignment.topLeft,
//             //       end: Alignment.bottomRight,
//             //     ),
//             //     borderRadius: BorderRadius.circular(12),
//             //     boxShadow: [
//             //       BoxShadow(
//             //         color: Colors.yellow.shade200.withOpacity(0.5),
//             //         blurRadius: 6,
//             //         offset: const Offset(0, 3),
//             //       ),
//             //     ],
//             //   ),
//             //   child: Row(
//             //     children: const [
//             //       Icon(Icons.smart_toy, color: Colors.black87),
//             //       SizedBox(width: 8),
//             //       Expanded(
//             //         child: Text(
//             //           'Ask AI about your profile!',
//             //           style: TextStyle(fontSize: 16),
//             //         ),
//             //       ),
//             //       Icon(Icons.arrow_forward_ios, size: 16),
//             //     ],
//             //   ),
//             // ),

//             // const SizedBox(height: 32),

//             // ✅ Logout
//             ElevatedButton.icon(
//               onPressed: () {
//                 Navigator.pushAndRemoveUntil(
//                   context,
//                   MaterialPageRoute(builder: (_) => const LoginScreen()),
//                   (route) => false,
//                 );
//               },
//               icon: const Icon(Icons.logout),
//               label: const Text('Logout'),
//               style: ElevatedButton.styleFrom(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 40,
//                   vertical: 14,
//                 ),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//                 backgroundColor: const Color(0xFF2196F3),
//                 foregroundColor: Colors.white,
//                 elevation: 5,
//               ),
//             ),

//             const SizedBox(height: 12),
//             const Text(
//               'Version 1.0.0 | Privacy Policy',
//               style: TextStyle(fontSize: 12, color: Colors.grey),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildProfileOption(
//     BuildContext context, {
//     required IconData icon,
//     required String text,
//     required Widget destination,
//   }) {
//     return Card(
//       elevation: 2,
//       margin: const EdgeInsets.symmetric(vertical: 6),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: ListTile(
//         leading: Icon(icon, color: Colors.blueAccent),
//         title: Text(text, style: const TextStyle(fontWeight: FontWeight.w500)),
//         trailing: const Icon(Icons.arrow_forward_ios, size: 16),
//         onTap: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (_) => destination),
//           );
//         },
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';

import 'sprofile/my_profile_screen.dart';
import 'sprofile/change_password_screen.dart';
import 'sprofile/attendance_screen.dart';
import 'package:edu_voice_main/screens/login_Screen.dart';
import 'sprofile/my_courses_screen.dart';
import 'sprofile/fee_status_screen.dart';
import 'sprofile/help_support_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeIn;
  late Animation<Offset> _slideUp;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _fadeIn = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _slideUp =
        Tween<Offset>(begin: const Offset(0, 0.1), end: Offset.zero).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// ✅ Custom slide navigation
  void _navigateWithSlide(Widget destination) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (_, __, ___) => destination,
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
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            fontFamily: 'TimesNewRoman',
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            color: Colors.white,
          ),
        ),
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF2196F3), Color(0xFFFF9800)], // blue + orange
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: FadeTransition(
        opacity: _fadeIn,
        child: SlideTransition(
          position: _slideUp,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // ✅ Avatar with shadow
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.orange.withOpacity(0.4),
                        blurRadius: 18,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: const CircleAvatar(
                    radius: 55,
                    backgroundImage:
                        AssetImage('assets/images/profile_placeholder.png'),
                  ),
                ),
                const SizedBox(height: 16),

                // ✅ Name
                const Text(
                  'Gaurav Kumar',
                  style: TextStyle(
                    fontFamily: 'TimesNewRoman',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2196F3),
                  ),
                ),
                const SizedBox(height: 6),

                // ✅ Course + Roll
                const Text(
                  'B.Tech CSE, 3rd Year',
                  style: TextStyle(
                    fontFamily: 'TimesNewRoman',
                    color: Colors.black54,
                    fontSize: 15,
                  ),
                ),
                const Text(
                  'Roll No: GU-2023-3443',
                  style: TextStyle(
                    fontFamily: 'TimesNewRoman',
                    color: Colors.black54,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 28),

                // ✅ Profile options
                _buildProfileOption(
                  icon: Icons.edit,
                  text: 'My Profile',
                  destination: const MyProfileScreen(),
                ),
                _buildProfileOption(
                  icon: Icons.lock,
                  text: 'Change Password',
                  destination: const ChangePasswordScreen(),
                ),
                _buildProfileOption(
                  icon: Icons.check_circle_outline,
                  text: 'View Attendance',
                  destination: const AttendanceScreen(),
                ),
                _buildProfileOption(
                  icon: Icons.book,
                  text: 'My Courses',
                  destination: const MyCoursesScreen(),
                ),
                _buildProfileOption(
                  icon: Icons.payment,
                  text: 'Fee Status',
                  destination: const FeeStatusScreen(),
                ),
                _buildProfileOption(
                  icon: Icons.help_outline,
                  text: 'Help & Support',
                  destination: const HelpSupportScreen(),
                ),

                const SizedBox(height: 30),

                // ✅ Logout Button
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => const LoginScreen()),
                      (route) => false,
                    );
                  },
                  icon: const Icon(Icons.logout),
                  label: const Text(
                    'Logout',
                    style: TextStyle(fontFamily: 'TimesNewRoman'),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 14,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: const Color(0xFFFF9800), // Orange
                    foregroundColor: Colors.white,
                    elevation: 6,
                  ),
                ),

                const SizedBox(height: 16),
                const Text(
                  'Version 1.0.0 | Privacy Policy',
                  style: TextStyle(
                    fontFamily: 'TimesNewRoman',
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileOption({
    required IconData icon,
    required String text,
    required Widget destination,
  }) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: () => _navigateWithSlide(destination),
        child: ListTile(
          leading: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.blue.shade50,
            child: Icon(icon, color: const Color(0xFFFF9800)), // Orange icons
          ),
          title: Text(
            text,
            style: const TextStyle(
              fontFamily: 'TimesNewRoman',
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          trailing: const Icon(Icons.arrow_forward_ios,
              size: 16, color: Color(0xFF2196F3)), // Blue arrow
        ),
      ),
    );
  }
}
