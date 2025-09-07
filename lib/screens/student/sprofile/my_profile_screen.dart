// import 'package:flutter/material.dart';

// class MyProfileScreen extends StatelessWidget {
//   const MyProfileScreen({super.key});

//   Widget buildInfoRow(String label, String value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             label,
//             style: const TextStyle(
//               fontSize: 14,
//               color: Colors.grey,
//             ),
//           ),
//           const SizedBox(height: 4),
//           Text(
//             value,
//             style: const TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//           const Divider(),
//         ],
//       ),
//     );
//   }

//   void _onEditPressed(BuildContext context) {
//     // Show animation effect or navigate
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text('Edit Profile tapped!')),
//     );
//     // TODO: Navigate to your EditProfileScreen() if you have one
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('My Profile'),
//         flexibleSpace: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               colors: [Color(0xFF00BCD4), Color(0xFF009688)],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),
//         ),
//         elevation: 4,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             buildInfoRow('Student Name', 'GAURAV KUMAR RAJU'),
//             buildInfoRow('Student ID', 'GU-2023-3443'),
//             buildInfoRow('Admission ID', 'SEDAE4706'),
//             Row(
//               children: [
//                 Expanded(child: buildInfoRow('Gender', 'Male')),
//                 Expanded(child: buildInfoRow('Date of Birth', '30/10/2004')),
//               ],
//             ),
//             buildInfoRow('Email ID', 'gauravraju880@gmail.com'),
//             buildInfoRow('Mobile Number', '+91-9915484979'),
//             buildInfoRow(
//               'Address',
//               'VILLAGE CHAK GUJRAN POST OFFICE PIPLANWALA, '
//               'TEHSIL AND DISTRICT : HOSHIARPUR, PUNJAB, 146001, '
//               'Hoshiarpur, 146001, INDIA',
//             ),
//             buildInfoRow('Date of Registration', '27/06/2023'),
//             buildInfoRow('Father Name', 'Mr. MULKH RAJ'),
//             buildInfoRow('Mother Name', 'Ms. KAMLA DEVI'),
//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//               child: Text(
//                 'Std id: GU-2023-3443',
//                 style: TextStyle(
//                   fontSize: 12,
//                   color: Colors.black54,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),

//       // ✅ Floating Edit Button with shadow & animation
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: () => _onEditPressed(context),
//         icon: const Icon(Icons.edit),
//         label: const Text('Edit'),
//         backgroundColor: Colors.teal,
//         elevation: 6,
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';

// class MyProfileScreen extends StatelessWidget {
//   const MyProfileScreen({super.key});

//   Widget buildInfoTile(IconData icon, String label, String value) {
//     return Card(
//       margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       elevation: 2,
//       child: ListTile(
//         leading: CircleAvatar(
//           backgroundColor: Colors.teal.shade100,
//           child: Icon(icon, color: Colors.teal),
//         ),
//         title: Text(
//           label,
//           style: const TextStyle(
//             fontSize: 14,
//             color: Colors.grey,
//             fontFamily: "TimesNewRoman",
//           ),
//         ),
//         subtitle: Text(
//           value,
//           style: const TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w600,
//             fontFamily: "TimesNewRoman",
//           ),
//         ),
//       ),
//     );
//   }

//   void _onEditPressed(BuildContext context) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text('Edit Profile tapped!')),
//     );
//     // TODO: Navigate to EditProfileScreen
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF5F7FA),
//       appBar: AppBar(
//         title: const Text(
//           'My Profile',
//           style: TextStyle(fontFamily: "TimesNewRoman"),
//         ),
//         centerTitle: true,
//         flexibleSpace: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               colors: [Color(0xFF00BCD4), Color(0xFF009688)],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),
//         ),
//         elevation: 0,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             /// Profile Header
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.symmetric(vertical: 24),
//               decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [Color(0xFF00BCD4), Color(0xFF009688)],
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 ),
//               ),
//               child: Column(
//                 children: const [
//                   CircleAvatar(
//                     radius: 45,
//                     backgroundColor: Colors.white,
//                     child: Icon(Icons.person, size: 60, color: Colors.teal),
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     "GAURAV KUMAR RAJU",
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       fontFamily: "TimesNewRoman",
//                       color: Colors.white,
//                     ),
//                   ),
//                   SizedBox(height: 4),
//                   Text(
//                     "Student ID: GU-2023-3443",
//                     style: TextStyle(
//                       fontSize: 14,
//                       fontFamily: "TimesNewRoman",
//                       color: Colors.white70,
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 16),

//             /// Info Tiles
//             buildInfoTile(Icons.badge, "Admission ID", "SEDAE4706"),
//             buildInfoTile(Icons.male, "Gender", "Male"),
//             buildInfoTile(Icons.calendar_today, "Date of Birth", "30/10/2004"),
//             buildInfoTile(Icons.email, "Email ID", "gauravraju880@gmail.com"),
//             buildInfoTile(Icons.phone, "Mobile Number", "+91-9915484979"),
//             buildInfoTile(Icons.home, "Address",
//                 "VILLAGE CHAK GUJRAN, PIPLANWALA, HOSHIARPUR, PUNJAB, 146001, INDIA"),
//             buildInfoTile(Icons.date_range, "Date of Registration", "27/06/2023"),
//             buildInfoTile(Icons.person_outline, "Father Name", "Mr. MULKH RAJ"),
//             buildInfoTile(Icons.person_outline, "Mother Name", "Ms. KAMLA DEVI"),

//             const SizedBox(height: 20),
//             const Text(
//               "Std id: GU-2023-3443",
//               style: TextStyle(
//                 fontSize: 12,
//                 fontFamily: "TimesNewRoman",
//                 color: Colors.black54,
//               ),
//             ),
//             const SizedBox(height: 70), // space for FAB
//           ],
//         ),
//       ),

//       /// Floating Edit Button
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: () => _onEditPressed(context),
//         icon: const Icon(Icons.edit),
//         label: const Text(
//           'Edit Profile',
//           style: TextStyle(fontFamily: "TimesNewRoman"),
//         ),
//         backgroundColor: Colors.teal,
//         elevation: 6,
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  Widget buildInfoTile(IconData icon, String label, String value) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          colors: [Colors.white, Color(0xFFE3F2FD)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: Colors.orange.shade100,
            child: Icon(icon, color: Colors.blue, size: 26),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                    fontFamily: "TimesNewRoman",
                  ),
                ),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: "TimesNewRoman",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onEditPressed(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Edit Profile tapped!')),
    );
    // TODO: Navigate to EditProfileScreen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        title: const Text(
          ' My Profile',
          style: TextStyle(
            fontFamily: "TimesNewRoman",
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF2196F3), Color(0xFFFF9800)], // Blue + Orange
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Profile Header
            // Container(
            //   width: double.infinity,
            //   padding: const EdgeInsets.symmetric(vertical: 28),
            //   decoration: const BoxDecoration(
            //     gradient: LinearGradient(
            //       colors: [Color(0xFF2196F3), Color(0xFFFF9800)],
            //       begin: Alignment.topLeft,
            //       end: Alignment.bottomRight,
            //     ),
            //     boxShadow: [
            //       BoxShadow(
            //         color: Colors.black26,
            //         blurRadius: 8,
            //         offset: Offset(0, 4),
            //       ),
            //     ],
            //   ),
            //   child: Column(
            //     children: const [
            //       CircleAvatar(
            //         radius: 48,
            //         backgroundColor: Colors.white,
            //         child: Icon(Icons.person, size: 60, color: Colors.blue),
            //       ),
            //       SizedBox(height: 12),
            //       Text(
            //         "GAURAV KUMAR RAJU",
            //         style: TextStyle(
            //           fontSize: 20,
            //           fontWeight: FontWeight.bold,
            //           fontFamily: "TimesNewRoman",
            //           color: Colors.white,
            //         ),
            //       ),
            //       SizedBox(height: 4),
            //       Text(
            //         "Student ID: GU-2023-3443",
            //         style: TextStyle(
            //           fontSize: 14,
            //           fontFamily: "TimesNewRoman",
            //           color: Colors.white70,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),

            const SizedBox(height: 16),

            /// Info Tiles
            buildInfoTile(Icons.badge, "Admission ID", "SEDAE4706"),
            buildInfoTile(Icons.male, "Gender", "Male"),
            buildInfoTile(Icons.calendar_today, "Date of Birth", "30/10/2004"),
            buildInfoTile(Icons.email, "Email ID", "gauravraju880@gmail.com"),
            buildInfoTile(Icons.phone, "Mobile Number", "+91-9915484979"),
            buildInfoTile(Icons.home, "Address",
                "VILLAGE CHAK GUJRAN, PIPLANWALA, HOSHIARPUR, PUNJAB, 146001, INDIA"),
            buildInfoTile(Icons.date_range, "Date of Registration", "27/06/2023"),
            buildInfoTile(Icons.person_outline, "Father Name", "Mr. MULKH RAJ"),
            buildInfoTile(Icons.person_outline, "Mother Name", "Ms. KAMLA DEVI"),

            const SizedBox(height: 20),
            const Text(
              "Std id: GU-2023-3443",
              style: TextStyle(
                fontSize: 12,
                fontFamily: "TimesNewRoman",
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 80), // space for FAB
          ],
        ),
      ),

      /// Floating Edit Button
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _onEditPressed(context),
        icon: const Icon(Icons.edit),
        label: const Text(
          'Edit Profile',
          style: TextStyle(fontFamily: "TimesNewRoman"),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
    );
  }
}
