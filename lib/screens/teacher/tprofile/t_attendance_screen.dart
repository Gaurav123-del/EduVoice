// import 'package:flutter/material.dart';

// class AttendanceScreen extends StatelessWidget {
//   const AttendanceScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final List<Map<String, String>> attendanceData = [
//       {'date': '2025-07-14', 'status': 'Present'},
//       {'date': '2025-07-13', 'status': 'Present'},
//       {'date': '2025-07-12', 'status': 'Absent'},
//       {'date': '2025-07-11', 'status': 'Present'},
//     ];

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Attendance'),
//         backgroundColor: const Color(0xFF00A8E8),
//       ),
//       body: ListView.builder(
//         padding: const EdgeInsets.all(16),
//         itemCount: attendanceData.length,
//         itemBuilder: (context, index) {
//           final record = attendanceData[index];
//           return Card(
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//             elevation: 2,
//             margin: const EdgeInsets.symmetric(vertical: 8),
//             child: ListTile(
//               leading: const Icon(Icons.calendar_today, color: Color(0xFF00A8E8)),
//               title: Text(record['date']!),
//               trailing: Chip(
//                 label: Text(
//                   record['status']!,
//                   style: const TextStyle(color: Colors.white),
//                 ),
//                 backgroundColor: record['status'] == 'Present'
//                     ? Colors.green
//                     : Colors.red,
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';

// class AttendanceScreen extends StatefulWidget {
//   const AttendanceScreen({super.key});

//   @override
//   State<AttendanceScreen> createState() => _AttendanceScreenState();
// }

// class _AttendanceScreenState extends State<AttendanceScreen> {
//   String? selectedSubject;
//   DateTime focusedDay = DateTime.now();
//   DateTime? selectedDay;

//   // ✅ Example Subject Data
//   final Map<String, Map<DateTime, String>> subjectAttendance = {
//     "Theory of Computation": {
//       DateTime.utc(2025, 9, 1): "Present",
//       DateTime.utc(2025, 9, 2): "Absent",
//       DateTime.utc(2025, 9, 3): "Present",
//       DateTime.utc(2025, 9, 5): "Other",
//     },
//     "Mathematics": {
//       DateTime.utc(2025, 9, 1): "Present",
//       DateTime.utc(2025, 9, 4): "Absent",
//       DateTime.utc(2025, 9, 7): "Present",
//     },
//   };

//   Color _getStatusColor(String status) {
//     switch (status) {
//       case "Present":
//         return Colors.green;
//       case "Absent":
//         return Colors.red;
//       case "Other":
//         return Colors.orange;
//       default:
//         return Colors.grey;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Attendance"),
//         backgroundColor: const Color(0xFF0077B6), // Blue Theme
//       ),
//       body: selectedSubject == null
//           ? _buildSubjectList()
//           : _buildCalendarView(selectedSubject!),
//     );
//   }

//   // ✅ Show List of Subjects
//   Widget _buildSubjectList() {
//     return ListView(
//       padding: const EdgeInsets.all(16),
//       children: subjectAttendance.keys.map((subject) {
//         return Card(
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//           elevation: 3,
//           margin: const EdgeInsets.symmetric(vertical: 10),
//           child: ListTile(
//             leading: const Icon(Icons.book, color: Color(0xFFFB923C)), // Orange
//             title: Text(
//               subject,
//               style: const TextStyle(
//                   fontWeight: FontWeight.bold, color: Colors.black87),
//             ),
//             trailing: const Icon(Icons.arrow_forward_ios, size: 18),
//             onTap: () {
//               setState(() {
//                 selectedSubject = subject;
//               });
//             },
//           ),
//         );
//       }).toList(),
//     );
//   }

//   // ✅ Show Calendar for Selected Subject
//   Widget _buildCalendarView(String subject) {
//     final attendance = subjectAttendance[subject] ?? {};
//     final totalClasses = attendance.length;
//     final presentCount =
//         attendance.values.where((status) => status == "Present").length;
//     final absentCount =
//         attendance.values.where((status) => status == "Absent").length;
//     final presentPercent =
//         totalClasses > 0 ? (presentCount / totalClasses) * 100 : 0;
//     final absentPercent =
//         totalClasses > 0 ? (absentCount / totalClasses) * 100 : 0;

//     return Column(
//       children: [
//         // ✅ Subject Header
//         Container(
//           width: double.infinity,
//           padding: const EdgeInsets.all(16),
//           color: const Color(0xFFFB923C), // Orange
//           child: Text(
//             subject,
//             style: const TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//             ),
//           ),
//         ),

//         // ✅ Calendar
//         TableCalendar(
//           focusedDay: focusedDay,
//           firstDay: DateTime.utc(2025, 1, 1),
//           lastDay: DateTime.utc(2025, 12, 31),
//           selectedDayPredicate: (day) => isSameDay(selectedDay, day),
//           calendarStyle: const CalendarStyle(
//             weekendTextStyle: TextStyle(color: Colors.red),
//           ),
//           onDaySelected: (selected, focused) {
//             setState(() {
//               selectedDay = selected;
//               focusedDay = focused;
//             });
//           },
//           calendarBuilders: CalendarBuilders(
//             defaultBuilder: (context, day, focusedDay) {
//               final status = attendance[day];
//               if (status != null) {
//                 return Container(
//                   margin: const EdgeInsets.all(6),
//                   decoration: BoxDecoration(
//                     color: _getStatusColor(status).withOpacity(0.8),
//                     shape: BoxShape.circle,
//                   ),
//                   child: Center(
//                     child: Text(
//                       "${day.day}",
//                       style: const TextStyle(color: Colors.white),
//                     ),
//                   ),
//                 );
//               }
//               return null;
//             },
//           ),
//         ),

//         const SizedBox(height: 16),

//         // ✅ Legend
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: const [
//               _LegendItem(color: Colors.green, text: "Present"),
//               _LegendItem(color: Colors.red, text: "Absent"),
//               _LegendItem(color: Colors.orange, text: "Other"),
//             ],
//           ),
//         ),

//         const SizedBox(height: 20),

//         // ✅ Attendance Summary
//         Card(
//           margin: const EdgeInsets.all(16),
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//           elevation: 4,
//           child: Padding(
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               children: [
//                 const Text(
//                   "Overall Attendance",
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Column(
//                       children: [
//                         Text(
//                           "${presentPercent.toStringAsFixed(1)}%",
//                           style: const TextStyle(
//                               fontSize: 18, color: Colors.green),
//                         ),
//                         Text("Present: $presentCount"),
//                       ],
//                     ),
//                     Column(
//                       children: [
//                         Text(
//                           "${absentPercent.toStringAsFixed(1)}%",
//                           style:
//                               const TextStyle(fontSize: 18, color: Colors.red),
//                         ),
//                         Text("Absent: $absentCount"),
//                       ],
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// // ✅ Legend Widget
// class _LegendItem extends StatelessWidget {
//   final Color color;
//   final String text;
//   const _LegendItem({required this.color, required this.text});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         CircleAvatar(radius: 6, backgroundColor: color),
//         const SizedBox(width: 6),
//         Text(text),
//       ],
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';

// class AttendanceScreen extends StatefulWidget {
//   const AttendanceScreen({super.key});

//   @override
//   State<AttendanceScreen> createState() =>
//       _AttendanceScreenState();
// }

// class _AttendanceScreenState extends State<AttendanceScreen> {
//   DateTime selectedDate = DateTime.now();

//   // Example student list
//   final List<Map<String, dynamic>> students = [
//     {'name': 'Alice Johnson', 'status': 'Present'},
//     {'name': 'Bob Smith', 'status': 'Absent'},
//     {'name': 'Charlie Brown', 'status': 'Other'},
//     {'name': 'Diana Prince', 'status': 'Present'},
//   ];

//   Color _getStatusColor(String status) {
//     switch (status) {
//       case 'Present':
//         return Colors.green;
//       case 'Absent':
//         return Colors.red;
//       case 'Other':
//         return Colors.orange;
//       default:
//         return Colors.grey;
//     }
//   }

//   void _updateStatus(int index, String status) {
//     setState(() {
//       students[index]['status'] = status;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Take Attendance"),
//         backgroundColor: const Color(0xFF1E3A8A),
//       ),
//       body: Column(
//         children: [
//           // ✅ Calendar for date selection
//           TableCalendar(
//             focusedDay: selectedDate,
//             firstDay: DateTime.utc(2025, 1, 1),
//             lastDay: DateTime.utc(2025, 12, 31),
//             selectedDayPredicate: (day) => isSameDay(day, selectedDate),
//             onDaySelected: (day, focusedDay) {
//               setState(() {
//                 selectedDate = day;
//               });
//             },
//             calendarStyle: const CalendarStyle(
//               todayDecoration:
//                   BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
//             ),
//           ),

//           const SizedBox(height: 16),

//           // ✅ Student Attendance List
//           Expanded(
//             child: ListView.builder(
//               padding: const EdgeInsets.all(16),
//               itemCount: students.length,
//               itemBuilder: (context, index) {
//                 final student = students[index];
//                 return Card(
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12)),
//                   elevation: 3,
//                   margin: const EdgeInsets.symmetric(vertical: 8),
//                   child: ListTile(
//                     title: Text(
//                       student['name'],
//                       style: const TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     subtitle: Text('Status: ${student['status']}'),
//                     trailing: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         // Present button
//                         IconButton(
//                           icon: Icon(Icons.check_circle,
//                               color: student['status'] == 'Present'
//                                   ? Colors.green
//                                   : Colors.grey),
//                           onPressed: () => _updateStatus(index, 'Present'),
//                         ),
//                         // Absent button
//                         IconButton(
//                           icon: Icon(Icons.cancel,
//                               color: student['status'] == 'Absent'
//                                   ? Colors.red
//                                   : Colors.grey),
//                           onPressed: () => _updateStatus(index, 'Absent'),
//                         ),
//                         // Other button
//                         IconButton(
//                           icon: Icon(Icons.help_outline,
//                               color: student['status'] == 'Other'
//                                   ? Colors.orange
//                                   : Colors.grey),
//                           onPressed: () => _updateStatus(index, 'Other'),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),

//           // ✅ Save / Submit Button
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: SizedBox(
//               width: double.infinity,
//               child: ElevatedButton.icon(
//                 onPressed: () {
//                   // TODO: Save attendance to database
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(content: Text('Attendance submitted!')),
//                   );
//                 },
//                 icon: const Icon(Icons.save),
//                 label: const Text("Submit Attendance"),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color(0xFFFB923C),
//                   padding: const EdgeInsets.symmetric(vertical: 16),
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30)),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class TeacherAttendanceScreen extends StatefulWidget {
  const TeacherAttendanceScreen({super.key});

  @override
  State<TeacherAttendanceScreen> createState() =>
      _TeacherAttendanceScreenState();
}

class _TeacherAttendanceScreenState extends State<TeacherAttendanceScreen> {
  DateTime selectedDate = DateTime.now();
  final DateTime today = DateTime.now();

  // Attendance data: Map<Date, Map<StudentName, Status>>
  final Map<DateTime, Map<String, String>> attendanceData = {};

  // List of students
  final List<String> students = [
    'Alice Johnson',
    'Bob Smith',
    'Charlie Brown',
    'Diana Prince',
  ];

  Color getStatusColor(String status) {
    switch (status) {
      case 'Present':
        return Colors.blue; // Blue for Present
      case 'Absent':
        return Colors.red;
      case 'Other':
        return Colors.orange; // Orange for Other
      default:
        return Colors.grey;
    }
  }

  void _updateStatus(String studentName, String status) {
    if (!_isEditableDate(selectedDate)) return;

    setState(() {
      if (!attendanceData.containsKey(selectedDate)) {
        attendanceData[selectedDate] = {};
      }
      attendanceData[selectedDate]![studentName] = status;
    });
  }

  bool _isEditableDate(DateTime date) {
    final dateOnly = DateTime(date.year, date.month, date.day);
    final todayOnly = DateTime(today.year, today.month, today.day);
    return dateOnly == todayOnly;
  }

  Map<String, String> _getAttendanceForDate(DateTime date) {
    if (attendanceData.containsKey(date)) {
      return attendanceData[date]!;
    } else if (_isEditableDate(date)) {
      return {for (var s in students) s: 'Present'};
    } else {
      return {for (var s in students) s: 'Not Taken'};
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentAttendance = _getAttendanceForDate(selectedDate);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        title: const Text("Take Attendance"),
        backgroundColor: const Color(0xFF1E3A8A), // Blue
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF1E3A8A), Color(0xFFFB923C)], // Blue → Orange
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          // Calendar
          TableCalendar(
            focusedDay: selectedDate,
            firstDay: DateTime.utc(2025, 1, 1),
            lastDay: DateTime.utc(2025, 12, 31),
            selectedDayPredicate: (day) => isSameDay(day, selectedDate),
            onDaySelected: (day, focusedDay) {
              if (!day.isAfter(today)) {
                setState(() {
                  selectedDate = day;
                });
              }
            },
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF1E3A8A), Color(0xFFFB923C)],
                ),
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF1E3A8A), Color(0xFFFB923C)],
                ),
                shape: BoxShape.circle,
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Student List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: students.length,
              itemBuilder: (context, index) {
                final student = students[index];
                final status = currentAttendance[student] ?? 'Not Taken';
                final editable = _isEditableDate(selectedDate);

                return Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  elevation: 3,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    title: Text(
                      student,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('Status: $status'),
                    trailing: editable
                        ? Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.check_circle,
                                    color: status == 'Present'
                                        ? Colors.blue
                                        : Colors.grey),
                                onPressed: () =>
                                    _updateStatus(student, 'Present'),
                              ),
                              IconButton(
                                icon: Icon(Icons.cancel,
                                    color: status == 'Absent'
                                        ? Colors.red
                                        : Colors.grey),
                                onPressed: () =>
                                    _updateStatus(student, 'Absent'),
                              ),
                              IconButton(
                                icon: Icon(Icons.help_outline,
                                    color: status == 'Other'
                                        ? Colors.orange
                                        : Colors.grey),
                                onPressed: () =>
                                    _updateStatus(student, 'Other'),
                              ),
                            ],
                          )
                        : null,
                  ),
                );
              },
            ),
          ),

          // Submit Button (only for today)
          if (_isEditableDate(selectedDate))
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Attendance submitted for today!')),
                    );
                  },
                  icon: const Icon(Icons.save),
                  label: const Text("Submit Attendance"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFB923C), // Orange
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
