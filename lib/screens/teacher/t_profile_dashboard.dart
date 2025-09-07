// import 'package:flutter/material.dart';

// import 'tprofile/t_my_profile_screen.dart';
// import 'tprofile/t_change_password_screen.dart';
// import 'tprofile/t_attendance_screen.dart';
// import 'tprofile/t_my_lectures_screen.dart';
// import 'tprofile/t_my_courses_screen.dart';
// import 'tprofile/t_help_support_screen.dart';
// import 'package:edu_voice_main/screens/login_Screen.dart';

// class TeacherProfileScreen extends StatelessWidget {
//   const TeacherProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF0F4F8),
//       appBar: AppBar(
//         title: const Text('My Profile'),
//         elevation: 0,
//         backgroundColor: const Color(0xFF00A8E8),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       body: Column(
//         children: [
//           const SizedBox(height: 20),
//           const CircleAvatar(
//             radius: 50,
//             backgroundImage: AssetImage('assets/images/t_placeholder.png'),
//           ),
//           const SizedBox(height: 16),
//           const Text(
//             'Mr. John Doe',
//             style: TextStyle(
//               fontSize: 22,
//               fontWeight: FontWeight.bold,
//               color: Color(0xFF0077B6),
//             ),
//           ),
//           const SizedBox(height: 4),
//           const Text(
//             'Mathematics Teacher\nID: TCH-2023-1234',
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               fontSize: 14,
//               color: Colors.black54,
//             ),
//           ),
//           const SizedBox(height: 24),
//           Expanded(
//             child: ListView(
//               padding: const EdgeInsets.symmetric(horizontal: 24),
//               children: [
//                 _buildTile(context, Icons.person, 'My Profile', const MyProfileScreen()),
//                 _buildTile(context, Icons.lock, 'Change Password', const ChangePasswordScreen()),
//                 _buildTile(context, Icons.assignment, 'Attendance', const AttendanceScreen()),
//                 _buildTile(context, Icons.video_library, 'My Lectures', const MyLecturesScreen()),
//                 _buildTile(context, Icons.school, 'My Courses', const MyCoursesScreen()),
//                 _buildTile(context, Icons.help_outline, 'Help & Support', const HelpSupportScreen()),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
//             child: SizedBox(
//               width: double.infinity,
//               child: ElevatedButton.icon(
//                 onPressed: () {
//                   // ✅ LOGOUT: Navigate to Login & remove all previous routes
//                   Navigator.pushAndRemoveUntil(
//                     context,
//                     MaterialPageRoute(builder: (_) => const LoginScreen()),
//                     (route) => false,
//                   );
//                 },
//                 icon: const Icon(Icons.logout),
//                 label: const Text('Logout'),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color(0xFF00A8E8),
//                   padding: const EdgeInsets.symmetric(vertical: 16),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           const Text(
//             'Version 1.0.0 | Privacy Policy',
//             style: TextStyle(
//               fontSize: 12,
//               color: Colors.black45,
//             ),
//           ),
//           const SizedBox(height: 10),
//         ],
//       ),
//     );
//   }

//   Widget _buildTile(BuildContext context, IconData icon, String label, Widget screen) {
//     return Card(
//       margin: const EdgeInsets.symmetric(vertical: 8),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: ListTile(
//         leading: Icon(icon, color: const Color(0xFF00A8E8)),
//         title: Text(label),
//         trailing: const Icon(Icons.arrow_forward_ios, size: 16),
//         onTap: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (_) => screen),
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

import 'tprofile/t_my_profile_screen.dart';
import 'tprofile/t_change_password_screen.dart';
import 'tprofile/t_attendance_screen.dart';
import 'tprofile/t_my_lectures_screen.dart';
import 'tprofile/t_my_courses_screen.dart';
import 'tprofile/t_help_support_screen.dart';
import 'package:edu_voice_main/screens/login_Screen.dart';

class TeacherProfileScreen extends StatelessWidget {
  const TeacherProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA), // Light neutral background
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
              colors: [Color.fromARGB(255, 75, 102, 176), Color(0xFFFB923C)], // Deep Blue → Soft Orange
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: [
                _buildTile(context, Icons.person, 'My Profile', const MyProfileScreen(), Colors.blue),
                _buildTile(context, Icons.lock, 'Change Password', const ChangePasswordScreen(), Colors.orange),
                _buildTile(context, Icons.assignment, 'Attendance', const TeacherAttendanceScreen(), Colors.green),
                _buildTile(context, Icons.video_library, 'My Lectures', const MyLecturesScreen(), Colors.deepPurple),
                _buildTile(context, Icons.school, 'My Courses', const MyCoursesScreen(), Colors.teal),
                _buildTile(context, Icons.help_outline, 'Help & Support', const HelpSupportScreen(), Colors.redAccent),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginScreen()),
                    (route) => false,
                  );
                },
                icon: const Icon(Icons.logout, color: Colors.white),
                label: const Text(
                  'Logout',
                  style: TextStyle(fontFamily: "TimesNewRoman", color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFB923C), // Soft Orange
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  shadowColor: Colors.black26,
                  elevation: 6,
                ),
              ),
            ),
          ),
          const Text(
            'Version 1.0.0 | Privacy Policy',
            style: TextStyle(
              fontSize: 12,
              fontFamily: "TimesNewRoman",
              color: Colors.black45,
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildTile(BuildContext context, IconData icon, String label, Widget screen, Color tileColor) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: tileColor.withOpacity(0.15),
          child: Icon(icon, color: tileColor),
        ),
        title: Text(
          label,
          style: const TextStyle(fontFamily: "TimesNewRoman"),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black45),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => screen),
          );
        },
      ),
    );
  }
}
