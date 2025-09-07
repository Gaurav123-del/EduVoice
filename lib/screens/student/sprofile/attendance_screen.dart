// import 'package:flutter/material.dart';

// class AttendanceScreen extends StatelessWidget {
//   const AttendanceScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final List<Map<String, dynamic>> subjects = [
//       {"name": "Maths", "attended": 40, "total": 45},
//       {"name": "Computer Science", "attended": 35, "total": 40},
//       {"name": "Physics", "attended": 28, "total": 35},
//     ];

//     return Scaffold(
//       appBar: AppBar(title: const Text("Attendance")),
//       body: ListView.builder(
//         padding: const EdgeInsets.all(16),
//         itemCount: subjects.length,
//         itemBuilder: (context, index) {
//           final sub = subjects[index];
//           final percent = (sub["attended"] / sub["total"] * 100).toInt();

//           return Card(
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(15)),
//             elevation: 4,
//             margin: const EdgeInsets.symmetric(vertical: 8),
//             child: ListTile(
//               title: Text(sub["name"]),
//               subtitle: Text("${sub["attended"]}/${sub["total"]} classes"),
//               trailing: CircleAvatar(
//                 backgroundColor: percent >= 75 ? Colors.green : Colors.red,
//                 child: Text("$percent%"),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> subjects = [
      {"name": "Maths", "attended": 40, "total": 45},
      {"name": "Computer Science", "attended": 35, "total": 40},
      {"name": "Physics", "attended": 28, "total": 35},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        title: const Text(
          "Attendance",
          style: TextStyle(
            fontFamily: 'TimesNewRoman',
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
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: subjects.length,
        itemBuilder: (context, index) {
          final sub = subjects[index];
          final percent =
              (sub["attended"] / sub["total"] * 100).toInt().clamp(0, 100);

          return Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: const LinearGradient(
                colors: [Colors.white, Color(0xFFE3F2FD)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Subject name
                Text(
                  sub["name"],
                  style: const TextStyle(
                    fontFamily: 'TimesNewRoman',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2196F3),
                  ),
                ),
                const SizedBox(height: 6),

                // Attended / Total
                Text(
                  "${sub["attended"]}/${sub["total"]} classes attended",
                  style: const TextStyle(
                    fontFamily: 'TimesNewRoman',
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 12),

                // Progress bar with percentage
                Stack(
                  children: [
                    Container(
                      height: 12,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Container(
                      height: 12,
                      width: (percent / 100) *
                          MediaQuery.of(context).size.width *
                          0.78,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          colors: percent >= 75
                              ? [Colors.blue, Colors.orange]
                              : [Colors.red, Colors.orange.shade200],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),

                // Percentage text
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "$percent%",
                    style: TextStyle(
                      fontFamily: 'TimesNewRoman',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: percent >= 75
                          ? Colors.green.shade700
                          : Colors.red.shade700,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
