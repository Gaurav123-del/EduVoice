// import 'package:flutter/material.dart';
// import 'profile_screen.dart';
// import 'notification_screen.dart';
// import 'lecture_video_screen.dart';
// import 'ai_assistant_screen.dart';


// class StudentDashboard extends StatefulWidget {
//   const StudentDashboard({super.key});

//   @override
//   State<StudentDashboard> createState() => _StudentDashboardState();
// }

// class _StudentDashboardState extends State<StudentDashboard>
//     with SingleTickerProviderStateMixin {
//   final TextEditingController _searchController = TextEditingController();

//   late AnimationController _animationController;
//   late Animation<Offset> _slideAnimation;
//   late Animation<double> _fadeAnimation;

//   final List<Lecture> allLectures = [
//     Lecture(
//       topic: 'Machine Learning Basics',
//       subject: 'AI',
//       teacher: 'Prof. Sharma',
//       date: DateTime(2025, 8, 26),
//     ),
//     Lecture(
//       topic: 'Data Structures',
//       subject: 'Computer Science',
//       teacher: 'Prof. Kaur',
//       date: DateTime(2025, 9, 2),
//     ),
//     Lecture(
//       topic: 'Nationalism in India',
//       subject: 'Social Science',
//       teacher: 'Mrs. Singh',
//       date: DateTime(2025, 9, 2),
//     ),
//     Lecture(
//       topic: 'Periodic Classification of Elements',
//       subject: 'Science',
//       teacher: 'Mr. Iyer',
//       date: DateTime(2025, 7, 30),
//     ),
//     Lecture(
//       topic: 'Letter to Editor',
//       subject: 'Hindi',
//       teacher: 'Mrs. Gupta',
//       date: DateTime(2025, 7, 30),
//     ),
//   ];

//   List<Lecture> filteredLectures = [];
//   DateTime _selectedDate = DateTime.now();

//   @override
//   void initState() {
//     super.initState();

//     _searchController.addListener(_filterLectures);

//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 600),
//     );

//     _slideAnimation =
//         Tween<Offset>(begin: const Offset(0, 0.1), end: Offset.zero).animate(
//           CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
//         );

//     _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
//       CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
//     );

//     _animationController.forward();
//     _filterLectures();
//   }

//   @override
//   void dispose() {
//     _searchController.dispose();
//     _animationController.dispose();
//     super.dispose();
//   }

//   void _filterLectures() {
//     String query = _searchController.text.toLowerCase();
//     setState(() {
//       filteredLectures = allLectures.where((lecture) {
//         final matchQuery =
//             lecture.topic.toLowerCase().contains(query) ||
//             lecture.subject.toLowerCase().contains(query) ||
//             lecture.teacher.toLowerCase().contains(query);
//         final matchDate =
//             lecture.date.year == _selectedDate.year &&
//             lecture.date.month == _selectedDate.month &&
//             lecture.date.day == _selectedDate.day;
//         return matchQuery && matchDate;
//       }).toList();
//     });
//   }

//   Future<void> _pickDate() async {
//     DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: _selectedDate,
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2100),
//     );
//     if (picked != null) {
//       setState(() {
//         _selectedDate = picked;
//       });
//       _filterLectures();
//     }
//   }

//   bool _isToday(DateTime date) {
//     final now = DateTime.now();
//     return now.year == date.year &&
//         now.month == date.month &&
//         now.day == date.day;
//   }

//   @override
//   Widget build(BuildContext context) {
//     String dateLabel = _isToday(_selectedDate)
//         ? "Today's Lectures"
//         : "Lectures on ${_selectedDate.toLocal().toString().split(' ')[0]}";

//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Color.fromARGB(255, 231, 205, 181), Color.fromARGB(255, 121, 57, 14)],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: SafeArea(
//           child: Column(
//             children: [
//               // ✅ HEADER ROW
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 12,
//                   vertical: 10,
//                 ),
//                 child: Row(
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (_) => const ProfileScreen(),
//                           ),
//                         );
//                       },
//                       child: const CircleAvatar(
//                         radius: 20,
//                         backgroundImage: AssetImage(
//                           'assets/images/profile_placeholder.png',
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 8),
//                     Expanded(
//                       child: TextField(
//                         controller: _searchController,
//                         decoration: const InputDecoration(
//                           hintText: 'Search lectures...',
//                           prefixIcon: Icon(Icons.search),
//                           filled: true,
//                           fillColor: Colors.white,
//                           contentPadding: EdgeInsets.symmetric(vertical: 0),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.all(Radius.circular(30)),
//                             borderSide: BorderSide.none,
//                           ),
//                         ),
//                       ),
//                     ),
//                     IconButton(
//                       icon: const Icon(Icons.notifications, color: Colors.teal),
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (_) => const NotificationScreen(),
//                           ),
//                         );
//                       },
//                     ),
//                     IconButton(
//                       icon: const Icon(
//                         Icons.calendar_today,
//                         color: Colors.teal,
//                       ),
//                       onPressed: _pickDate,
//                     ),
//                   ],
//                 ),
//               ),

//               // ✅ LECTURE LIST HEADER
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 16,
//                   vertical: 4,
//                 ),
//                 child: Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     dateLabel,
//                     style: const TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.teal,
//                     ),
//                   ),
//                 ),
//               ),

//               // ✅ LECTURE LIST
//               Expanded(
//                 child: FadeTransition(
//                   opacity: _fadeAnimation,
//                   child: SlideTransition(
//                     position: _slideAnimation,
//                     child: ListView.builder(
//                       itemCount: filteredLectures.length,
//                       padding: const EdgeInsets.symmetric(horizontal: 16),
//                       itemBuilder: (_, index) {
//                         final lecture = filteredLectures[index];
//                         return Card(
//                           elevation: 3,
//                           margin: const EdgeInsets.symmetric(vertical: 6),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(15),
//                           ),
//                           child: InkWell(
//                             onTap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (_) =>
//                                       LectureVideoScreen(lecture:lecture),
//                                 ),
//                               );
//                             },
//                             child: Padding(
//                               padding: const EdgeInsets.all(16),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     "📚 Topic: ${lecture.topic}",
//                                     style: const TextStyle(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w600,
//                                     ),
//                                   ),
//                                   const SizedBox(height: 4),
//                                   Text("📖 Subject: ${lecture.subject}"),
//                                   const SizedBox(height: 4),
//                                   Text("👨‍🏫 Teacher: ${lecture.teacher}"),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//               ),

//               const Divider(height: 1),

//               // ✅ AI Assistant Icon Footer
//               Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 12),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(30),
//                     boxShadow: const [
//                       BoxShadow(color: Colors.black26, blurRadius: 5),
//                     ],
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const Text(
//                         'Need help? Ask AI!',
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           color: Colors.teal,
//                         ),
//                       ),
//                       IconButton(
//                         icon: const Icon(
//                           Icons.smart_toy_outlined,
//                           color: Colors.teal,
//                         ),
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (_) => const AIAssistantScreen(),
//                             ),
//                           );
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'profile_screen.dart';
// import 'notification_screen.dart';
// import 'lecture_video_screen.dart';
// import 'ai_assistant_screen.dart';

// class StudentDashboard extends StatefulWidget {
//   const StudentDashboard({super.key});

//   @override
//   State<StudentDashboard> createState() => _StudentDashboardState();
// }

// class _StudentDashboardState extends State<StudentDashboard>
//     with SingleTickerProviderStateMixin {
//   final TextEditingController _searchController = TextEditingController();

//   late AnimationController _animationController;
//   late Animation<Offset> _slideAnimation;
//   late Animation<double> _fadeAnimation;

//   final List<Lecture> allLectures = [
//     Lecture(
//       topic: 'Machine Learning Basics',
//       subject: 'AI',
//       teacher: 'Prof. Sharma',
//       date: DateTime(2025, 8, 26),
//     ),
//     Lecture(
//       topic: 'Data Structures',
//       subject: 'Computer Science',
//       teacher: 'Prof. Kaur',
//       date: DateTime(2025, 9, 2),
//     ),
//     Lecture(
//       topic: 'Nationalism in India',
//       subject: 'Social Science',
//       teacher: 'Mrs. Singh',
//       date: DateTime(2025, 9, 2),
//     ),
//     Lecture(
//       topic: 'Periodic Classification of Elements',
//       subject: 'Science',
//       teacher: 'Mr. Iyer',
//       date: DateTime(2025, 7, 30),
//     ),
//     Lecture(
//       topic: 'Letter to Editor',
//       subject: 'Hindi',
//       teacher: 'Mrs. Gupta',
//       date: DateTime(2025, 7, 30),
//     ),
//   ];

//   List<Lecture> filteredLectures = [];
//   DateTime _selectedDate = DateTime.now();

//   @override
//   void initState() {
//     super.initState();

//     _searchController.addListener(_filterLectures);

//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 600),
//     );

//     _slideAnimation =
//         Tween<Offset>(begin: const Offset(0, 0.1), end: Offset.zero).animate(
//           CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
//         );

//     _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
//       CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
//     );

//     _animationController.forward();
//     _filterLectures();
//   }

//   @override
//   void dispose() {
//     _searchController.dispose();
//     _animationController.dispose();
//     super.dispose();
//   }

//   void _filterLectures() {
//     String query = _searchController.text.toLowerCase();
//     setState(() {
//       filteredLectures = allLectures.where((lecture) {
//         final matchQuery =
//             lecture.topic.toLowerCase().contains(query) ||
//             lecture.subject.toLowerCase().contains(query) ||
//             lecture.teacher.toLowerCase().contains(query);
//         final matchDate =
//             lecture.date.year == _selectedDate.year &&
//             lecture.date.month == _selectedDate.month &&
//             lecture.date.day == _selectedDate.day;
//         return matchQuery && matchDate;
//       }).toList();
//     });
//   }

//   Future<void> _pickDate() async {
//     DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: _selectedDate,
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2100),
//     );
//     if (picked != null) {
//       setState(() {
//         _selectedDate = picked;
//       });
//       _filterLectures();
//     }
//   }

//   bool _isToday(DateTime date) {
//     final now = DateTime.now();
//     return now.year == date.year &&
//         now.month == date.month &&
//         now.day == date.day;
//   }

//   @override
//   Widget build(BuildContext context) {
//     String dateLabel = _isToday(_selectedDate)
//         ? "Today's Lectures"
//         : "Lectures on ${_selectedDate.toLocal().toString().split(' ')[0]}";

//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               Color.fromARGB(154, 108, 14, 18), 
//               Color.fromARGB(255, 126, 25, 25), 
//             ],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: SafeArea(
//           child: Column(
//             children: [
//               // ✅ HEADER ROW
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 12,
//                   vertical: 10,
//                 ),
//                 child: Row(
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (_) => const ProfileScreen(),
//                           ),
//                         );
//                       },
//                       child: const CircleAvatar(
//                         radius: 20,
//                         backgroundImage: AssetImage(
//                           'assets/images/profile_placeholder.png',
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 8),
//                     Expanded(
//                       child: TextField(
//                         controller: _searchController,
//                         decoration: InputDecoration(
//                           hintText: 'Search lectures...',
//                           prefixIcon:
//                               const Icon(Icons.search, color: Color.fromARGB(255, 13, 13, 13)),
//                           filled: true,
//                           fillColor: Colors.white,
//                           contentPadding:
//                               const EdgeInsets.symmetric(vertical: 0),
//                           border: const OutlineInputBorder(
//                             borderRadius: BorderRadius.all(Radius.circular(30)),
//                             borderSide: BorderSide.none,
//                           ),
//                         ),
//                       ),
//                     ),
//                     IconButton(
//                       icon: const Icon(Icons.notifications,
//                           color: Color.fromARGB(255, 255, 255, 255)),
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (_) => const NotificationScreen(),
//                           ),
//                         );
//                       },
//                     ),
//                     IconButton(
//                       icon: const Icon(Icons.calendar_today,
//                           color: Color(0xFF5D4848)),
//                       onPressed: _pickDate,
//                     ),
//                   ],
//                 ),
//               ),

//               // ✅ LECTURE LIST HEADER
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 16,
//                   vertical: 4,
//                 ),
//                 child: Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     dateLabel,
//                     style: const TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Color.fromARGB(255, 31, 64, 70), // Warm Orange
//                     ),
//                   ),
//                 ),
//               ),

//               // ✅ LECTURE LIST
//               Expanded(
//                 child: FadeTransition(
//                   opacity: _fadeAnimation,
//                   child: SlideTransition(
//                     position: _slideAnimation,
//                     child: ListView.builder(
//                       itemCount: filteredLectures.length,
//                       padding: const EdgeInsets.symmetric(horizontal: 16),
//                       itemBuilder: (_, index) {
//                         final lecture = filteredLectures[index];
//                         return Card(
//                           elevation: 3,
//                           color: const Color.fromARGB(255, 170, 214, 213), // Peach card
//                           margin: const EdgeInsets.symmetric(vertical: 6),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(15),
//                           ),
//                           child: InkWell(
//                             onTap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (_) =>
//                                       LectureVideoScreen(lecture: lecture),
//                                 ),
//                               );
//                             },
//                             child: Padding(
//                               padding: const EdgeInsets.all(16),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     "📚 Topic: ${lecture.topic}",
//                                     style: const TextStyle(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w600,
//                                       color: Color(0xFF5D4848), // Dark Brown
//                                     ),
//                                   ),
//                                   const SizedBox(height: 4),
//                                   Text(
//                                     "📖 Subject: ${lecture.subject}",
//                                     style: const TextStyle(
//                                         color: Color.fromARGB(255, 9, 81, 76)), // Brown
//                                   ),
//                                   const SizedBox(height: 4),
//                                   Text(
//                                     "👨‍🏫 Teacher: ${lecture.teacher}",
//                                     style: const TextStyle(
//                                         color: Color(0xFF9D614B)), // Brown
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//               ),

//               const Divider(height: 1, color: Color(0xFF9D614B)),

//               // ✅ AI Assistant Icon Footer
//               Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 12),
//                   decoration: BoxDecoration(
//                     color: const Color.fromARGB(255, 137, 138, 138), // Warm Orange footer
//                     borderRadius: BorderRadius.circular(30),
//                     boxShadow: const [
//                       BoxShadow(color: Colors.black26, blurRadius: 5),
//                     ],
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const Text(
//                         'Need help? Ask AI!',
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                       IconButton(
//                         icon: const Icon(
//                           Icons.smart_toy_outlined,
//                           color: Colors.white,
//                         ),
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (_) => const AIAssistantScreen(),
//                             ),
//                           );
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'profile_screen.dart';
// import 'notification_screen.dart';
// import 'lecture_video_screen.dart';
// import 'ai_assistant_screen.dart';

// class StudentDashboard extends StatefulWidget {
//   const StudentDashboard({super.key});

//   @override
//   State<StudentDashboard> createState() => _StudentDashboardState();
// }

// class _StudentDashboardState extends State<StudentDashboard>
//     with SingleTickerProviderStateMixin {
//   final TextEditingController _searchController = TextEditingController();

//   late AnimationController _animationController;
//   late Animation<Offset> _slideAnimation;
//   late Animation<double> _fadeAnimation;

//   final List<Lecture> allLectures = [
//     Lecture(
//       topic: 'Machine Learning Basics',
//       subject: 'AI',
//       teacher: 'Prof. Sharma',
//       date: DateTime(2025, 8, 26),
//     ),
//     Lecture(
//       topic: 'Data Structures',
//       subject: 'Computer Science',
//       teacher: 'Prof. Kaur',
//       date: DateTime(2025, 9, 2),
//     ),
//     Lecture(
//       topic: 'Nationalism in India',
//       subject: 'Social Science',
//       teacher: 'Mrs. Singh',
//       date: DateTime(2025, 9, 2),
//     ),
//     Lecture(
//       topic: 'Periodic Classification of Elements',
//       subject: 'Science',
//       teacher: 'Mr. Iyer',
//       date: DateTime(2025, 7, 30),
//     ),
//     Lecture(
//       topic: 'Letter to Editor',
//       subject: 'Hindi',
//       teacher: 'Mrs. Gupta',
//       date: DateTime(2025, 7, 30),
//     ),
//   ];

//   List<Lecture> filteredLectures = [];
//   DateTime _selectedDate = DateTime.now();

//   @override
//   void initState() {
//     super.initState();
//     _searchController.addListener(_filterLectures);

//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 600),
//     );

//     _slideAnimation =
//         Tween<Offset>(begin: const Offset(0, 0.1), end: Offset.zero).animate(
//           CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
//         );

//     _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
//       CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
//     );

//     _animationController.forward();
//     _filterLectures();
//   }

//   @override
//   void dispose() {
//     _searchController.dispose();
//     _animationController.dispose();
//     super.dispose();
//   }

//   void _filterLectures() {
//     String query = _searchController.text.toLowerCase();
//     setState(() {
//       filteredLectures = allLectures.where((lecture) {
//         final matchQuery =
//             lecture.topic.toLowerCase().contains(query) ||
//             lecture.subject.toLowerCase().contains(query) ||
//             lecture.teacher.toLowerCase().contains(query);
//         final matchDate =
//             lecture.date.year == _selectedDate.year &&
//             lecture.date.month == _selectedDate.month &&
//             lecture.date.day == _selectedDate.day;
//         return matchQuery && matchDate;
//       }).toList();
//     });
//   }

//   Future<void> _pickDate() async {
//     DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: _selectedDate,
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2100),
//     );
//     if (picked != null) {
//       setState(() {
//         _selectedDate = picked;
//       });
//       _filterLectures();
//     }
//   }

//   bool _isToday(DateTime date) {
//     final now = DateTime.now();
//     return now.year == date.year &&
//         now.month == date.month &&
//         now.day == date.day;
//   }

//   @override
//   Widget build(BuildContext context) {
//     String dateLabel = _isToday(_selectedDate)
//         ? "Today's Lectures"
//         : "Lectures on ${_selectedDate.toLocal().toString().split(' ')[0]}";

//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Color(0xFF4e54c8), Color(0xFF8f94fb)], // Indigo → Purple
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: SafeArea(
//           child: Column(
//             children: [
//               // ✅ HEADER ROW
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
//                 child: Row(
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (_) => const ProfileScreen(),
//                           ),
//                         );
//                       },
//                       child: const CircleAvatar(
//                         radius: 22,
//                         backgroundImage: AssetImage(
//                           'assets/images/profile_placeholder.png',
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 10),
//                     Expanded(
//                       child: TextField(
//                         controller: _searchController,
//                         decoration: InputDecoration(
//                           hintText: 'Search lectures...',
//                           hintStyle: const TextStyle(color: Colors.black54),
//                           prefixIcon:
//                               const Icon(Icons.search, color: Colors.black87),
//                           filled: true,
//                           fillColor: Colors.white,
//                           contentPadding: const EdgeInsets.symmetric(vertical: 0),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(30),
//                             borderSide: BorderSide.none,
//                           ),
//                         ),
//                       ),
//                     ),
//                     IconButton(
//                       icon: const Icon(Icons.notifications,
//                           color: Colors.white, size: 28),
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (_) => const NotificationScreen(),
//                           ),
//                         );
//                       },
//                     ),
//                     IconButton(
//                       icon: const Icon(Icons.calendar_today,
//                           color: Colors.white, size: 24),
//                       onPressed: _pickDate,
//                     ),
//                   ],
//                 ),
//               ),

//               // ✅ LECTURE LIST HEADER
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
//                 child: Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     dateLabel,
//                     style: const TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),

//               // ✅ LECTURE LIST
//               Expanded(
//                 child: FadeTransition(
//                   opacity: _fadeAnimation,
//                   child: SlideTransition(
//                     position: _slideAnimation,
//                     child: ListView.builder(
//                       itemCount: filteredLectures.length,
//                       padding: const EdgeInsets.symmetric(horizontal: 16),
//                       itemBuilder: (_, index) {
//                         final lecture = filteredLectures[index];
//                         return Card(
//                           elevation: 5,
//                           color: Colors.white,
//                           margin: const EdgeInsets.symmetric(vertical: 8),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(18),
//                           ),
//                           child: InkWell(
//                             borderRadius: BorderRadius.circular(18),
//                             onTap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (_) =>
//                                       LectureVideoScreen(lecture: lecture),
//                                 ),
//                               );
//                             },
//                             child: Padding(
//                               padding: const EdgeInsets.all(16),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     "📚 ${lecture.topic}",
//                                     style: const TextStyle(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w600,
//                                       color: Color(0xFF4e54c8),
//                                     ),
//                                   ),
//                                   const SizedBox(height: 4),
//                                   Text(
//                                     "📖 ${lecture.subject}",
//                                     style: const TextStyle(
//                                         fontSize: 14,
//                                         color: Colors.black87,
//                                         fontWeight: FontWeight.w500),
//                                   ),
//                                   const SizedBox(height: 4),
//                                   Text(
//                                     "👨‍🏫 ${lecture.teacher}",
//                                     style: const TextStyle(
//                                       fontSize: 13,
//                                       color: Color.fromARGB(255, 158, 158, 158),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//               ),

//               // const Divider(height: 1, color: Color(0xFF00c6ff)),

//               // ✅ AI Assistant Icon Footer
//               Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: Container(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
//                   decoration: BoxDecoration(
//                     gradient: const LinearGradient(
//                       colors: [Color(0xFF00c6ff), Color(0xFF0072ff)],
//                       begin: Alignment.centerLeft,
//                       end: Alignment.centerRight,
//                     ),
//                     borderRadius: BorderRadius.circular(30),
//                     boxShadow: const [
//                       BoxShadow(color: Colors.black26, blurRadius: 6),
//                     ],
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const Text(
//                         'Need help? Ask AI!',
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                       IconButton(
//                         icon: const Icon(Icons.smart_toy_outlined,
//                             color: Colors.white, size: 28),
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (_) => const AIAssistantScreen(),
//                             ),
//                           );
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'profile_screen.dart';
// import 'notification_screen.dart';
// import 'lecture_video_screen.dart';
// import 'ai_assistant_screen.dart';

// class StudentDashboard extends StatefulWidget {
//   const StudentDashboard({super.key});

//   @override
//   State<StudentDashboard> createState() => _StudentDashboardState();
// }

// class _StudentDashboardState extends State<StudentDashboard>
//     with SingleTickerProviderStateMixin {
//   final TextEditingController _searchController = TextEditingController();

//   late AnimationController _animationController;
//   late Animation<Offset> _slideAnimation;
//   late Animation<double> _fadeAnimation;

//   final List<Lecture> allLectures = [
//     Lecture(
//       topic: 'Machine Learning Basics',
//       subject: 'AI',
//       teacher: 'Prof. Sharma',
//       date: DateTime(2025, 8, 26),
//     ),
//     Lecture(
//       topic: 'Data Structures',
//       subject: 'Computer Science',
//       teacher: 'Prof. Kaur',
//       date: DateTime(2025, 9, 2),
//     ),
//     Lecture(
//       topic: 'Nationalism in India',
//       subject: 'Social Science',
//       teacher: 'Mrs. Singh',
//       date: DateTime(2025, 9, 2),
//     ),
//     Lecture(
//       topic: 'Periodic Classification of Elements',
//       subject: 'Science',
//       teacher: 'Mr. Iyer',
//       date: DateTime(2025, 7, 30),
//     ),
//     Lecture(
//       topic: 'Letter to Editor',
//       subject: 'Hindi',
//       teacher: 'Mrs. Gupta',
//       date: DateTime(2025, 7, 30),
//     ),
//   ];

//   List<Lecture> filteredLectures = [];
//   DateTime _selectedDate = DateTime.now();

//   @override
//   void initState() {
//     super.initState();

//     _searchController.addListener(_filterLectures);

//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 600),
//     );

//     _slideAnimation =
//         Tween<Offset>(begin: const Offset(0, 0.1), end: Offset.zero).animate(
//           CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
//         );

//     _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
//       CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
//     );

//     _animationController.forward();
//     _filterLectures();
//   }

//   @override
//   void dispose() {
//     _searchController.dispose();
//     _animationController.dispose();
//     super.dispose();
//   }

//   void _filterLectures() {
//     String query = _searchController.text.toLowerCase();
//     setState(() {
//       filteredLectures = allLectures.where((lecture) {
//         final matchQuery =
//             lecture.topic.toLowerCase().contains(query) ||
//             lecture.subject.toLowerCase().contains(query) ||
//             lecture.teacher.toLowerCase().contains(query);
//         final matchDate =
//             lecture.date.year == _selectedDate.year &&
//             lecture.date.month == _selectedDate.month &&
//             lecture.date.day == _selectedDate.day;
//         return matchQuery && matchDate;
//       }).toList();
//     });
//   }

//   Future<void> _pickDate() async {
//     DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: _selectedDate,
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2100),
//     );
//     if (picked != null) {
//       setState(() {
//         _selectedDate = picked;
//       });
//       _filterLectures();
//     }
//   }

//   bool _isToday(DateTime date) {
//     final now = DateTime.now();
//     return now.year == date.year &&
//         now.month == date.month &&
//         now.day == date.day;
//   }

//   @override
//   Widget build(BuildContext context) {
//     String dateLabel = _isToday(_selectedDate)
//         ? "Today's Lectures"
//         : "Lectures on ${_selectedDate.toLocal().toString().split(' ')[0]}";

//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Color(0xFF2C2C2C), Color(0xFF1A1A1A)],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: SafeArea(
//           child: Column(
//             children: [
//               // ✅ HEADER ROW (Glass Effect)
//               _buildGlassHeader(),

//               // ✅ LECTURE LIST HEADER
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//                 child: Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     dateLabel,
//                     style: const TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white70,
//                     ),
//                   ),
//                 ),
//               ),

//               // ✅ LECTURE LIST
//               Expanded(
//                 child: FadeTransition(
//                   opacity: _fadeAnimation,
//                   child: SlideTransition(
//                     position: _slideAnimation,
//                     child: ListView.builder(
//                       itemCount: filteredLectures.length,
//                       padding: const EdgeInsets.symmetric(horizontal: 16),
//                       itemBuilder: (_, index) {
//                         final lecture = filteredLectures[index];
//                         return _buildGlassCard(lecture);
//                       },
//                     ),
//                   ),
//                 ),
//               ),

//               // ✅ FOOTER GLASS AI BAR
//               _buildGlassFooter(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // Glassmorphic Header
//   Widget _buildGlassHeader() {
//     return Padding(
//       padding: const EdgeInsets.all(12.0),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(20),
//         child: BackdropFilter(
//           filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
//           child: Container(
//             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//             decoration: BoxDecoration(
//               color: Colors.white.withOpacity(0.1),
//               borderRadius: BorderRadius.circular(20),
//               border: Border.all(color: Colors.white.withOpacity(0.2)),
//             ),
//             child: Row(
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (_) => const ProfileScreen()));
//                   },
//                   child: const CircleAvatar(
//                     radius: 20,
//                     backgroundImage:
//                         AssetImage('assets/images/profile_placeholder.png'),
//                   ),
//                 ),
//                 const SizedBox(width: 8),
//                 Expanded(
//                   child: TextField(
//                     controller: _searchController,
//                     style: const TextStyle(color: Colors.white),
//                     decoration: InputDecoration(
//                       hintText: 'Search lectures...',
//                       hintStyle: const TextStyle(color: Colors.white70),
//                       prefixIcon: const Icon(Icons.search, color: Colors.white70),
//                       filled: true,
//                       fillColor: Colors.white.withOpacity(0.05),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(30),
//                         borderSide: BorderSide.none,
//                       ),
//                       contentPadding: const EdgeInsets.symmetric(vertical: 0),
//                     ),
//                   ),
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.notifications, color: Colors.white70),
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (_) => const NotificationScreen()),
//                     );
//                   },
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.calendar_today, color: Colors.white70),
//                   onPressed: _pickDate,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   // Glassmorphic Lecture Card
//   Widget _buildGlassCard(Lecture lecture) {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(20),
//       child: BackdropFilter(
//         filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
//         child: Container(
//           margin: const EdgeInsets.symmetric(vertical: 8),
//           padding: const EdgeInsets.all(16),
//           decoration: BoxDecoration(
//             color: Colors.white.withOpacity(0.08),
//             borderRadius: BorderRadius.circular(20),
//             border: Border.all(color: Colors.white.withOpacity(0.2)),
//           ),
//           child: InkWell(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (_) => LectureVideoScreen(lecture: lecture)),
//               );
//             },
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "📚 ${lecture.topic}",
//                   style: const TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.white,
//                   ),
//                 ),
//                 const SizedBox(height: 4),
//                 Text("📖 ${lecture.subject}",
//                     style: const TextStyle(color: Colors.white70)),
//                 const SizedBox(height: 4),
//                 Text("👨‍🏫 ${lecture.teacher}",
//                     style: const TextStyle(color: Colors.white54)),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   // Glassmorphic Footer
//   Widget _buildGlassFooter() {
//     return Padding(
//       padding: const EdgeInsets.all(12.0),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(30),
//         child: BackdropFilter(
//           filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
//           child: Container(
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//             decoration: BoxDecoration(
//               color: Colors.white.withOpacity(0.1),
//               borderRadius: BorderRadius.circular(30),
//               border: Border.all(color: Colors.white.withOpacity(0.2)),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Text(
//                   'Need help? Ask AI!',
//                   style: TextStyle(
//                       fontWeight: FontWeight.bold, color: Colors.white70),
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.smart_toy_outlined, color: Colors.white),
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (_) => const AIAssistantScreen()),
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// // Dummy Lecture class for your context
// // class Lecture {
// //   final String topic;
// //   final String subject;
// //   final String teacher;
// //   final DateTime date;

// //   Lecture({
// //     required this.topic,
// //     required this.subject,
// //     required this.teacher,
// //     required this.date,
// //   });
// // }
// 🎨 Student Dashboard with Minimal Grey + Neon Accent (Glassmorphic UI)

// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'profile_screen.dart';
// import 'notification_screen.dart';
// import 'lecture_video_screen.dart';
// import 'ai_assistant_screen.dart';

// class StudentDashboard extends StatefulWidget {
//   const StudentDashboard({super.key});

//   @override
//   State<StudentDashboard> createState() => _StudentDashboardState();
// }

// class _StudentDashboardState extends State<StudentDashboard>
//     with SingleTickerProviderStateMixin {
//   final TextEditingController _searchController = TextEditingController();

//   late AnimationController _animationController;
//   late Animation<Offset> _slideAnimation;
//   late Animation<double> _fadeAnimation;

//   final List<Lecture> allLectures = [
//     Lecture(topic: 'Machine Learning Basics', subject: 'AI', teacher: 'Prof. Sharma', date: DateTime(2025, 8, 26)),
//     Lecture(topic: 'Data Structures', subject: 'Computer Science', teacher: 'Prof. Kaur', date: DateTime(2025, 9, 2)),
//     Lecture(topic: 'Nationalism in India', subject: 'Social Science', teacher: 'Mrs. Singh', date: DateTime(2025, 9, 2)),
//     Lecture(topic: 'Periodic Classification of Elements', subject: 'Science', teacher: 'Mr. Iyer', date: DateTime(2025, 7, 30)),
//     Lecture(topic: 'Letter to Editor', subject: 'Hindi', teacher: 'Mrs. Gupta', date: DateTime(2025, 7, 30)),
//   ];

//   List<Lecture> filteredLectures = [];
//   DateTime _selectedDate = DateTime.now();

//   @override
//   void initState() {
//     super.initState();
//     _searchController.addListener(_filterLectures);

//     _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 600));

//     _slideAnimation = Tween<Offset>(begin: const Offset(0, 0.1), end: Offset.zero).animate(
//       CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
//     );

//     _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
//       CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
//     );

//     _animationController.forward();
//     _filterLectures();
//   }

//   @override
//   void dispose() {
//     _searchController.dispose();
//     _animationController.dispose();
//     super.dispose();
//   }

//   void _filterLectures() {
//     String query = _searchController.text.toLowerCase();
//     setState(() {
//       filteredLectures = allLectures.where((lecture) {
//         final matchQuery = lecture.topic.toLowerCase().contains(query) ||
//             lecture.subject.toLowerCase().contains(query) ||
//             lecture.teacher.toLowerCase().contains(query);
//         final matchDate = lecture.date.year == _selectedDate.year &&
//             lecture.date.month == _selectedDate.month &&
//             lecture.date.day == _selectedDate.day;
//         return matchQuery && matchDate;
//       }).toList();
//     });
//   }

//   Future<void> _pickDate() async {
//     DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: _selectedDate,
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2100),
//     );
//     if (picked != null) {
//       setState(() => _selectedDate = picked);
//       _filterLectures();
//     }
//   }

//   bool _isToday(DateTime date) {
//     final now = DateTime.now();
//     return now.year == date.year && now.month == date.month && now.day == date.day;
//   }

//   @override
//   Widget build(BuildContext context) {
//     String dateLabel = _isToday(_selectedDate)
//         ? "Today's Lectures"
//         : "Lectures on ${_selectedDate.toLocal().toString().split(' ')[0]}";

//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Color(0xFF2A2A2A), Color(0xFF121212)], // Dark grey → black
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: SafeArea(
//           child: Column(
//             children: [
//               _buildGlassHeader(),

//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//                 child: Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     dateLabel,
//                     style: const TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.cyanAccent, // ✅ Neon accent
//                     ),
//                   ),
//                 ),
//               ),

//               Expanded(
//                 child: FadeTransition(
//                   opacity: _fadeAnimation,
//                   child: SlideTransition(
//                     position: _slideAnimation,
//                     child: ListView.builder(
//                       itemCount: filteredLectures.length,
//                       padding: const EdgeInsets.symmetric(horizontal: 16),
//                       itemBuilder: (_, index) {
//                         final lecture = filteredLectures[index];
//                         return _buildGlassCard(lecture);
//                       },
//                     ),
//                   ),
//                 ),
//               ),

//               _buildGlassFooter(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // ✅ Neon Glassmorphic Header
//   Widget _buildGlassHeader() {
//     return Padding(
//       padding: const EdgeInsets.all(12.0),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(20),
//         child: BackdropFilter(
//           filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
//           child: Container(
//             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//             decoration: BoxDecoration(
//               color: Colors.white.withOpacity(0.05),
//               borderRadius: BorderRadius.circular(20),
//               border: Border.all(color: Colors.cyanAccent.withOpacity(0.6), width: 1.2), // ✅ Neon border
//               boxShadow: [
//                 BoxShadow(color: Colors.cyanAccent.withOpacity(0.3), blurRadius: 12, spreadRadius: 2),
//               ],
//             ),
//             child: Row(
//               children: [
//                 GestureDetector(
//                   onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ProfileScreen())),
//                   child: const CircleAvatar(
//                     radius: 20,
//                     backgroundImage: AssetImage('assets/images/profile_placeholder.png'),
//                   ),
//                 ),
//                 const SizedBox(width: 8),
//                 Expanded(
//                   child: TextField(
//                     controller: _searchController,
//                     style: const TextStyle(color: Colors.white),
//                     decoration: InputDecoration(
//                       hintText: 'Search lectures...',
//                       hintStyle: const TextStyle(color: Colors.white54),
//                       prefixIcon: const Icon(Icons.search, color: Colors.cyanAccent),
//                       filled: true,
//                       fillColor: Colors.white.withOpacity(0.03),
//                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
//                     ),
//                   ),
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.notifications, color: Colors.cyanAccent),
//                   onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const NotificationScreen())),
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.calendar_today, color: Colors.cyanAccent),
//                   onPressed: _pickDate,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   // ✅ Neon Glass Card
//   Widget _buildGlassCard(Lecture lecture) {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(20),
//       child: BackdropFilter(
//         filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
//         child: Container(
//           margin: const EdgeInsets.symmetric(vertical: 8),
//           padding: const EdgeInsets.all(16),
//           decoration: BoxDecoration(
//             color: Colors.white.withOpacity(0.06),
//             borderRadius: BorderRadius.circular(20),
//             border: Border.all(color: Colors.cyanAccent.withOpacity(0.5)),
//             boxShadow: [
//               BoxShadow(color: Colors.cyanAccent.withOpacity(0.2), blurRadius: 10, spreadRadius: 1),
//             ],
//           ),
//           child: InkWell(
//             onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => LectureVideoScreen(lecture: lecture))),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text("📚 ${lecture.topic}",
//                     style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white)),
//                 const SizedBox(height: 4),
//                 Text("📖 ${lecture.subject}", style: const TextStyle(color: Colors.cyanAccent)),
//                 const SizedBox(height: 4),
//                 Text("👨‍🏫 ${lecture.teacher}", style: const TextStyle(color: Colors.white54)),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   // ✅ Neon Footer AI Assistant
//   Widget _buildGlassFooter() {
//     return Padding(
//       padding: const EdgeInsets.all(12.0),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(30),
//         child: BackdropFilter(
//           filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
//           child: Container(
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//             decoration: BoxDecoration(
//               color: Colors.white.withOpacity(0.05),
//               borderRadius: BorderRadius.circular(30),
//               border: Border.all(color: Colors.cyanAccent.withOpacity(0.6)),
//               boxShadow: [BoxShadow(color: Colors.cyanAccent.withOpacity(0.4), blurRadius: 12, spreadRadius: 2)],
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Text('Need help? Ask AI!',
//                     style: TextStyle(fontWeight: FontWeight.bold, color: Colors.cyanAccent)),
//                 IconButton(
//                   icon: const Icon(Icons.smart_toy_outlined, color: Colors.cyanAccent, size: 28),
//                   onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AIAssistantScreen())),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'profile_screen.dart';
// import 'notification_screen.dart';
// import 'lecture_video_screen.dart';
// import 'ai_assistant_screen.dart';

// class StudentDashboard extends StatefulWidget {
//   const StudentDashboard({super.key});

//   @override
//   State<StudentDashboard> createState() => _StudentDashboardState();
// }

// class _StudentDashboardState extends State<StudentDashboard>
//     with SingleTickerProviderStateMixin {
//   final TextEditingController _searchController = TextEditingController();

//   late AnimationController _animationController;
//   late Animation<Offset> _slideAnimation;
//   late Animation<double> _fadeAnimation;

//   final List<Lecture> allLectures = [
//     Lecture(
//         topic: 'Machine Learning Basics',
//         subject: 'AI',
//         teacher: 'Prof. Sharma',
//         date: DateTime(2025, 11, 26)),
//     Lecture(
//         topic: 'Data Structures',
//         subject: 'Computer Science',
//         teacher: 'Prof. Kaur',
//         date: DateTime(2026, 2, 16)),
//     Lecture(
//         topic: 'Nationalism in India',
//         subject: 'Social Science',
//         teacher: 'Mrs. Singh',
//         date: DateTime(2025, 11, 2)),
//     Lecture(
//         topic: 'Periodic Classification of Elements',
//         subject: 'Science',
//         teacher: 'Mr. Iyer',
//         date: DateTime(2025, 11, 30)),
//     Lecture(
//         topic: 'Letter to Editor',
//         subject: 'Hindi',
//         teacher: 'Mrs. Gupta',
//         date: DateTime(2025, 11, 30)),
//   ];

//   List<Lecture> filteredLectures = [];
//   DateTime _selectedDate = DateTime.now();

//   @override
//   void initState() {
//     super.initState();
//     _searchController.addListener(_filterLectures);

//     _animationController = AnimationController(
//         vsync: this, duration: const Duration(milliseconds: 600));

//     _slideAnimation = Tween<Offset>(
//             begin: const Offset(0, 0.1), end: Offset.zero)
//         .animate(CurvedAnimation(
//             parent: _animationController, curve: Curves.easeOut));

//     _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
//         CurvedAnimation(parent: _animationController, curve: Curves.easeIn));

//     _animationController.forward();
//     _filterLectures();
//   }

//   @override
//   void dispose() {
//     _searchController.dispose();
//     _animationController.dispose();
//     super.dispose();
//   }

//   void _filterLectures() {
//     String query = _searchController.text.toLowerCase();
//     setState(() {
//       filteredLectures = allLectures.where((lecture) {
//         final matchQuery = lecture.topic.toLowerCase().contains(query) ||
//             lecture.subject.toLowerCase().contains(query) ||
//             lecture.teacher.toLowerCase().contains(query);
//         final matchDate =
//             lecture.date.year == _selectedDate.year &&
//                 lecture.date.month == _selectedDate.month &&
//                 lecture.date.day == _selectedDate.day;
//         return matchQuery && matchDate;
//       }).toList();
//     });
//   }

//   Future<void> _pickDate() async {
//     DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: _selectedDate,
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2100),
//     );
//     if (picked != null) {
//       setState(() => _selectedDate = picked);
//       _filterLectures();
//     }
//   }

//   bool _isToday(DateTime date) {
//     final now = DateTime.now();
//     return now.year == date.year &&
//         now.month == date.month &&
//         now.day == date.day;
//   }

//   @override
//   Widget build(BuildContext context) {
//     String dateLabel = _isToday(_selectedDate)
//         ? "Today's Lectures"
//         : "Lectures on ${_selectedDate.toLocal().toString().split(' ')[0]}";

//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Color(0xFFFB923C), Color(0xFF0077B6)],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: SafeArea(
//           child: Column(
//             children: [
//               _buildGlassHeader(),

//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//                 child: Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     dateLabel,
//                     style: const TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white, // white for readability
//                     ),
//                   ),
//                 ),
//               ),

//               Expanded(
//                 child: FadeTransition(
//                   opacity: _fadeAnimation,
//                   child: SlideTransition(
//                     position: _slideAnimation,
//                     child: ListView.builder(
//                       itemCount: filteredLectures.length,
//                       padding: const EdgeInsets.symmetric(horizontal: 16),
//                       itemBuilder: (_, index) {
//                         final lecture = filteredLectures[index];
//                         return _buildGlassCard(lecture);
//                       },
//                     ),
//                   ),
//                 ),
//               ),

//               _buildGlassFooter(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // Glassmorphic Header
//   Widget _buildGlassHeader() {
//     return Padding(
//       padding: const EdgeInsets.all(12.0),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(20),
//         child: BackdropFilter(
//           filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
//           child: Container(
//             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//             decoration: BoxDecoration(
//               color: Colors.white.withOpacity(0.08),
//               borderRadius: BorderRadius.circular(20),
//               border: Border.all(
//                   color: Colors.orangeAccent.withOpacity(0.6), width: 1.2),
//               boxShadow: [
//                 BoxShadow(
//                     color: Colors.blueAccent.withOpacity(0.3),
//                     blurRadius: 12,
//                     spreadRadius: 2),
//               ],
//             ),
//             child: Row(
//               children: [
//                 GestureDetector(
//                   onTap: () => Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (_) => const ProfileScreen())),
//                   child: const CircleAvatar(
//                     radius: 20,
//                     backgroundImage:
//                         AssetImage('assets/images/profile_placeholder.png'),
//                   ),
//                 ),
//                 const SizedBox(width: 8),
//                 Expanded(
//                   child: TextField(
//                     controller: _searchController,
//                     style: const TextStyle(color: Colors.white),
//                     decoration: InputDecoration(
//                       hintText: 'Search lectures...',
//                       hintStyle: const TextStyle(color: Colors.white70),
//                       prefixIcon:
//                           const Icon(Icons.search, color: Colors.orangeAccent),
//                       filled: true,
//                       fillColor: Colors.white.withOpacity(0.05),
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(30),
//                           borderSide: BorderSide.none),
//                     ),
//                   ),
//                 ),
//                 IconButton(
//                   icon:
//                       const Icon(Icons.notifications, color: Colors.blueAccent),
//                   onPressed: () => Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (_) => const NotificationScreen())),
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.calendar_today,
//                       color: Colors.orangeAccent),
//                   onPressed: _pickDate,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   // Glassmorphic Lecture Card
//   Widget _buildGlassCard(Lecture lecture) {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(20),
//       child: BackdropFilter(
//         filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
//         child: Container(
//           margin: const EdgeInsets.symmetric(vertical: 8),
//           padding: const EdgeInsets.all(16),
//           decoration: BoxDecoration(
//             color: Colors.white.withOpacity(0.08),
//             borderRadius: BorderRadius.circular(20),
//             border: Border.all(color: Colors.blueAccent.withOpacity(0.5)),
//             boxShadow: [
//               BoxShadow(
//                   color: Colors.orangeAccent.withOpacity(0.3),
//                   blurRadius: 10,
//                   spreadRadius: 1),
//             ],
//           ),
//           child: InkWell(
//             onTap: () => Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (_) => LectureVideoScreen(lecture: lecture))),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text("📚 ${lecture.topic}",
//                     style: const TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.white)),
//                 const SizedBox(height: 4),
//                 Text("📖 ${lecture.subject}",
//                     style: const TextStyle(color: Colors.orangeAccent)),
//                 const SizedBox(height: 4),
//                 Text("👨‍🏫 ${lecture.teacher}",
//                     style: const TextStyle(color: Colors.white70)),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   // Glassmorphic Footer AI Assistant
//   Widget _buildGlassFooter() {
//     return Padding(
//       padding: const EdgeInsets.all(12.0),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(30),
//         child: BackdropFilter(
//           filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
//           child: Container(
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//             decoration: BoxDecoration(
//               color: Colors.white.withOpacity(0.08),
//               borderRadius: BorderRadius.circular(30),
//               border: Border.all(color: Colors.orangeAccent.withOpacity(0.6)),
//               boxShadow: [
//                 BoxShadow(
//                     color: Colors.blueAccent.withOpacity(0.4),
//                     blurRadius: 12,
//                     spreadRadius: 2)
//               ],
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Text('Need help? Ask AI!',
//                     style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         color: Colors.orangeAccent)),
//                 IconButton(
//                   icon: const Icon(Icons.smart_toy_outlined,
//                       color: Colors.blueAccent, size: 28),
//                   onPressed: () => Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (_) => const AIAssistantScreen())),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }



import 'dart:ui';
import 'package:flutter/material.dart';
import 'profile_screen.dart';
import 'notification_screen.dart';
import 'lecture_video_screen.dart';
import 'ai_assistant_screen.dart';

class StudentDashboard extends StatefulWidget {
  const StudentDashboard({super.key});

  @override
  State<StudentDashboard> createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard>
    with SingleTickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  final List<Lecture> allLectures = [
    Lecture(
        topic: 'Machine Learning Basics',
        subject: 'AI',
        teacher: 'Prof. Sharma',
        date: DateTime(2025, 11, 26)),
    Lecture(
        topic: 'Data Structures',
        subject: 'Computer Science',
        teacher: 'Prof. Kaur',
        date: DateTime(2026, 2, 18)),
    Lecture(
        topic: 'Nationalism in India',
        subject: 'Social Science',
        teacher: 'Mrs. Singh',
        date: DateTime(2026, 2, 19)),
    Lecture(
        topic: 'Periodic Classification of Elements',
        subject: 'Science',
        teacher: 'Mr. Iyer',
        date: DateTime(2026, 2, 19)),
    Lecture(
        topic: 'Letter to Editor',
        subject: 'Hindi',
        teacher: 'Mrs. Gupta',
        date: DateTime(2026, 2, 19)),
  ];

  List<Lecture> filteredLectures = [];
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));

    _fadeAnimation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeOut);

    _searchController.addListener(_filterLectures);

    _animationController.forward();
    _filterLectures();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _filterLectures() {
    final query = _searchController.text.toLowerCase();

    filteredLectures = allLectures.where((lecture) {
      final matchQuery = lecture.topic.toLowerCase().contains(query) ||
          lecture.subject.toLowerCase().contains(query) ||
          lecture.teacher.toLowerCase().contains(query);

      final matchDate = lecture.date.year == _selectedDate.year &&
          lecture.date.month == _selectedDate.month &&
          lecture.date.day == _selectedDate.day;

      return matchQuery && matchDate;
    }).toList();

    setState(() {});
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      _selectedDate = picked;
      _filterLectures();
    }
  }

  bool _isToday(DateTime date) {
    final now = DateTime.now();
    return now.year == date.year &&
        now.month == date.month &&
        now.day == date.day;
  }

  @override
  Widget build(BuildContext context) {
    String dateLabel = _isToday(_selectedDate)
        ? "Today's Lectures"
        : "Lectures on ${_selectedDate.toLocal().toString().split(' ')[0]}";

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFB923C), Color(0xFF0077B6)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildGlassHeader(),

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    dateLabel,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ),
              ),

              Expanded(
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: filteredLectures.isEmpty
                      ? _emptyState()
                      : ListView.builder(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 16),
                          itemCount: filteredLectures.length,
                          itemBuilder: (_, index) =>
                              _buildGlassCard(filteredLectures[index]),
                        ),
                ),
              ),

              _buildGlassFooter(),
            ],
          ),
        ),
      ),
    );
  }

  // ⭐ HEADER
  Widget _buildGlassHeader() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(26),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.07),
              borderRadius: BorderRadius.circular(26),
              border: Border.all(color: Colors.white24),
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const ProfileScreen())),
                  child: const CircleAvatar(
                    radius: 22,
                    backgroundImage: AssetImage(
                        'assets/images/profile_placeholder.png'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Search lectures...',
                      hintStyle: const TextStyle(color: Colors.white60),
                      prefixIcon:
                          const Icon(Icons.search, color: Colors.white70),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.06),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.notifications_none,
                      color: Colors.white),
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const NotificationScreen())),
                ),
                IconButton(
                  icon: const Icon(Icons.calendar_month,
                      color: Colors.orangeAccent),
                  onPressed: _pickDate,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ⭐ GLASS SUBJECT CARD (UPGRADED)
Widget _buildGlassCard(Lecture lecture) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(26),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: InkWell(
          borderRadius: BorderRadius.circular(26),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => LectureVideoScreen(lecture: lecture),
            ),
          ),
          child: Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(26),

              /// ⭐ GLASS BACKGROUND
              color: Colors.white.withOpacity(0.08),

              /// ⭐ GLASS BORDER (THIS IS WHAT YOU WANT)
              border: Border.all(
                color: Colors.white.withOpacity(0.35),
                width: 1.5,
              ),

              /// ⭐ SOFT GLOW SHADOW
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 15,
                  spreadRadius: 1,
                ),
              ],
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "📚 ${lecture.topic}",
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  "📖 ${lecture.subject}",
                  style: const TextStyle(
                    color: Colors.orangeAccent,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "👨‍🏫 ${lecture.teacher}",
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}


  // ⭐ EMPTY STATE (NEW)
  Widget _emptyState() {
    return const Center(
      child: Text(
        "No lectures found 📭",
        style: TextStyle(color: Colors.white70, fontSize: 16),
      ),
    );
  }

  // ⭐ FOOTER
  Widget _buildGlassFooter() {
    return Padding(
      padding: const EdgeInsets.all(14),
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: () => Navigator.push(context,
            MaterialPageRoute(builder: (_) => const AIAssistantScreen())),
        child: Ink(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white.withOpacity(0.08),
            border: Border.all(color: Colors.white24),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Need help? Ask AI!',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.orangeAccent)),
              Icon(Icons.smart_toy_outlined, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
