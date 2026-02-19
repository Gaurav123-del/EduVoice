import 'package:flutter/material.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        title: const Text(
          "Help & Support",
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
               colors: [Color(0xFFFB923C), Color(0xFF0077B6)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Need Assistance?",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontFamily: "TimesNewRoman",
                color: Color(0xFF2563EB),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "If you face any issues with login, attendance, courses, or fee status, please reach out:",
              style: TextStyle(
                fontSize: 16,
                fontFamily: "TimesNewRoman",
              ),
            ),
            const SizedBox(height: 20),

            /// Contact Info Cards
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 3,
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Color(0xFF2563EB),
                  child: Icon(Icons.email, color: Colors.white),
                ),
                title: const Text(
                  "support@collegeapp.com",
                  style: TextStyle(fontFamily: "TimesNewRoman"),
                ),
                subtitle: const Text(
                  "Drop us an email",
                  style: TextStyle(fontFamily: "TimesNewRoman"),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 3,
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Color(0xFFFF6B35), // Orange
                  child: Icon(Icons.phone, color: Colors.white),
                ),
                title: const Text(
                  "+91 98765 43210",
                  style: TextStyle(fontFamily: "TimesNewRoman"),
                ),
                subtitle: const Text(
                  "Call our support team",
                  style: TextStyle(fontFamily: "TimesNewRoman"),
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// FAQ Section
            const Text(
              "Frequently Asked Questions",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: "TimesNewRoman",
                color: Color(0xFF2563EB),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView(
                children: const [
                  ExpansionTile(
                    leading: Icon(Icons.lock_outline, color: Color(0xFF2563EB)),
                    title: Text(
                      "I forgot my password",
                      style: TextStyle(fontFamily: "TimesNewRoman"),
                    ),
                    children: [
                      Padding(
                        padding: EdgeInsets.all(12),
                        child: Text(
                          "Go to Change Password in the app and reset using your registered email.",
                          style: TextStyle(fontFamily: "TimesNewRoman"),
                        ),
                      ),
                    ],
                  ),
                  ExpansionTile(
                    leading: Icon(Icons.attach_money, color: Color(0xFFFF6B35)),
                    title: Text(
                      "How do I pay my fees?",
                      style: TextStyle(fontFamily: "TimesNewRoman"),
                    ),
                    children: [
                      Padding(
                        padding: EdgeInsets.all(12),
                        child: Text(
                          "Navigate to the Fee Status screen and click on PAY NOW for pending dues.",
                          style: TextStyle(fontFamily: "TimesNewRoman"),
                        ),
                      ),
                    ],
                  ),
                  ExpansionTile(
                    leading: Icon(Icons.school, color: Color(0xFF2563EB)),
                    title: Text(
                      "Where can I see my courses?",
                      style: TextStyle(fontFamily: "TimesNewRoman"),
                    ),
                    children: [
                      Padding(
                        padding: EdgeInsets.all(12),
                        child: Text(
                          "Go to the Courses section in the dashboard to view enrolled courses.",
                          style: TextStyle(fontFamily: "TimesNewRoman"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            /// Chat Button
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.chat_bubble_outline, color: Colors.white),
                  label: const Text(
                    "Chat with Support",
                    style: TextStyle(
                      fontFamily: "TimesNewRoman",
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF6B35), // Orange Button
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () {
                    // Add chat functionality
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
