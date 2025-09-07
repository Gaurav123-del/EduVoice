// import 'package:flutter/material.dart';

// class MyProfileScreen extends StatelessWidget {
//   const MyProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         title: const Text('My Profile'),
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         centerTitle: true,
//       ),
//       body: Stack(
//         children: [
//           // ✅ Gradient Background
//           Container(
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [Color(0xFF00A8E8), Color(0xFF0077B6)],
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//               ),
//             ),
//           ),

//           // ✅ Profile Content
//           SafeArea(
//             child: Column(
//               children: [
//                 const SizedBox(height: 30),
//                 // ✅ Profile Picture with Animation
//                 TweenAnimationBuilder(
//                   tween: Tween<double>(begin: 0, end: 1),
//                   duration: const Duration(milliseconds: 800),
//                   curve: Curves.easeOutBack,
//                   builder: (context, value, child) {
//                     return Transform.scale(
//                       scale: value,
//                       child: child,
//                     );
//                   },
//                   child: const CircleAvatar(
//                     radius: 60,
//                     backgroundImage: AssetImage('assets/images/t_placeholder.png'),
//                   ),
//                 ),
//                 const SizedBox(height: 16),

//                 // ✅ Name
//                 const Text(
//                   'Mr. John Doe',
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 const SizedBox(height: 4),

//                 // ✅ Subject
//                 const Text(
//                   'Mathematics Teacher',
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.white70,
//                   ),
//                 ),

//                 const SizedBox(height: 30),

//                 // ✅ Info Cards
//                 Expanded(
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
//                     decoration: const BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text(
//                           'Profile Information',
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                             color: Color(0xFF0077B6),
//                           ),
//                         ),
//                         const SizedBox(height: 16),

//                         _buildInfoTile(Icons.email, 'Email', 'john.doe@example.com'),
//                         _buildInfoTile(Icons.phone, 'Phone', '+91 9876543210'),
//                         _buildInfoTile(Icons.badge, 'Teacher ID', 'TCH-2023-1234'),
//                         _buildInfoTile(Icons.school, 'Department', 'Mathematics'),

//                         const Spacer(),

//                         // ✅ Animated Button
//                         SizedBox(
//                           width: double.infinity,
//                           child: ElevatedButton(
//                             onPressed: () {},
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: const Color(0xFF00A8E8),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(30),
//                               ),
//                               padding: const EdgeInsets.symmetric(vertical: 16),
//                             ),
//                             child: const Text(
//                               'Edit Profile',
//                               style: TextStyle(fontSize: 16),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildInfoTile(IconData icon, String title, String value) {
//     return Card(
//       elevation: 2,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       margin: const EdgeInsets.symmetric(vertical: 8),
//       child: ListTile(
//         leading: Icon(icon, color: const Color(0xFF00A8E8)),
//         title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
//         subtitle: Text(value),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'My Profile',
          style: TextStyle(
            fontFamily: "TimesNewRoman",
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // ✅ Orange + Blue Gradient Background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFFB923C), // Soft Orange
                  Color(0xFF0077B6), // Deep Blue
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          // ✅ Profile Content
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 30),
                // ✅ Profile Picture with Animation
                TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0, end: 1),
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.easeOutBack,
                  builder: (context, value, child) {
                    return Transform.scale(
                      scale: value,
                      child: child,
                    );
                  },
                  child: const CircleAvatar(
                    radius: 60,
                    backgroundImage:
                        AssetImage('assets/images/t_placeholder.png'),
                  ),
                ),
                const SizedBox(height: 16),

                // ✅ Name
                const Text(
                  'Mr. John Doe',
                  style: TextStyle(
                    fontFamily: "TimesNewRoman",
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Colors.black45,
                        offset: Offset(1, 1),
                        blurRadius: 3,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 4),

                // ✅ Subject
                const Text(
                  'Mathematics Teacher',
                  style: TextStyle(
                    fontFamily: "TimesNewRoman",
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),

                const SizedBox(height: 30),

                // ✅ Info Cards Section
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 16),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(30)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Profile Information',
                          style: TextStyle(
                            fontFamily: "TimesNewRoman",
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0077B6),
                          ),
                        ),
                        const SizedBox(height: 16),

                        _buildInfoTile(Icons.email, 'Email',
                            'john.doe@example.com', Colors.orange),
                        _buildInfoTile(
                            Icons.phone, 'Phone', '+91 9876543210', Colors.blue),
                        _buildInfoTile(Icons.badge, 'Teacher ID',
                            'TCH-2023-1234', Colors.orange),
                        _buildInfoTile(Icons.school, 'Department',
                            'Mathematics', Colors.blue),

                        const Spacer(),

                        // ✅ Animated Orange + Blue Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFFB923C),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16),
                              elevation: 6,
                              shadowColor: Colors.blueAccent,
                            ),
                            child: const Text(
                              'Edit Profile',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: "TimesNewRoman",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ✅ Custom Info Tile with Orange/Blue accents
  Widget _buildInfoTile(
      IconData icon, String title, String value, Color iconColor) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: iconColor),
        title: Text(
          title,
          style: const TextStyle(
            fontFamily: "TimesNewRoman",
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          value,
          style: const TextStyle(fontFamily: "TimesNewRoman"),
        ),
      ),
    );
  }
}
