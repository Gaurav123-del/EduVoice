// import 'package:flutter/material.dart';

// class NotificationScreen extends StatefulWidget {
//   const NotificationScreen({super.key});

//   @override
//   State<NotificationScreen> createState() => _NotificationScreenState();
// }

// class _NotificationScreenState extends State<NotificationScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;

//   List<Map<String, dynamic>> notifications = [
//     {
//       'title': 'New Lecture Uploaded',
//       'body': 'Prof. Sharma uploaded Machine Learning Basics.',
//       'unread': true,
//     },
//     {
//       'title': 'Fee Payment Reminder',
//       'body': 'Your tuition fee is due next week.',
//       'unread': true,
//     },
//     {
//       'title': 'Exam Schedule Released',
//       'body': 'Check the exam timetable in My Courses.',
//       'unread': false,
//     },
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 700),
//     )..forward();
//   }

//   Future<void> _refreshNotifications() async {
//     await Future.delayed(const Duration(seconds: 1));
//     setState(() {
//       notifications.insert(0, {
//         'title': 'New Event Added',
//         'body': 'Annual Science Fair announced!',
//         'unread': true,
//       });
//     });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   void _markAsRead(int index) {
//     setState(() {
//       notifications[index]['unread'] = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Notifications'),
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
//       body: RefreshIndicator(
//         onRefresh: _refreshNotifications,
//         child: ListView.builder(
//           padding: const EdgeInsets.all(16),
//           itemCount: notifications.length,
//           itemBuilder: (context, index) {
//             final notif = notifications[index];
//             final animation =
//                 Tween<Offset>(
//                   begin: const Offset(1, 0),
//                   end: Offset.zero,
//                 ).animate(
//                   CurvedAnimation(
//                     parent: _controller,
//                     curve: Interval(
//                       (index / notifications.length),
//                       1.0,
//                       curve: Curves.easeOut,
//                     ),
//                   ),
//                 );

//             var circleAvatar = CircleAvatar(
//               backgroundColor: notif['unread']
//                   ? Colors.orange.shade100
//                   : Colors.blue.shade100,
//               child: Icon(
//                 notif['unread'] ? Icons.fiber_new : Icons.notifications,
//                 color: notif['unread'] ? Colors.orange : Colors.blue,
//               ),
//             );
//             return SlideTransition(
//               position: animation,
//               child: FadeTransition(
//                 opacity: _controller,
//                 child: Card(
//                   margin: const EdgeInsets.only(bottom: 12),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(16),
//                   ),
//                   elevation: 4,
//                   child: ListTile(
//                     leading: circleAvatar,
//                     title: Text(
//                       notif['title'] ?? '',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 16,
//                         color: notif['unread'] ? Colors.orange : Colors.black87,
//                       ),
//                     ),
//                     subtitle: Text(
//                       notif['body'] ?? '',
//                       style: const TextStyle(fontSize: 14),
//                     ),
//                     trailing: notif['unread']
//                         ? Container(
//                             padding: const EdgeInsets.all(6),
//                             decoration: const BoxDecoration(
//                               color: Colors.red,
//                               shape: BoxShape.circle,
//                             ),
//                             child: const Icon(
//                               Icons.circle,
//                               size: 10,
//                               color: Colors.white,
//                             ),
//                           )
//                         : const Icon(Icons.arrow_forward_ios, size: 16),
//                     onTap: () {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(
//                           content: Text('Tapped on "${notif['title']}"'),
//                         ),
//                       );
//                       _markAsRead(index);
//                     },
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }


import 'dart:ui';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  List<Map<String, dynamic>> notifications = [
    {
      'title': 'New Lecture Uploaded',
      'body': 'Prof. Sharma uploaded Machine Learning Basics.',
      'unread': true,
    },
    {
      'title': 'Fee Payment Reminder',
      'body': 'Your tuition fee is due next week.',
      'unread': true,
    },
    {
      'title': 'Exam Schedule Released',
      'body': 'Check the exam timetable in My Courses.',
      'unread': false,
    },
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    )..forward();
  }

  Future<void> _refreshNotifications() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      notifications.insert(0, {
        'title': 'New Event Added',
        'body': 'Annual Science Fair announced!',
        'unread': true,
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _markAsRead(int index) {
    setState(() {
      notifications[index]['unread'] = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Notifications',
        style: TextStyle(
            fontFamily: 'TimesNewRoman',
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            color: Colors.white,
          ),),
        
        backgroundColor: Colors.transparent,
         elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
               colors: [Color(0xFFFB923C), Color(0xFF0077B6)],
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
      body: Container(
        // ✅ Orange + Blue Gradient Background
        decoration: const BoxDecoration(
          gradient: LinearGradient(
             colors: [Color(0xFFFB923C), Color(0xFF0077B6)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: RefreshIndicator(
            onRefresh: _refreshNotifications,
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notif = notifications[index];
                final animation = Tween<Offset>(
                  begin: const Offset(1, 0),
                  end: Offset.zero,
                ).animate(
                  CurvedAnimation(
                    parent: _controller,
                    curve: Interval(
                      (index / notifications.length),
                      1.0,
                      curve: Curves.easeOut,
                    ),
                  ),
                );

                return SlideTransition(
                  position: animation,
                  child: FadeTransition(
                    opacity: _controller,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.08),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: notif['unread']
                                  ? Colors.orangeAccent.withOpacity(0.6)
                                  : Colors.blueAccent.withOpacity(0.6),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: notif['unread']
                                    ? Colors.orangeAccent.withOpacity(0.3)
                                    : Colors.blueAccent.withOpacity(0.3),
                                blurRadius: 12,
                                spreadRadius: 2,
                              )
                            ],
                          ),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: notif['unread']
                                  ? Colors.orange.withOpacity(0.2)
                                  : Colors.blue.withOpacity(0.2),
                              child: Icon(
                                notif['unread']
                                    ? Icons.fiber_new
                                    : Icons.notifications,
                                color: notif['unread']
                                    ? Colors.orangeAccent
                                    : Colors.blueAccent,
                              ),
                            ),
                            title: Text(
                              notif['title'] ?? '',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: notif['unread']
                                    ? Colors.orangeAccent
                                    : Colors.white,
                              ),
                            ),
                            subtitle: Text(
                              notif['body'] ?? '',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white70,
                              ),
                            ),
                            trailing: notif['unread']
                                ? const Icon(Icons.circle,
                                    size: 12, color: Colors.redAccent)
                                : const Icon(Icons.arrow_forward_ios,
                                    size: 16, color: Colors.white54),
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content:
                                      Text('Tapped on "${notif['title']}"'),
                                ),
                              );
                              _markAsRead(index);
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
