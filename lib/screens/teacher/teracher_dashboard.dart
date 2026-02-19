// import 'package:flutter/material.dart';

// import 't_profile_dashboard.dart';
// import 'upload_video_screen.dart';
// import 'teacher_lecture_details_screen.dart';

// class TeacherDashboard extends StatefulWidget {
//   const TeacherDashboard({super.key});

//   @override
//   State<TeacherDashboard> createState() => _TeacherDashboardState();
// }

// class _TeacherDashboardState extends State<TeacherDashboard>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<Offset> _slideAnimation;
//   late Animation<double> _fadeAnimation;

//   final List<Map<String, String>> todayLectures = [
//     {'class': '9', 'subject': 'Math'},
//     {'class': '9', 'subject': 'Math'},
//     {'class': '9', 'subject': 'Math'},
//     {'class': '9', 'subject': 'Math'},
//     {'class': '9', 'subject': 'Math'},
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 800),
//     );
//     _slideAnimation = Tween<Offset>(
//       begin: const Offset(0, 0.2),
//       end: Offset.zero,
//     ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
//     _fadeAnimation = Tween<double>(
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

//   void _openUpload() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (_) => const UploadVideoScreen()),
//     );
//   }

//   void _openProfile() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (_) => const TeacherProfileScreen()),
//     );
//   }

//   void _openNotification() {
//     ScaffoldMessenger.of(
//       context,
//     ).showSnackBar(const SnackBar(content: Text('No new notifications yet!')));
//   }

//   void _pickDate() async {
//     DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2100),
//     );
//     if (picked != null) {
//       debugPrint('Picked date: $picked');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF1F8E9),
//       body: SafeArea(
//         child: Column(
//           children: [
//             // ✅ HEADER
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//               child: Material(
//                 elevation: 5,
//                 borderRadius: BorderRadius.circular(40),
//                 child: AnimatedContainer(
//                   duration: const Duration(milliseconds: 500),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(40),
//                     gradient: const LinearGradient(
//                       colors: [Color(0xFF00BCD4), Color(0xFF009688)],
//                       begin: Alignment.topLeft,
//                       end: Alignment.bottomRight,
//                     ),
//                   ),
//                   padding: const EdgeInsets.symmetric(horizontal: 12),
//                   child: Row(
//                     children: [
//                       GestureDetector(
//                         onTap: _openProfile,
//                         child: Hero(
//                           tag: 'profile-avatar',
//                           child: const CircleAvatar(
//                             radius: 22,
//                             backgroundImage: AssetImage(
//                               'assets/images/t_placeholder.png',
//                             ),
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         child: Container(
//                           margin: const EdgeInsets.symmetric(horizontal: 8),
//                           child: const TextField(
//                             decoration: InputDecoration(
//                               hintText: 'Search lectures...',
//                               prefixIcon: Icon(
//                                 Icons.search,
//                                 color: Colors.white,
//                               ),
//                               border: InputBorder.none,
//                               hintStyle: TextStyle(color: Colors.white70),
//                             ),
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ),
//                       ),
//                       IconButton(
//                         icon: const Icon(
//                           Icons.notifications_active,
//                           color: Colors.white,
//                         ),
//                         onPressed: _openNotification,
//                       ),
//                       IconButton(
//                         icon: const Icon(
//                           Icons.calendar_month,
//                           color: Colors.white,
//                         ),
//                         onPressed: _pickDate,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),

//             // ✅ LECTURE LIST
//             Expanded(
//               child: FadeTransition(
//                 opacity: _fadeAnimation,
//                 child: SlideTransition(
//                   position: _slideAnimation,
//                   child: ListView.builder(
//                     padding: const EdgeInsets.symmetric(horizontal: 16),
//                     itemCount: todayLectures.length,
//                     itemBuilder: (context, index) {
//                       final lecture = todayLectures[index];
//                       return AnimatedContainer(
//                         duration: const Duration(milliseconds: 500),
//                         curve: Curves.easeInOut,
//                         margin: const EdgeInsets.symmetric(vertical: 8),
//                         decoration: BoxDecoration(
//                           gradient: const LinearGradient(
//                             colors: [Color(0xFFB2EBF2), Color(0xFF80DEEA)],
//                             begin: Alignment.topLeft,
//                             end: Alignment.bottomRight,
//                           ),
//                           borderRadius: BorderRadius.circular(20),
//                           boxShadow: const [
//                             BoxShadow(
//                               color: Colors.black26,
//                               blurRadius: 8,
//                               offset: Offset(0, 4),
//                             ),
//                           ],
//                         ),
//                         child: ListTile(
//                           contentPadding: const EdgeInsets.all(16),
//                           title: Text(
//                             'Class ${lecture['class']} - ${lecture['subject']}',
//                             style: const TextStyle(
//                               fontWeight: FontWeight.bold,
//                               color: Colors.teal,
//                               fontSize: 16,
//                             ),
//                           ),
//                           subtitle: const Text(
//                             'Lecture Scheduled Today',
//                             style: TextStyle(color: Colors.black54),
//                           ),
//                           leading: const Icon(
//                             Icons.play_circle_fill,
//                             color: Colors.teal,
//                             size: 40,
//                           ),
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (_) => TeacherLectureDetailsScreen(
//                                   lecture: lecture,
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),

//       // ✅ Just FAB in bottom right
//       floatingActionButton: FloatingActionButton(
//         onPressed: _openUpload,
//         backgroundColor: Colors.teal,
//         child: const Icon(Icons.add, size: 30),
//       ),
//     );
//   }
// }

// import 'dart:ui';
// import 'package:flutter/material.dart';

// import 't_profile_dashboard.dart';
// import 'upload_video_screen.dart';
// import 'teacher_lecture_details_screen.dart';

// class TeacherDashboard extends StatefulWidget {
//   const TeacherDashboard({super.key});

//   @override
//   State<TeacherDashboard> createState() => _TeacherDashboardState();
// }

// class _TeacherDashboardState extends State<TeacherDashboard>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<Offset> _slideAnimation;
//   late Animation<double> _fadeAnimation;

//   final List<Map<String, String>> todayLectures = [
//     {'class': '9', 'subject': 'Mathematics'},
//     {'class': '10', 'subject': 'Physics'},
//     {'class': '11', 'subject': 'Computer Science'},
//     {'class': '12', 'subject': 'Chemistry'},
//     {'class': '9', 'subject': 'Algebra'},
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 800),
//     );
//     _slideAnimation = Tween<Offset>(
//       begin: const Offset(0, 0.2),
//       end: Offset.zero,
//     ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
//     _fadeAnimation = Tween<double>(
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

//   void _openUpload() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (_) => const UploadVideoScreen()),
//     );
//   }

//   void _openProfile() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (_) => const TeacherProfileScreen()),
//     );
//   }

//   void _openNotification() {
//     ScaffoldMessenger.of(
//       context,
//     ).showSnackBar(const SnackBar(content: Text('No new notifications yet!')));
//   }

//   void _pickDate() async {
//     DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2100),
//     );
//     if (picked != null) {
//       debugPrint('Picked date: $picked');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         // 🌈 Gradient background
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               Color(0xFF1E3A8A), // Deep Blue
//               Color(0xFFE7A56F),
//               Color(0xFF0EA5E9), // Cyan-Blue
//               Color(0xFFFB923C), // Soft Orange
//             ],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: SafeArea(
//           child: Column(
//             children: [
//               // ✅ HEADER WITH GLASS EFFECT
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(40),
//                   child: BackdropFilter(
//                     filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: Colors.white.withOpacity(0.15),
//                         borderRadius: BorderRadius.circular(40),
//                         border: Border.all(
//                           color: Colors.white.withOpacity(0.3),
//                           width: 1,
//                         ),
//                       ),
//                       padding: const EdgeInsets.symmetric(horizontal: 8),
//                       child: Row(
//                         children: [
//                           GestureDetector(
//                             onTap: _openProfile,
//                             child: const CircleAvatar(
//                               radius: 20,

//                               backgroundImage: AssetImage(
//                                 'assets/images/t_placeholder.png',
//                               ),
//                             ),
//                           ),
//                           Expanded(
//                             child: Container(
//                               margin: const EdgeInsets.symmetric(horizontal: 8),
//                               child: const TextField(
//                                 decoration: InputDecoration(
//                                   hintText: 'Search lectures...',
//                                   prefixIcon: Icon(Icons.search,
//                                       color: Colors.white),
//                                   border: InputBorder.none,
//                                   hintStyle: TextStyle(
//                                     color: Colors.white70,
//                                     fontFamily: "TimesNewRoman",
//                                   ),
//                                 ),
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontFamily: "TimesNewRoman",
//                                 ),
//                               ),
//                             ),
//                           ),
//                           IconButton(
//                             icon: const Icon(Icons.notifications_active,
//                                 color: Colors.white),
//                             onPressed: _openNotification,
//                           ),
//                           IconButton(
//                             icon: const Icon(Icons.calendar_month,
//                                 color: Colors.white),
//                             onPressed: _pickDate,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),

//               // ✅ LECTURE LIST WITH GLASS CARDS
//               Expanded(
//                 child: FadeTransition(
//                   opacity: _fadeAnimation,
//                   child: SlideTransition(
//                     position: _slideAnimation,
//                     child: ListView.builder(
//                       padding: const EdgeInsets.symmetric(horizontal: 16),
//                       itemCount: todayLectures.length,
//                       itemBuilder: (context, index) {
//                         final lecture = todayLectures[index];
//                         return ClipRRect(
//                           borderRadius: BorderRadius.circular(20),
//                           child: BackdropFilter(
//                             filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
//                             child: Container(
//                               margin: const EdgeInsets.symmetric(vertical: 8),
//                               decoration: BoxDecoration(
//                                 color: Colors.white.withOpacity(0.15),
//                                 borderRadius: BorderRadius.circular(20),
//                                 border: Border.all(
//                                   color: Colors.white.withOpacity(0.3),
//                                 ),
//                               ),
//                               child: ListTile(
//                                 contentPadding: const EdgeInsets.all(16),
//                                 title: Text(
//                                   'Class ${lecture['class']} - ${lecture['subject']}',
//                                   style: const TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.white,
//                                     fontSize: 16,
//                                     fontFamily: "TimesNewRoman",
//                                   ),
//                                 ),
//                                 subtitle: const Text(
//                                   'Lecture Scheduled Today',
//                                   style: TextStyle(
//                                     color: Colors.white70,
//                                     fontFamily: "TimesNewRoman",
//                                   ),
//                                 ),
//                                 leading: const Icon(
//                                   Icons.play_circle_fill,
//                                   color: Colors.white,
//                                   size: 40,
//                                 ),
//                                 onTap: () {
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (_) =>
//                                           TeacherLectureDetailsScreen(
//                                         lecture: lecture,
//                                       ),
//                                     ),
//                                   );
//                                 },
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),

//       // ✅ Glassmorphic FAB
//       floatingActionButton: ClipRRect(
//         borderRadius: BorderRadius.circular(50),
//         child: BackdropFilter(
//           filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
//           child: FloatingActionButton.extended(
//             onPressed: _openUpload,
//             backgroundColor: const Color.fromARGB(255, 215, 184, 26),
//             icon: const Icon(Icons.upload, color: Colors.white),
//             label: const Text(
//               "Upload Lecture",
//               style: TextStyle(
//                 fontFamily: "TimesNewRoman",
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// import 't_profile_dashboard.dart';
// import 'upload_video_screen.dart';
// import 'teacher_lecture_details_screen.dart';

// class TeacherDashboard extends StatefulWidget {
//   const TeacherDashboard({super.key});

//   @override
//   State<TeacherDashboard> createState() => _TeacherDashboardState();
// }

// class _TeacherDashboardState extends State<TeacherDashboard> {

//   final List<Map<String, String>> todayLectures = [
//     {'class': '9', 'subject': 'Mathematics'},
//     {'class': '10', 'subject': 'Physics'},
//     {'class': '11', 'subject': 'Computer Science'},
//     {'class': '12', 'subject': 'Chemistry'},
//   ];

//   void _openUpload() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (_) => const UploadVideoScreen()),
//     );
//   }

//   void _openProfile() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (_) => const TeacherProfileScreen()),
//     );
//   }

//   void _openNotification() {
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text('No new notifications yet!')),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,

//       // ✅ FLOATING BUTTON
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: _openUpload,
//         backgroundColor: const Color(0xFFE53935),
//         icon: const Icon(Icons.upload, color: Colors.white),
//         label: const Text(
//           "Upload Lecture",
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),

//       body: SafeArea(
//         child: Column(
//           children: [

//             // 🔴 GRADIENT HEADER
//             Container(
//               padding: const EdgeInsets.all(16),
//               decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [
//                   Color(0xFFFB923C), // Soft Orange
//                   Color(0xFF0077B6), // Deep Blue
//                 ],
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 ),
//                 borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(30),
//                   bottomRight: Radius.circular(30),
//                 ),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [

//                   // TOP BAR
//                   Row(
//                     children: [
//                       const Icon(Icons.menu, color: Colors.white),
//                       const Spacer(),
//                       const Text(
//                         "Eduverse",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const Spacer(),
//                       const Icon(Icons.search, color: Colors.white),
//                       const SizedBox(width: 10),
//                       GestureDetector(
//                         onTap: _openNotification,
//                         child: const Icon(Icons.notifications,
//                             color: Colors.white),
//                       ),
//                     ],
//                   ),

//                   const SizedBox(height: 20),

//                   // PROFILE ROW
//                   GestureDetector(
//                     onTap: _openProfile,
//                     child: Row(
//                       children: const [
//                         CircleAvatar(
//                           radius: 22,
//                           backgroundImage: AssetImage(
//                               'assets/images/t_placeholder.png'),
//                         ),
//                         SizedBox(width: 12),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text("Annie Duffy",
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.bold)),
//                             Text("Class 9 Maths, Board Exam",
//                                 style: TextStyle(
//                                     color: Colors.white70, fontSize: 12)),
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             // ⚪ CONTENT
//             Expanded(
//               child: ListView(
//                 padding: const EdgeInsets.all(16),
//                 children: [

//                   const Text(
//                     "Hi, what would you learn today?",
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),

//                   const SizedBox(height: 16),

//                   // 📚 SUBJECT GRID
//                   GridView.count(
//                     crossAxisCount: 2,
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     mainAxisSpacing: 12,
//                     crossAxisSpacing: 12,
//                     childAspectRatio: 2.6,
//                     children: [
//                       _subjectCard("Mathematics", Colors.red),
//                       _subjectCard("Physics", Colors.indigo),
//                       _subjectCard("Chemistry", Colors.blue),
//                       _subjectCard("Biology", Colors.green),
//                       _subjectCard("Reasoning", Colors.deepPurple),
//                       _subjectCard("Social Science", Colors.teal),
//                     ],
//                   ),

//                   const SizedBox(height: 20),

//                   const Text(
//                     "Popular videos",
//                     style: TextStyle(
//                         fontSize: 18, fontWeight: FontWeight.bold),
//                   ),

//                   const SizedBox(height: 12),

//                   Row(
//                     children: [
//                       Expanded(child: _videoCard()),
//                       const SizedBox(width: 12),
//                       Expanded(child: _videoCard()),
//                     ],
//                   ),

//                   const SizedBox(height: 20),

//                   const Text(
//                     "Today's Lectures",
//                     style: TextStyle(
//                         fontSize: 18, fontWeight: FontWeight.bold),
//                   ),

//                   const SizedBox(height: 10),

//                   // 🎓 LECTURE LIST
//                   ...todayLectures.map((lecture) {
//                     return Card(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(14),
//                       ),
//                       child: ListTile(
//                         leading: const Icon(Icons.play_circle_fill,
//                             color: Colors.red, size: 36),
//                         title: Text(
//                           'Class ${lecture['class']} - ${lecture['subject']}',
//                           style: const TextStyle(
//                               fontWeight: FontWeight.bold),
//                         ),
//                         subtitle: const Text("Lecture Scheduled Today"),
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (_) =>
//                                   TeacherLectureDetailsScreen(
//                                       lecture: lecture),
//                             ),
//                           );
//                         },
//                       ),
//                     );
//                   }).toList(),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // ✅ SUBJECT CARD
//   Widget _subjectCard(String title, Color color) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 14),
//       decoration: BoxDecoration(
//         color: color,
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Row(
//         children: [
//           const CircleAvatar(
//             backgroundColor: Colors.white,
//             child: Icon(Icons.menu_book, color: Colors.black),
//           ),
//           const SizedBox(width: 10),
//           Expanded(
//             child: Text(
//               title,
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // ✅ VIDEO CARD
//   Widget _videoCard() {
//     return Container(
//       height: 90,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//         image: const DecorationImage(
//           image: AssetImage("assets/images/video_thumb.png"),
//           fit: BoxFit.cover,
//         ),
//       ),
//     );
//   }
// }

// import 'dart:ui';
// import 'package:edu_voice_main/screens/student/notification_screen.dart';
// import 'package:flutter/material.dart';

// import 't_profile_dashboard.dart';
// import 'upload_video_screen.dart';
// import 'teacher_lecture_details_screen.dart';

// // 👉 CREATE THIS SCREEN FILE IF NOT EXISTS

// class TeacherDashboard extends StatefulWidget {
//   const TeacherDashboard({super.key});

//   @override
//   State<TeacherDashboard> createState() => _TeacherDashboardState();
// }

// class _TeacherDashboardState extends State<TeacherDashboard> {

//   final List<Map<String, String>> todayLectures = [
//     {'class': '9', 'subject': 'Mathematics'},
//     {'class': '10', 'subject': 'Physics'},
//     {'class': '11', 'subject': 'Computer Science'},
//     {'class': '12', 'subject': 'Chemistry'},
//   ];

//   void _openUpload() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (_) => const UploadVideoScreen()),
//     );
//   }

//   void _openProfile() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (_) => const TeacherProfileScreen()),
//     );
//   }

//   // 🔔 OPEN NOTIFICATION SCREEN
//   void _openNotification() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (_) => const NotificationScreen()),
//     );
//   }

//   // 📅 OPEN CALENDAR
//   void _openCalendar() async {
//     await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2100),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,

//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: _openUpload,
//         backgroundColor: const Color(0xFFFB923C),
//         icon: const Icon(Icons.upload, color: Colors.white),
//         label: const Text(
//           "Upload Lecture",
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),

//       body: SafeArea(
//         child: Column(
//           children: [

//             // 🔥 HEADER
//             Container(
//               padding: const EdgeInsets.all(16),
//               decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [
//                     Color(0xFFFB923C),
//                     Color(0xFF0077B6),
//                     Color.fromARGB(255, 37, 218, 17)
//                   ],
//                 ),
//                 borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(30),
//                   bottomRight: Radius.circular(30),
//                 ),
//               ),
//               child: Column(
//                 children: [

//                   Row(
//                     children: [
//                       const Icon(Icons.menu, color: Colors.white),
//                       const Spacer(),
//                       const Text(
//                         "Eduverse",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const Spacer(),
//                       const Icon(Icons.search, color: Colors.white),
//                       const SizedBox(width: 8),

//                       // 🔔 NOTIFICATION
//                       GestureDetector(
//                         onTap: _openNotification,
//                         child: const Icon(Icons.notifications,
//                             color: Colors.white),
//                       ),

//                       const SizedBox(width: 8),

//                       // 📅 CALENDAR
//                       GestureDetector(
//                         onTap: _openCalendar,
//                         child: const Icon(Icons.calendar_month,
//                             color: Colors.white),
//                       ),
//                     ],
//                   ),

//                   const SizedBox(height: 40),

//                   GestureDetector(
//                     onTap: _openProfile,
//                     child: Row(
//                       children: const [
//                         CircleAvatar(
//                           radius: 22,
//                           backgroundImage: AssetImage(
//                               'assets/images/t_placeholder.png'),
//                         ),
//                         SizedBox(width: 12),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text("Annie Duffy",
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.bold)),
//                             Text("Class 9 Maths, Board Exam",
//                                 style: TextStyle(
//                                     color: Colors.white70, fontSize: 12)),
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             // 📄 BODY
//             Expanded(
//               child: ListView(
//                 padding: const EdgeInsets.all(16),
//                 children: [

//                   const Text(
//                     "Hi, what would you learn today?",
//                     style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold),
//                   ),

//                   const SizedBox(height: 16),

//                   // 🌈 GLASS SUBJECT GRID
//                   GridView.count(
//                     crossAxisCount: 2,
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     mainAxisSpacing: 12,
//                     crossAxisSpacing: 12,
//                     childAspectRatio: 2.6,
//                     children: [
//                       _glassSubject("Mathematics",
//                           const [Color(0xFFFF6B6B), Color(0xFFFFA07A)]),
//                       _glassSubject("Physics",
//                           const [Color(0xFF4D96FF), Color.fromARGB(255, 143, 216, 255)]),
//                       _glassSubject("Chemistry",
//                           const [Color(0xFF00C9A7), Color(0xFF92FE9D)]),
//                       _glassSubject("Biology",
//                           const [Color(0xFF43E97B), Color(0xFF38F9D7)]),
//                       _glassSubject("Reasoning",
//                           const [Color(0xFF845EC2), Color.fromARGB(255, 232, 115, 197)]),
//                       _glassSubject("Social Science",
//                           const [Color(0xFFFF9671), Color(0xFFF9F871)]),
//                     ],
//                   ),

//                   // const SizedBox(height: 20),

//                   // const Text(
//                   //   "Popular videos",
//                   //   style: TextStyle(
//                   //       fontSize: 18, fontWeight: FontWeight.bold),
//                   // ),

//                   // const SizedBox(height: 12),

//                   // Row(
//                   //   children: [
//                   //     Expanded(child: _videoCard()),
//                   //     const SizedBox(width: 12),
//                   //     Expanded(child: _videoCard()),
//                   //   ],
//                   // ),

//                   const SizedBox(height: 16),

//                   const Text(
//                     "Today's Lectures",
//                     style: TextStyle(
//                         fontSize: 18, fontWeight: FontWeight.bold),
//                   ),

//                   const SizedBox(height: 10),

//                   ...todayLectures.map((lecture) {
//                     return _glassTile(
//                       child: ListTile(
//                         leading: const Icon(Icons.play_circle_fill,
//                             color: Colors.white, size: 36),
//                         title: Text(
//                           'Class ${lecture['class']} - ${lecture['subject']}',
//                           style: const TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold),
//                         ),
//                         subtitle: const Text(
//                           "Lecture Scheduled Today",
//                           style: TextStyle(color: Colors.white70),
//                         ),
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (_) =>
//                                   TeacherLectureDetailsScreen(
//                                       lecture: lecture),
//                             ),
//                           );
//                         },
//                       ),
//                     );
//                   }).toList(),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // ✨ GLASS SUBJECT BUTTON
//   Widget _glassSubject(String title, List<Color> shades) {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(14),
//       child: BackdropFilter(
//         filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
//         child: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(colors: shades),
//             borderRadius: BorderRadius.circular(14),
//             border: Border.all(color: Colors.white.withOpacity(0.4)),
//           ),
//           padding: const EdgeInsets.symmetric(horizontal: 12),
//           child: Row(
//             children: [
//               const CircleAvatar(
//                 backgroundColor: Colors.white,
//                 child: Icon(Icons.menu_book, color: Colors.black),
//               ),
//               const SizedBox(width: 10),
//               Expanded(
//                 child: Text(
//                   title,
//                   style: const TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // 🎬 VIDEO CARD

//   // 🔮 GLASS TILE
//   Widget _glassTile({required Widget child}) {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(14),
//       child: BackdropFilter(
//         filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
//         child: Container(
//           margin: const EdgeInsets.symmetric(vertical: 6),
//           decoration: BoxDecoration(
//             color: Colors.black.withOpacity(0.25),
//             borderRadius: BorderRadius.circular(14),
//             border: Border.all(color: Colors.white24),
//           ),
//           child: child,
//         ),
//       ),
//     );
//   }
// }

// import 'dart:ui';
// import 'package:edu_voice_main/screens/student/notification_screen.dart';
// import 'package:flutter/material.dart';

// import 't_profile_dashboard.dart';
// import 'upload_video_screen.dart';
// import 'teacher_lecture_details_screen.dart';
// // import 'notification_screen.dart';

// class TeacherDashboard extends StatefulWidget {
//   const TeacherDashboard({super.key});

//   @override
//   State<TeacherDashboard> createState() => _TeacherDashboardState();
// }

// class _TeacherDashboardState extends State<TeacherDashboard> {

//   final List<Map<String, String>> todayLectures = [
//     {'class': '9', 'subject': 'Mathematics'},
//     {'class': '10', 'subject': 'Physics'},
//     {'class': '11', 'subject': 'Computer Science'},
//     {'class': '12', 'subject': 'Chemistry'},
//   ];

//   void _openUpload() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (_) => const UploadVideoScreen()),
//     );
//   }

//   void _openProfile() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (_) => const TeacherProfileScreen()),
//     );
//   }

//   void _openNotification() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (_) => const NotificationScreen()),
//     );
//   }

//   void _openCalendar() async {
//     await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2100),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,

//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: _openUpload,
//         backgroundColor: const Color(0xFFFB923C),
//         icon: const Icon(Icons.upload, color: Colors.white),
//         label: const Text(
//           "Upload Lecture",
//           style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//         ),
//       ),

//       body: SafeArea(
//         child: Column(
//           children: [

//             // 🔥 HEADER
//             Container(
//               padding: const EdgeInsets.all(16),
//               decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [
//                     Color(0xFFFB923C),
//                     Color(0xFF0077B6),
//                   ],
//                 ),
//                 borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(30),
//                   bottomRight: Radius.circular(30),
//                 ),
//               ),
//               child: Column(
//                 children: [

//                   Row(
//                     children: [
//                       const Icon(Icons.menu, color: Colors.white),
//                       const Spacer(),
//                       const Text(
//                         "Eduverse",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const Spacer(),
//                       const Icon(Icons.search, color: Colors.white),
//                       const SizedBox(width: 8),

//                       GestureDetector(
//                         onTap: _openNotification,
//                         child: const Icon(Icons.notifications,
//                             color: Colors.white),
//                       ),

//                       const SizedBox(width: 8),

//                       GestureDetector(
//                         onTap: _openCalendar,
//                         child: const Icon(Icons.calendar_month,
//                             color: Colors.white),
//                       ),
//                     ],
//                   ),

//                   const SizedBox(height: 20),

//                   GestureDetector(
//                     onTap: _openProfile,
//                     child: Row(
//                       children: const [
//                         CircleAvatar(
//                           radius: 22,
//                           backgroundImage:
//                               AssetImage('assets/images/t_placeholder.png'),
//                         ),
//                         SizedBox(width: 12),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text("Annie Duffy",
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.bold)),
//                             Text("Class 9 Maths, Board Exam",
//                                 style: TextStyle(
//                                     color: Colors.white70, fontSize: 12)),
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             // 📄 BODY
//             Expanded(
//               child: ListView(
//                 padding: const EdgeInsets.all(16),
//                 children: [

//                   const Text(
//                     "Hi, what would you learn today?",
//                     style:
//                         TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),

// const SizedBox(height: 16),

// // 🌈 SUBJECT GRID (GLASS + 2 SHADE)
// GridView.count(
//   crossAxisCount: 2,
//   shrinkWrap: true,
//   physics: const NeverScrollableScrollPhysics(),
//   mainAxisSpacing: 12,
//   crossAxisSpacing: 12,
//   childAspectRatio: 2.6,
//   children: [
//     _glassSubject("Mathematics",
//         [Color(0xFFFF6B6B), Color(0xFFFFA07A)]),
//     _glassSubject("Physics",
//         [Color(0xFF4D96FF), Color(0xFF6BCBFF)]),
//     _glassSubject("Chemistry",
//         [Color(0xFF00C9A7), Color(0xFF92FE9D)]),
//     _glassSubject("Biology",
//         [Color(0xFF43E97B), Color(0xFF38F9D7)]),
//     _glassSubject("Reasoning",
//         [Color(0xFF845EC2), Color(0xFFD65DB1)]),
//     _glassSubject("Social Science",
//         [Color(0xFFFF9671), Color(0xFFF9F871)]),
//   ],
// ),

//                   // const SizedBox(height: 20),

//                   // const Text(
//                   //   "Popular videos",
//                   //   style:
//                   //       TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   // ),

//                   // const SizedBox(height: 12),

//                   // Row(
//                   //   children: [
//                   //     Expanded(child: _videoCard()),
//                   //     const SizedBox(width: 12),
//                   //     Expanded(child: _videoCard()),
//                   //   ],
//                   // ),

//                   const SizedBox(height: 16),

//                   const Text(
//                     "Today's Lectures",
//                     style:
//                         TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),

//                   const SizedBox(height: 12),

//                   // 🎬 LECTURES LIKE POPULAR VIDEOS
//                   Wrap(
//                     spacing: 12,
//                     runSpacing: 12,
//                     children: todayLectures.map((lecture) {
//                       return SizedBox(
//                         width:
//                             (MediaQuery.of(context).size.width - 44) / 2,
//                         child: _lectureVideoButton(lecture),
//                       );
//                     }).toList(),
//                   ),

//                   const SizedBox(height: 80),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // ✨ GLASS SUBJECT BUTTON
//   Widget _glassSubject(String title, List<Color> shades) {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(14),
//       child: BackdropFilter(
//         filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
//         child: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(colors: shades),
//             borderRadius: BorderRadius.circular(14),
//             border: Border.all(color: Colors.white.withOpacity(0.4)),
//           ),
//           padding: const EdgeInsets.symmetric(horizontal: 12),
//           child: Row(
//             children: [
//               const CircleAvatar(
//                 backgroundColor: Colors.white,
//                 child: Icon(Icons.menu_book, color: Colors.black),
//               ),
//               const SizedBox(width: 10),
//               Expanded(
//                 child: Text(
//                   title,
//                   style: const TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // 🎬 POPULAR VIDEO CARD

//   // 🎬 LECTURE VIDEO STYLE BUTTON
//   Widget _lectureVideoButton(Map<String, String> lecture) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (_) =>
//                 TeacherLectureDetailsScreen(lecture: lecture),
//           ),
//         );
//       },
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(14),
//         child: Stack(
//           children: [
//             Container(
//               height: 100,
//               decoration: const BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage("assets/images/video_thumb.png"),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             BackdropFilter(
//               filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
//               child: Container(
//                 height: 100,
//                 color: Colors.black.withOpacity(0.25),
//               ),
//             ),
//             const Positioned.fill(
//               child: Center(
//                 child: Icon(Icons.play_circle_fill,
//                     color: Colors.white, size: 36),
//               ),
//             ),
//             Positioned(
//               bottom: 8,
//               left: 8,
//               right: 8,
//               child: Text(
//                 'Class ${lecture['class']} - ${lecture['subject']}',
//                 style: const TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 12),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:ui';
import 'package:edu_voice_main/screens/student/notification_screen.dart';
import 'package:flutter/material.dart';

import 't_profile_dashboard.dart';
import 'upload_video_screen.dart';
import 'teacher_lecture_details_screen.dart';
// import 'notification_screen.dart';
class TeacherDashboard extends StatefulWidget {
  const TeacherDashboard({super.key});

  @override
  State<TeacherDashboard> createState() => _TeacherDashboardState();
}

class _TeacherDashboardState extends State<TeacherDashboard> {
  // 🔥 Lecture List (updates after upload)
  List<Map<String, String>> todayLectures = [
    {'class': '9', 'subject': 'Mathematics'},
    {'class': '10', 'subject': 'Physics'},
    {'class': '11', 'subject': 'Computer Science'},
    {'class': '12', 'subject': 'Chemistry'},
  ];

  // ✅ OPEN UPLOAD + RECEIVE DATA
  void _openUpload() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const UploadVideoScreen()),
    );

    if (result != null && result is Map<String, String>) {
      setState(() {
        todayLectures.add(result);
      });
    }
  }

  void _openProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const TeacherProfileScreen()),
    );
  }

  void _openNotification() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const NotificationScreen()),
    );
  }

  void _openCalendar() async {
    await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: _openUpload,
      //   backgroundColor: const Color(0xFFFB923C),
      //   icon: const Icon(Icons.upload, color: Colors.white),
      //   label: const Text(
      //     "Upload Lecture",
      //     style: TextStyle(color: Colors.white),
      //   ),
      // ),
      body: SafeArea(
        child: Column(
          children: [
            // 🔥 HEADER
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFFB923C), Color(0xFF0077B6)],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.menu, color: Colors.white),
                      const Spacer(),
                      const Text(
                        "Eduverse",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                      ),
                      const Spacer(),
                      // const Icon(Icons.search, color: Colors.white),
                      const SizedBox(width: 8),

                      GestureDetector(
                        onTap: _openNotification,
                        child: const Icon(
                          Icons.notifications,
                          size: 25,
                          color: Colors.white,
                        ),
                      ),

                      const SizedBox(width: 8),

                      GestureDetector(
                        onTap: _openCalendar,
                        child: const Icon(
                          Icons.calendar_month,
                          size: 25,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  Row(
                    children: [
                      // 👤 PROFILE
                      GestureDetector(
                        onTap: _openProfile,
                        child: const CircleAvatar(
                          radius: 22,
                          backgroundImage: AssetImage(
                            'assets/images/t_placeholder.png',
                          ),
                        ),
                      ),

                      const SizedBox(width: 12),

                      const Expanded(
                        child: Text(
                          "Annie Duffy",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),

                      // ⬆️ NEW UPLOAD BUTTON (RIGHT SIDE)
                      GestureDetector(
                        onTap: _openUpload,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 223, 188, 29),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white24),
                          ),
                          child: const Row(
                            children: [
                              Icon(Icons.upload, color: Colors.white, size: 18),
                              SizedBox(width: 6),
                              Text(
                                "Upload",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // 📄 BODY
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  const Text(
                    "Hi, what would you learn today?",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 16),

                  // 🌈 SUBJECT GRID (GLASS + 2 SHADE)
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 2.6,
                    children: [
                      _glassSubject("Mathematics", [
                        Color.fromARGB(255, 230, 111, 111),
                        Color(0xFFFFA07A),
                      ], Icons.calculate),
                      _glassSubject("Physics", [
                        Color.fromARGB(255, 59, 116, 197),
                        Color.fromARGB(255, 110, 186, 227),
                      ], Icons.science),
                      _glassSubject("Chemistry", [
                        Color.fromARGB(255, 7, 215, 180),
                        Color(0xFF92FE9D),
                      ], Icons.biotech),
                      _glassSubject("Biology", [
                        Color.fromARGB(255, 49, 176, 92),
                        Color.fromARGB(255, 71, 247, 215),
                      ], Icons.eco),
                      _glassSubject("Reasoning", [
                        Color.fromARGB(255, 110, 73, 170),
                        Color.fromARGB(255, 223, 95, 184),
                      ], Icons.psychology),
                      _glassSubject("Social Science", [
                        Color.fromARGB(255, 210, 121, 88),
                        Color(0xFFF9F871),
                      ], Icons.public),
                    ],
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "Today's Lectures",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 12),

                  // 🎬 VIDEO STYLE LECTURES
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: todayLectures.map((lecture) {
                      return SizedBox(
                        width: (MediaQuery.of(context).size.width - 44) / 2,
                        child: _lectureVideoButton(lecture),
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 80),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ✨ GLASS SUBJECT CARD
  Widget _glassSubject(String title, List<Color> shades, IconData icon) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: shades),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: Colors.white.withOpacity(0.4)),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundColor: Colors.white,
                child: Icon(
                  icon,
                  color: const Color.fromARGB(255, 169, 168, 154),
                  size: 20,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 🎬 LECTURE VIDEO BUTTON
  Widget _lectureVideoButton(Map<String, String> lecture) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => TeacherLectureDetailsScreen(lecture: lecture),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Stack(
          children: [
            Container(
              height: 100,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/video_thumb.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // BackdropFilter(
            //   // filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
            //   child: Container(
            //     height: 120,
            //     color: Colors.black.withOpacity(0.25),
            //   ),
            // ),
            const Positioned.fill(
              child: Center(
                child: Icon(
                  Icons.play_circle_fill,
                  color: Colors.white,
                  size: 36,
                ),
              ),
            ),
            Positioned(
              bottom: 8,
              left: 8,
              right: 8,
              child: Text(
                'Class ${lecture['class']} - ${lecture['subject']}',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
