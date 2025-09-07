// import 'package:flutter/material.dart';

// class MyLecturesScreen extends StatelessWidget {
//   const MyLecturesScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final List<Map<String, String>> lectures = [
//       {'title': 'Sorting Algorithms', 'date': '2025-07-10'},
//       {'title': 'Process Synchronization', 'date': '2025-07-11'},
//       {'title': 'Normalization in DBMS', 'date': '2025-07-12'},
//       {'title': 'Regression Models', 'date': '2025-07-13'},
//     ];

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('My Lectures'),
//         backgroundColor: const Color(0xFF00A8E8),
//       ),
//       body: ListView.builder(
//         padding: const EdgeInsets.all(16),
//         itemCount: lectures.length,
//         itemBuilder: (context, index) {
//           final lecture = lectures[index];
//           return Card(
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//             elevation: 3,
//             margin: const EdgeInsets.symmetric(vertical: 8),
//             child: ListTile(
//               leading: const Icon(Icons.video_library, color: Color(0xFF00A8E8)),
//               title: Text(lecture['title']!,
//                   style: const TextStyle(fontWeight: FontWeight.bold)),
//               subtitle: Text('Uploaded on: ${lecture['date']}'),
//               trailing: const Icon(Icons.arrow_forward_ios, size: 16),
//               onTap: () {
//                 // TODO: Open lecture details or video screen
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class MyLecturesScreen extends StatefulWidget {
  const MyLecturesScreen({super.key});

  @override
  State<MyLecturesScreen> createState() => _MyLecturesScreenState();
}

class _MyLecturesScreenState extends State<MyLecturesScreen> with SingleTickerProviderStateMixin {
  final List<Map<String, String>> lectures = [
    {'title': 'Sorting Algorithms', 'date': '2025-07-10'},
    {'title': 'Process Synchronization', 'date': '2025-07-11'},
    {'title': 'Normalization in DBMS', 'date': '2025-07-12'},
    {'title': 'Regression Models', 'date': '2025-07-13'},
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
        title: const Text('My Lectures', style: TextStyle(
          fontFamily: 'TimesNewRoman',
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            color: Colors.white,
        )),
        backgroundColor: const Color(0xFF1E3A8A),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF1E3A8A), Color(0xFFFB923C)], // Deep Blue → Orange
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: lectures.length,
        itemBuilder: (context, index) {
          final lecture = lectures[index];
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
                      backgroundColor: Colors.orange.withOpacity(0.3),
                      child: const Icon(Icons.video_library, color: Colors.orange),
                    ),
                    title: Text(
                      lecture['title']!,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontFamily: "TimesNewRoman"),
                    ),
                    subtitle: Text('Uploaded on: ${lecture['date']}'),
                    trailing: ElevatedButton(
                      onPressed: () {
                        // TODO: Open lecture video/details
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1E3A8A), // Deep Blue
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
