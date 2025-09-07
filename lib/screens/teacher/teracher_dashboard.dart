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
import 'dart:ui';
import 'package:flutter/material.dart';

import 't_profile_dashboard.dart';
import 'upload_video_screen.dart';
import 'teacher_lecture_details_screen.dart';

class TeacherDashboard extends StatefulWidget {
  const TeacherDashboard({super.key});

  @override
  State<TeacherDashboard> createState() => _TeacherDashboardState();
}

class _TeacherDashboardState extends State<TeacherDashboard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  final List<Map<String, String>> todayLectures = [
    {'class': '9', 'subject': 'Mathematics'},
    {'class': '10', 'subject': 'Physics'},
    {'class': '11', 'subject': 'Computer Science'},
    {'class': '12', 'subject': 'Chemistry'},
    {'class': '9', 'subject': 'Algebra'},
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _openUpload() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const UploadVideoScreen()),
    );
  }

  void _openProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const TeacherProfileScreen()),
    );
  }

  void _openNotification() {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('No new notifications yet!')));
  }

  void _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      debugPrint('Picked date: $picked');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // 🌈 Gradient background
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF1E3A8A), // Deep Blue
              Color(0xFFE7A56F),
              Color(0xFF0EA5E9), // Cyan-Blue
              Color(0xFFFB923C), // Soft Orange
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // ✅ HEADER WITH GLASS EFFECT
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(40),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: _openProfile,
                            child: const CircleAvatar(
                              radius: 20,
                              
                              backgroundImage: AssetImage(
                                'assets/images/t_placeholder.png',
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              child: const TextField(
                                decoration: InputDecoration(
                                  hintText: 'Search lectures...',
                                  prefixIcon: Icon(Icons.search,
                                      color: Colors.white),
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                    color: Colors.white70,
                                    fontFamily: "TimesNewRoman",
                                  ),
                                ),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "TimesNewRoman",
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.notifications_active,
                                color: Colors.white),
                            onPressed: _openNotification,
                          ),
                          IconButton(
                            icon: const Icon(Icons.calendar_month,
                                color: Colors.white),
                            onPressed: _pickDate,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // ✅ LECTURE LIST WITH GLASS CARDS
              Expanded(
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: todayLectures.length,
                      itemBuilder: (context, index) {
                        final lecture = todayLectures[index];
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.15),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.3),
                                ),
                              ),
                              child: ListTile(
                                contentPadding: const EdgeInsets.all(16),
                                title: Text(
                                  'Class ${lecture['class']} - ${lecture['subject']}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: "TimesNewRoman",
                                  ),
                                ),
                                subtitle: const Text(
                                  'Lecture Scheduled Today',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontFamily: "TimesNewRoman",
                                  ),
                                ),
                                leading: const Icon(
                                  Icons.play_circle_fill,
                                  color: Colors.white,
                                  size: 40,
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          TeacherLectureDetailsScreen(
                                        lecture: lecture,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      // ✅ Glassmorphic FAB
      floatingActionButton: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: FloatingActionButton.extended(
            onPressed: _openUpload,
            backgroundColor: const Color.fromARGB(255, 215, 184, 26),
            icon: const Icon(Icons.upload, color: Colors.white),
            label: const Text(
              "Upload Lecture",
              style: TextStyle(
                fontFamily: "TimesNewRoman",
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
