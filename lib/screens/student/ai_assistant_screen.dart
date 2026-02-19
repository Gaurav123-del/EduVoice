// import 'package:flutter/material.dart';

// class AIAssistantScreen extends StatefulWidget {
//   const AIAssistantScreen({super.key});

//   @override
//   State<AIAssistantScreen> createState() => _AIAssistantScreenState();
// }

// class _AIAssistantScreenState extends State<AIAssistantScreen>
//     with SingleTickerProviderStateMixin {
//   final TextEditingController _controller = TextEditingController();
//   final List<Map<String, String>> _messages = [];

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   void _sendMessage() {
//     String text = _controller.text.trim();
//     if (text.isEmpty) return;

//     setState(() {
//       _messages.add({'role': 'user', 'text': text});
//     });

//     Future.delayed(const Duration(milliseconds: 500), () {
//       setState(() {
//         _messages.add({
//           'role': 'ai',
//           'text': '🤖 This is a smart AI reply (placeholder)!'
//         });
//       });
//     });

//     _controller.clear();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFE0F7FA),
//       appBar: AppBar(
//         title: const Text('AI Assistant'),
//         elevation: 0,
//         backgroundColor: Colors.teal.shade400,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.chat_bubble_outline, color: Colors.white),
//             onPressed: () {
//               // Future: Start new chat logic
//               ScaffoldMessenger.of(context).showSnackBar(
//                 const SnackBar(content: Text('🗨️ New chat started!')),
//               );
//             },
//           )
//         ],
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               padding: const EdgeInsets.all(16),
//               itemCount: _messages.length,
//               itemBuilder: (_, index) {
//                 final msg = _messages[index];
//                 final isUser = msg['role'] == 'user';

//                 return Align(
//                   alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
//                   child: AnimatedContainer(
//                     duration: const Duration(milliseconds: 300),
//                     curve: Curves.easeInOut,
//                     margin: const EdgeInsets.symmetric(vertical: 6),
//                     padding: const EdgeInsets.all(14),
//                     constraints: BoxConstraints(
//                       maxWidth: MediaQuery.of(context).size.width * 0.75,
//                     ),
//                     decoration: BoxDecoration(
//                       gradient: LinearGradient(
//                         colors: isUser
//                             ? [Colors.teal, Colors.teal.shade400]
//                             : [Colors.grey.shade200, Colors.grey.shade300],
//                       ),
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(isUser ? 20 : 0),
//                         topRight: Radius.circular(isUser ? 0 : 20),
//                         bottomLeft: const Radius.circular(20),
//                         bottomRight: const Radius.circular(20),
//                       ),
//                     ),
//                     child: Text(
//                       msg['text']!,
//                       style: TextStyle(
//                         color: isUser ? Colors.white : Colors.black87,
//                         fontSize: 15,
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               boxShadow: const [
//                 BoxShadow(color: Colors.black12, blurRadius: 5)
//               ],
//               borderRadius: const BorderRadius.only(
//                 topLeft: Radius.circular(20),
//                 topRight: Radius.circular(20),
//               ),
//             ),
//             child: Row(
//               children: [
//                 const Icon(Icons.smart_toy_outlined, color: Colors.teal, size: 28),
//                 const SizedBox(width: 8),
//                 Expanded(
//                   child: TextField(
//                     controller: _controller,
//                     decoration: const InputDecoration(
//                       hintText: 'Ask your AI...',
//                       border: InputBorder.none,
//                     ),
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: _sendMessage,
//                   child: Container(
//                     padding: const EdgeInsets.all(10),
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       gradient: LinearGradient(
//                         colors: [Colors.teal, Colors.teal.shade300],
//                       ),
//                     ),
//                     child: const Icon(Icons.send, color: Colors.white, size: 20),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


// import 'package:edu_voice_main/services/gemini_service.dart';
// import 'package:flutter/material.dart';

// class AIAssistantScreen extends StatefulWidget {
//   const AIAssistantScreen({super.key});

//   @override
//   State<AIAssistantScreen> createState() => _AIAssistantScreenState();
// }

// class _AIAssistantScreenState extends State<AIAssistantScreen>
//     with SingleTickerProviderStateMixin {
//   final TextEditingController _controller = TextEditingController();
//   final List<Map<String, String>> _messages = [];

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   void _sendMessage() async {
//   String text = _controller.text.trim();
//   if (text.isEmpty) return;

//   setState(() {
//     _messages.add({'role': 'user', 'text': text});

//     // ⭐ temporary loading bubble
//     _messages.add({'role': 'ai', 'text': '🤖 Thinking...'});
//   });

//   _controller.clear();

//   try {
//     final aiReply = await GeminiService.askGemini(text);

//     setState(() {
//       _messages.removeLast(); // remove thinking
//       _messages.add({'role': 'ai', 'text': aiReply});
//     });
//   } catch (e) {
//     setState(() {
//       _messages.removeLast();
//       _messages.add({
//         'role': 'ai',
//         'text': '⚠️ AI error. Please try again.',
//       });
//     });
//   }
// }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF9FAFB),
//       appBar: AppBar(
//         title: const Text(
//           'AI Assistant',
//           style: TextStyle(
//             fontFamily: 'TimesNewRoman',
//             fontWeight: FontWeight.bold,
//             letterSpacing: 1.2,
//             color: Colors.white,
//           ),
//         ),
//         elevation: 0,
//         flexibleSpace: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               colors: [Color(0xFF2196F3), Color(0xFFFF9800)], // Blue + Orange
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.chat_bubble_outline, color: Colors.white),
//             onPressed: () {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 const SnackBar(content: Text('🗨️ New chat started!')),
//               );
//             },
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           // ✅ Chat bubbles
//           Expanded(
//             child: ListView.builder(
//               padding: const EdgeInsets.all(16),
//               itemCount: _messages.length,
//               itemBuilder: (_, index) {
//                 final msg = _messages[index];
//                 final isUser = msg['role'] == 'user';

//                 return Align(
//                   alignment:
//                       isUser ? Alignment.centerRight : Alignment.centerLeft,
//                   child: AnimatedContainer(
//                     duration: const Duration(milliseconds: 300),
//                     curve: Curves.easeInOut,
//                     margin: const EdgeInsets.symmetric(vertical: 6),
//                     padding: const EdgeInsets.all(14),
//                     constraints: BoxConstraints(
//                       maxWidth: MediaQuery.of(context).size.width * 0.75,
//                     ),
//                     decoration: BoxDecoration(
//                       gradient: LinearGradient(
//                         colors: isUser
//                             ? [const Color(0xFF2196F3), Colors.blue.shade400]
//                             : [Colors.orange.shade100, Colors.orange.shade200],
//                       ),
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(isUser ? 20 : 0),
//                         topRight: Radius.circular(isUser ? 0 : 20),
//                         bottomLeft: const Radius.circular(20),
//                         bottomRight: const Radius.circular(20),
//                       ),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.08),
//                           blurRadius: 6,
//                           offset: const Offset(0, 3),
//                         ),
//                       ],
//                     ),
//                     child: Text(
//                       msg['text']!,
//                       style: TextStyle(
//                         fontFamily: 'TimesNewRoman',
//                         color: isUser ? Colors.white : Colors.black87,
//                         fontSize: 15,
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),

//           // ✅ Input bar
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               boxShadow: const [
//                 BoxShadow(color: Colors.black12, blurRadius: 6)
//               ],
//               borderRadius: const BorderRadius.only(
//                 topLeft: Radius.circular(20),
//                 topRight: Radius.circular(20),
//               ),
//             ),
//             child: Row(
//               children: [
//                 const Icon(Icons.smart_toy_outlined,
//                     color: Color(0xFF2196F3), size: 28),
//                 const SizedBox(width: 10),
//                 Expanded(
//                   child: TextField(
//                     controller: _controller,
//                     style: const TextStyle(fontFamily: 'TimesNewRoman'),
//                     decoration: const InputDecoration(
//                       hintText: 'Ask your AI...',
//                       hintStyle: TextStyle(fontFamily: 'TimesNewRoman'),
//                       border: InputBorder.none,
//                     ),
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: _sendMessage,
//                   child: Container(
//                     padding: const EdgeInsets.all(12),
//                     decoration: const BoxDecoration(
//                       shape: BoxShape.circle,
//                       gradient: LinearGradient(
//                         colors: [Color(0xFFFF9800), Color(0xFF2196F3)],
//                       ),
//                     ),
//                     child:
//                         const Icon(Icons.send, color: Colors.white, size: 20),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../../services/gemini_service.dart';

class AIAssistantScreen extends StatefulWidget {
  const AIAssistantScreen({super.key});

  @override
  State<AIAssistantScreen> createState() => _AIAssistantScreenState();
}

class _AIAssistantScreenState extends State<AIAssistantScreen> {
  final TextEditingController _controller = TextEditingController();

  List<Map<String, String>> messages = [];
  bool isLoading = false;

  // 🚀 Send Message to Gemini
  Future<void> sendMessage() async {
    String text = _controller.text.trim();
    if (text.isEmpty) return;

    setState(() {
      messages.add({"role": "user", "text": text});
      isLoading = true;
      _controller.clear();
    });

    try {
      String reply = await GeminiService.sendMessage(text);

      setState(() {
        messages.add({"role": "ai", "text": reply});
      });
    } catch (e) {
      setState(() {
        messages.add({"role": "ai", "text": "Error getting response"});
      });
    }

    setState(() {
      isLoading = false;
    });
  }

  // 💬 Chat Bubble
  Widget chatBubble(String text, bool isUser) {
    return Align(
      alignment:
          isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
        padding: const EdgeInsets.all(12),
        constraints: const BoxConstraints(maxWidth: 260),
        decoration: BoxDecoration(
          color: isUser ? Colors.orange : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isUser ? Colors.white : Colors.black87,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AI Assistant"),
        centerTitle: true,
      ),
      body: Column(
        children: [

          // 🧠 Messages List
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final msg = messages[index];
                return chatBubble(
                  msg["text"]!,
                  msg["role"] == "user",
                );
              },
            ),
          ),

          if (isLoading)
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircularProgressIndicator(),
            ),

          // ✍️ Input Area
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            color: Colors.grey.shade100,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Ask something...",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  onPressed: sendMessage,
                  icon: const Icon(Icons.send, color: Colors.orange),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
