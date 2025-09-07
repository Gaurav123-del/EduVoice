// import 'package:flutter/material.dart';

// class MyCoursesScreen extends StatelessWidget {
//   const MyCoursesScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final List<Map<String, String>> courses = [
//       {'title': 'Data Structures', 'code': 'CS101'},
//       {'title': 'Operating Systems', 'code': 'CS203'},
//       {'title': 'Database Management', 'code': 'CS305'},
//       {'title': 'Machine Learning', 'code': 'AI401'},
//     ];

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('My Courses'),
//         backgroundColor: const Color(0xFF00A8E8),
//       ),
//       body: ListView.builder(
//         padding: const EdgeInsets.all(16),
//         itemCount: courses.length,
//         itemBuilder: (context, index) {
//           final course = courses[index];
//           return Card(
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//             elevation: 3,
//             margin: const EdgeInsets.symmetric(vertical: 8),
//             child: ListTile(
//               leading: const Icon(Icons.book, color: Color(0xFF00A8E8)),
//               title: Text(course['title']!,
//                   style: const TextStyle(fontWeight: FontWeight.bold)),
//               subtitle: Text('Course Code: ${course['code']}'),
//               trailing: const Icon(Icons.arrow_forward_ios, size: 16),
//               onTap: () {
//                 // TODO: Open course details screen if needed
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class MyCoursesScreen extends StatefulWidget {
  const MyCoursesScreen({super.key});

  @override
  State<MyCoursesScreen> createState() => _MyCoursesScreenState();
}

class _MyCoursesScreenState extends State<MyCoursesScreen> with SingleTickerProviderStateMixin {
  final List<Map<String, String>> courses = [
    {'title': 'Data Structures', 'code': 'CS101'},
    {'title': 'Operating Systems', 'code': 'CS203'},
    {'title': 'Database Management', 'code': 'CS305'},
    {'title': 'Machine Learning', 'code': 'AI401'},
  ];

  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );
    _slideAnimation = Tween<Offset>(begin: const Offset(0, 0.2), end: Offset.zero)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        title: const Text('My Courses', style: TextStyle(
            fontFamily: 'TimesNewRoman',
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            color: Colors.white,
        )),
        backgroundColor: const Color(0xFF1E3A8A),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF2563EB),
               Color(0xFFFF6B35)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];
          return FadeTransition(
            opacity: _fadeAnimation,
            child: SlideTransition(
              position: _slideAnimation,
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                elevation: 6,
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.orange.shade100, Colors.blue.shade100],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue.withOpacity(0.3),
                      child: const Icon(Icons.book, color: Colors.blue),
                    ),
                    title: Text(
                      course['title']!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: "TimesNewRoman",
                      ),
                    ),
                    subtitle: Text('Course Code: ${course['code']}'),
                    trailing: ElevatedButton(
                      onPressed: () {
                        // TODO: Open course details screen
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFB923C), // Orange button
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text('Open'),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
