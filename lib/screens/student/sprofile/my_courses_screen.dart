import 'package:flutter/material.dart';

class MyCoursesScreen extends StatefulWidget {
  const MyCoursesScreen({super.key});

  @override
  State<MyCoursesScreen> createState() => _MyCoursesScreenState();
}

class _MyCoursesScreenState extends State<MyCoursesScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, dynamic>> courses = [
    {
      "title": "Computer Science Fundamentals",
      "code": "CS101",
      "progress": 0.75,
      "icon": Icons.computer,
      "color": Colors.blue,
      "status": "Ongoing"
    },
    {
      "title": "Mathematics for Engineers",
      "code": "MATH202",
      "progress": 0.45,
      "icon": Icons.calculate,
      "color": Colors.orange,
      "status": "Ongoing"
    },
    {
      "title": "Physics - Mechanics",
      "code": "PHY301",
      "progress": 1.0,
      "icon": Icons.science,
      "color": Colors.green,
      "status": "Completed"
    },
    {
      "title": "Data Structures & Algorithms",
      "code": "CS205",
      "progress": 0.6,
      "icon": Icons.storage,
      "color": Colors.purple,
      "status": "Ongoing"
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  List<Map<String, dynamic>> _filterCourses(String status) {
    if (status == "All") return courses;
    return courses.where((c) => c["status"] == status).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        title: const Text(
          'My Courses',
          style: TextStyle(fontFamily: "TimesNewRoman", fontWeight: FontWeight.bold ,letterSpacing: 1.2, color: Colors.white,),
        ),
        centerTitle: true,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color.fromARGB(255, 106, 146, 232), Color.fromARGB(255, 248, 128, 85)], // Blue + Orange
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: const Color.fromARGB(255, 223, 241, 24),
          labelStyle: const TextStyle(fontFamily: "TimesNewRoman"),
          tabs: const [
            Tab(text: "All"),
            Tab(text: "Ongoing"),
            Tab(text: "Completed"),
            
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildCourseList("All"),
          _buildCourseList("Ongoing"),
          _buildCourseList("Completed"),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Join New Course tapped!")),
          );
        },
        icon: const Icon(Icons.add),
        label: const Text(
          "Join Course",
          style: TextStyle(fontFamily: "TimesNewRoman"),
        ),
        backgroundColor: const Color(0xFFFF6B35), // Orange
      ),
    );
  }

  Widget _buildCourseList(String status) {
    final filtered = _filterCourses(status);

    if (filtered.isEmpty) {
      return const Center(
        child: Text(
          "No courses available",
          style: TextStyle(
            fontFamily: "TimesNewRoman",
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: filtered.length,
      itemBuilder: (context, index) {
        final course = filtered[index];
        return AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
          margin: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                course["color"].withOpacity(0.08),
                Colors.white,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: course["color"].withOpacity(0.2),
                blurRadius: 8,
                offset: const Offset(2, 4),
              ),
            ],
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.all(16),
            leading: CircleAvatar(
              backgroundColor: course["color"].withOpacity(0.15),
              radius: 28,
              child: Icon(course["icon"], color: course["color"], size: 28),
            ),
            title: Text(
              course["title"],
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: "TimesNewRoman",
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  course["code"],
                  style: const TextStyle(
                    color: Colors.black54,
                    fontFamily: "TimesNewRoman",
                  ),
                ),
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  value: course["progress"],
                  backgroundColor: Colors.grey.shade200,
                  color: course["color"],
                  minHeight: 6,
                  borderRadius: BorderRadius.circular(6),
                ),
                const SizedBox(height: 4),
                Text(
                  "${(course["progress"] * 100).toInt()}% completed",
                  style: const TextStyle(
                    fontSize: 12,
                    fontFamily: "TimesNewRoman",
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
            trailing: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Opening ${course["title"]}...")),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: course["color"],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "Open",
                style: TextStyle(
                  fontFamily: "TimesNewRoman",
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
