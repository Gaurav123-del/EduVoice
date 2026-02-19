// import 'package:flutter/material.dart';

// class TeacherLectureDetailsScreen extends StatelessWidget {
//   final Map<String, String> lecture;

//   const TeacherLectureDetailsScreen({super.key, required this.lecture});

//   @override
//   Widget build(BuildContext context) {
//     final List<String> queries = [
//       'Can you explain topic 2 again?',
//       'Please share the slides.',
//       'Will there be an assignment?',
//       'Is this in the final exam?'
//     ];

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Lecture Details'),
//         backgroundColor: Colors.teal,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // 📌 Lecture Info
//               Text(
//                 'Class ${lecture['class']} - ${lecture['subject']}',
//                 style: const TextStyle(
//                     fontSize: 24, fontWeight: FontWeight.bold, color: Colors.teal),
//               ),
//               const SizedBox(height: 10),
//               const Text(
//                 '📅 Date: 22 July 2025',
//                 style: TextStyle(fontSize: 16),
//               ),
//               const SizedBox(height: 10),
//               const Text(
//                 '👨‍🏫 Teacher: Mr. Sharma',
//                 style: TextStyle(fontSize: 16),
//               ),
//               const SizedBox(height: 20),
//               const Text(
//                 'Lecture Description:',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 8),
//               const Text(
//                 'This lecture covers the complete chapter including examples, practice questions and homework instructions.',
//                 style: TextStyle(fontSize: 16),
//               ),

//               const SizedBox(height: 30),

//               // 📌 Student Queries
//               const Text(
//                 '💬 Student Queries:',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 8),
//               ListView.builder(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 itemCount: queries.length,
//                 itemBuilder: (context, index) {
//                   return Card(
//                     margin: const EdgeInsets.symmetric(vertical: 6),
//                     child: ListTile(
//                       leading: const Icon(Icons.person, color: Colors.teal),
//                       title: Text(queries[index]),
//                     ),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class TeacherLectureDetailsScreen extends StatelessWidget {
  final Map<String, String> lecture;

  const TeacherLectureDetailsScreen({super.key, required this.lecture});

  @override
  Widget build(BuildContext context) {
    final List<String> queries = [
      'Can you explain topic 2 again?',
      'Please share the slides.',
      'Will there be an assignment?',
      'Is this in the final exam?',
    ];

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Lecture Details',
          style: TextStyle(
            fontFamily: 'TimesNewRoman',
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // 🌆 Background Gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFFB923C), Color(0xFF0077B6)],

                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          // 📌 Content
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Glass Card for Lecture Info
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Class ${lecture['class']} - ${lecture['subject']}',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Times New Roman",
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          '📅 Date: 22 July 2025',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: "Times New Roman",
                            color: Colors.white70,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          '👨‍🏫 Teacher: Mr. Sharma',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: "Times New Roman",
                            color: Colors.white70,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Lecture Description:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Times New Roman",
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'This lecture covers the complete chapter including examples, practice questions and homework instructions.',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: "Times New Roman",
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  // 📌 Student Queries
                  const Text(
                    '💬 Student Queries:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Times New Roman",
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 12),

                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: queries.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.white30),
                        ),
                        child: ListTile(
                          leading: const Icon(
                            Icons.person,
                            color: Colors.orangeAccent,
                          ),
                          title: Text(
                            queries[index],
                            style: const TextStyle(
                              fontFamily: "Times New Roman",
                              color: Colors.white,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
