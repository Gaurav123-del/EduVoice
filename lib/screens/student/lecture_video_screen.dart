

// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
// import 'package:chewie/chewie.dart';

// class Lecture {
//   final String topic;
//   final String subject;
//   final String teacher;
//   final DateTime date;

//   Lecture({
//     required this.topic,
//     required this.subject,
//     required this.teacher,
//     required this.date,
//   });
// }
// class LectureVideoScreen extends StatefulWidget {
//   final Lecture lecture;

//   const LectureVideoScreen({super.key, required this.lecture});

//   @override
//   State<LectureVideoScreen> createState() => _LectureVideoScreenState();
// }

// class _LectureVideoScreenState extends State<LectureVideoScreen> {
//   late VideoPlayerController _videoPlayerController;
//   ChewieController? _chewieController;

//   final TextEditingController _noteController = TextEditingController();
//   final List<String> _comments = [];

//   // Example other students' queries
//   final List<String> _studentQueries = [
//     'Could you explain slide 5 in more detail?',
//     'Is there a reference book for this topic?',
//     'Will there be a quiz on this lecture?',
//   ];

//   @override
//   void initState() {
//     super.initState();

//     _videoPlayerController = VideoPlayerController.networkUrl(
//       Uri.parse('https://youtu.be/0IAPZzGSbME?si=-nX1LMJWxfQROXpV'),
//     )..initialize().then((_) {
//         setState(() {});
//       });

//     _chewieController = ChewieController(
//       videoPlayerController: _videoPlayerController,
//       autoPlay: false,
//       looping: false,
//     );
//   }

//   @override
//   void dispose() {
//     _videoPlayerController.dispose();
//     _chewieController?.dispose();
//     _noteController.dispose();
//     super.dispose();
//   }

//   void _addComment() {
//     final text = _noteController.text.trim();
//     if (text.isNotEmpty) {
//       setState(() {
//         _comments.add(text);
//         _noteController.clear();
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFE0F7FA),
//       appBar: AppBar(
//         title: Text(widget.lecture.topic),
//         backgroundColor: Colors.teal,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // 🎥 Video Player
//             AspectRatio(
//               aspectRatio: _videoPlayerController.value.isInitialized
//                   ? _videoPlayerController.value.aspectRatio
//                   : 16 / 9,
//               child: _chewieController != null &&
//                       _videoPlayerController.value.isInitialized
//                   ? Chewie(controller: _chewieController!)
//                   : const Center(child: CircularProgressIndicator()),
//             ),

//             // 🗂️ Lecture Info
//             Container(
//               padding: const EdgeInsets.all(16),
//               decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [Color(0xFFFFFFFF), Color(0xFFF1F8E9)],
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 ),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black12,
//                     blurRadius: 8,
//                     offset: Offset(0, 4),
//                   ),
//                 ],
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     widget.lecture.topic,
//                     style: const TextStyle(
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.teal,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   Row(
//                     children: [
//                       const Icon(Icons.person, color: Colors.teal),
//                       const SizedBox(width: 4),
//                       Text(widget.lecture.teacher),
//                       const SizedBox(width: 16),
//                       const Icon(Icons.date_range, color: Colors.teal),
//                       const SizedBox(width: 4),
//                       Text('${widget.lecture.date.toLocal()}'.split(' ')[0]),
//                     ],
//                   ),
//                   const SizedBox(height: 12),
//                   const Text(
//                     '📄 This lecture covers key concepts and examples for better understanding.',
//                     style: TextStyle(fontSize: 14),
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 16),

//             // ✅ Comments Section
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     '💬 Your Comments & Queries',
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.teal,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   ListView.builder(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     itemCount: _comments.length,
//                     itemBuilder: (context, index) {
//                       return Card(
//                         margin: const EdgeInsets.symmetric(vertical: 4),
//                         child: ListTile(
//                           leading:
//                               const Icon(Icons.person, color: Colors.teal),
//                           title: Text(_comments[index]),
//                         ),
//                       );
//                     },
//                   ),
//                   const SizedBox(height: 8),
//                   Container(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 12, vertical: 4),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(30),
//                       boxShadow: const [
//                         BoxShadow(
//                           color: Colors.black12,
//                           blurRadius: 5,
//                           offset: Offset(0, 3),
//                         ),
//                       ],
//                     ),
//                     child: Row(
//                       children: [
//                         const Icon(Icons.edit, color: Colors.teal),
//                         const SizedBox(width: 8),
//                         Expanded(
//                           child: TextField(
//                             controller: _noteController,
//                             decoration: const InputDecoration(
//                               hintText: 'Add a comment...',
//                               border: InputBorder.none,
//                             ),
//                           ),
//                         ),
//                         IconButton(
//                           icon: const Icon(Icons.send, color: Colors.teal),
//                           onPressed: _addComment,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 24),

//             // ✅ Other Student Queries
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     '👥 Other Students\' Queries',
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.teal,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   ListView.builder(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     itemCount: _studentQueries.length,
//                     itemBuilder: (context, index) {
//                       return Card(
//                         color: Colors.teal.shade50,
//                         margin: const EdgeInsets.symmetric(vertical: 4),
//                         child: ListTile(
//                           leading: const Icon(Icons.chat, color: Colors.teal),
//                           title: Text(_studentQueries[index]),
//                         ),
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 24),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
// import 'package:chewie/chewie.dart';

// class Lecture {
//   final String topic;
//   final String subject;
//   final String teacher;
//   final DateTime date;

//   Lecture({
//     required this.topic,
//     required this.subject,
//     required this.teacher,
//     required this.date,
//   });
// }

// class LectureVideoScreen extends StatefulWidget {
//   final Lecture lecture;

//   const LectureVideoScreen({super.key, required this.lecture});

//   @override
//   State<LectureVideoScreen> createState() => _LectureVideoScreenState();
// }

// class _LectureVideoScreenState extends State<LectureVideoScreen> {
//   late VideoPlayerController _videoPlayerController;
//   ChewieController? _chewieController;

//   final TextEditingController _noteController = TextEditingController();
//   final List<String> _comments = [];

//   final List<String> _studentQueries = [
//     'Could you explain slide 5 in more detail?',
//     'Is there a reference book for this topic?',
//     'Will there be a quiz on this lecture?',
//   ];

//   @override
//   void initState() {
//     super.initState();

//     _videoPlayerController = VideoPlayerController.networkUrl(
//       Uri.parse('https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'),
//     )..initialize().then((_) {
//         setState(() {});
//       });

//     _chewieController = ChewieController(
//       videoPlayerController: _videoPlayerController,
//       autoPlay: false,
//       looping: false,
//     );
//   }

//   @override
//   void dispose() {
//     _videoPlayerController.dispose();
//     _chewieController?.dispose();
//     _noteController.dispose();
//     super.dispose();
//   }

//   void _addComment() {
//     final text = _noteController.text.trim();
//     if (text.isNotEmpty) {
//       setState(() {
//         _comments.add(text);
//         _noteController.clear();
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF9FAFB),
//       appBar: AppBar(
//         title: Text(
//           widget.lecture.topic,
//           style: const TextStyle(
//             fontFamily: 'TimesNewRoman',
//             fontWeight: FontWeight.bold,
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
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // 🎥 Video Player with card style
//             Container(
//               margin: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(16),
//                 gradient: const LinearGradient(
//                   colors: [Color(0xFF2196F3), Color(0xFFFF9800)],
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 ),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.1),
//                     blurRadius: 8,
//                     offset: const Offset(0, 4),
//                   ),
//                 ],
//               ),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(16),
//                 child: AspectRatio(
//                   aspectRatio: _videoPlayerController.value.isInitialized
//                       ? _videoPlayerController.value.aspectRatio
//                       : 16 / 9,
//                   child: _chewieController != null &&
//                           _videoPlayerController.value.isInitialized
//                       ? Chewie(controller: _chewieController!)
//                       : const Center(child: CircularProgressIndicator()),
//                 ),
//               ),
//             ),

//             // 🗂️ Lecture Info Card
//             Container(
//               margin: const EdgeInsets.symmetric(horizontal: 16),
//               padding: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 gradient: const LinearGradient(
//                   colors: [Colors.white, Color(0xFFE3F2FD)],
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 ),
//                 borderRadius: BorderRadius.circular(16),
//                 boxShadow: const [
//                   BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
//                 ],
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     widget.lecture.topic,
//                     style: const TextStyle(
//                       fontFamily: 'TimesNewRoman',
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold,
//                       color: Color(0xFF2196F3),
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   Row(
//                     children: [
//                       const Icon(Icons.person, color: Color(0xFFFF9800)),
//                       const SizedBox(width: 6),
//                       Text(widget.lecture.teacher,
//                           style: const TextStyle(fontFamily: 'TimesNewRoman')),
//                       const SizedBox(width: 16),
//                       const Icon(Icons.date_range, color: Color(0xFFFF9800)),
//                       const SizedBox(width: 6),
//                       Text('${widget.lecture.date.toLocal()}'.split(' ')[0],
//                           style: const TextStyle(fontFamily: 'TimesNewRoman')),
//                     ],
//                   ),
//                   const SizedBox(height: 12),
//                   const Text(
//                     '📄 This lecture covers key concepts and examples for better understanding.',
//                     style: TextStyle(
//                       fontFamily: 'TimesNewRoman',
//                       fontSize: 14,
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 20),

//             // 💬 Comments Section
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     '💬 Your Comments & Queries',
//                     style: TextStyle(
//                       fontFamily: 'TimesNewRoman',
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                       color: Color(0xFF2196F3),
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   ListView.builder(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     itemCount: _comments.length,
//                     itemBuilder: (context, index) {
//                       return Card(
//                         margin: const EdgeInsets.symmetric(vertical: 4),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         elevation: 2,
//                         child: ListTile(
//                           leading: const Icon(Icons.person, color: Color(0xFF2196F3)),
//                           title: Text(
//                             _comments[index],
//                             style: const TextStyle(fontFamily: 'TimesNewRoman'),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                   const SizedBox(height: 8),
//                   Container(
//                     padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(30),
//                       boxShadow: const [
//                         BoxShadow(color: Colors.black12, blurRadius: 5, offset: Offset(0, 3)),
//                       ],
//                     ),
//                     child: Row(
//                       children: [
//                         const Icon(Icons.edit, color: Color(0xFF2196F3)),
//                         const SizedBox(width: 8),
//                         Expanded(
//                           child: TextField(
//                             controller: _noteController,
//                             style: const TextStyle(fontFamily: 'TimesNewRoman'),
//                             decoration: const InputDecoration(
//                               hintText: 'Add a comment...',
//                               hintStyle: TextStyle(fontFamily: 'TimesNewRoman'),
//                               border: InputBorder.none,
//                             ),
//                           ),
//                         ),
//                         IconButton(
//                           icon: const Icon(Icons.send, color: Color(0xFFFF9800)),
//                           onPressed: _addComment,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 24),

//             // 👥 Other Student Queries
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     '👥 Other Students\' Queries',
//                     style: TextStyle(
//                       fontFamily: 'TimesNewRoman',
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                       color: Color(0xFF2196F3),
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   ListView.builder(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     itemCount: _studentQueries.length,
//                     itemBuilder: (context, index) {
//                       return Card(
//                         color: Colors.blue.shade50,
//                         margin: const EdgeInsets.symmetric(vertical: 4),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         child: ListTile(
//                           leading: const Icon(Icons.chat, color: Color(0xFFFF9800)),
//                           title: Text(
//                             _studentQueries[index],
//                             style: const TextStyle(fontFamily: 'TimesNewRoman'),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 24),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class Lecture {
  final String topic;
  final String subject;
  final String teacher;
  final DateTime date;

  Lecture({
    required this.topic,
    required this.subject,
    required this.teacher,
    required this.date,
  });
}

class LectureVideoScreen extends StatefulWidget {
  final Lecture lecture;

  const LectureVideoScreen({super.key, required this.lecture});

  @override
  State<LectureVideoScreen> createState() => _LectureVideoScreenState();
}

class _LectureVideoScreenState extends State<LectureVideoScreen> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;

  final TextEditingController _noteController = TextEditingController();
  final List<String> _comments = [];

  final List<String> _studentQueries = [
    'Could you explain slide 5 in more detail?',
    'Is there a reference book for this topic?',
    'Will there be a quiz on this lecture?',
  ];

  @override
  void initState() {
    super.initState();

    _videoPlayerController = VideoPlayerController.networkUrl(
      Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
      ),
    )..initialize().then((_) {
        setState(() {});
      });

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: false,
      looping: false,
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    _noteController.dispose();
    super.dispose();
  }

  void _addComment() {
    final text = _noteController.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        _comments.add(text);
        _noteController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        title: Text(
          widget.lecture.topic,   //Data Structure 
          style: const TextStyle(
            fontFamily: "TimesNewRoman",
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            color: Colors.white,

          ),
        ),
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🎥 Video Player
            Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white.withOpacity(0.9),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: AspectRatio(
                  aspectRatio: _videoPlayerController.value.isInitialized
                      ? _videoPlayerController.value.aspectRatio
                      : 16 / 9,
                  child: _chewieController != null &&
                          _videoPlayerController.value.isInitialized
                      ? Chewie(controller: _chewieController!)
                      : const Center(child: CircularProgressIndicator()),
                ),
              ),
            ),

            // 🗂️ Lecture Info
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.white, Color(0xFFE3F2FD)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
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
                  Text(
                    widget.lecture.topic,
                    style: const TextStyle(
                      fontFamily: 'TimesNewRoman',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2196F3),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "📘 Subject: ${widget.lecture.subject}",
                    style: const TextStyle(
                      fontFamily: 'TimesNewRoman',
                      fontSize: 15,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.person, color: Color(0xFFFF9800)),
                      const SizedBox(width: 6),
                      Text(widget.lecture.teacher,
                          style: const TextStyle(fontFamily: 'TimesNewRoman')),
                      const SizedBox(width: 16),
                      const Icon(Icons.date_range, color: Color(0xFFFF9800)),
                      const SizedBox(width: 6),
                      Text('${widget.lecture.date.toLocal()}'.split(' ')[0],
                          style: const TextStyle(fontFamily: 'TimesNewRoman')),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    '📄 This lecture covers key concepts and examples for better understanding.',
                    style: TextStyle(
                      fontFamily: 'TimesNewRoman',
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 💬 Comments Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '💬 Your Comments & Queries',
                    style: TextStyle(
                      fontFamily: 'TimesNewRoman',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2196F3),
                    ),
                  ),
                  const SizedBox(height: 8),
                  ..._comments.map((comment) {
                    return Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF2196F3), Color(0xFFFF9800)],
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          comment,
                          style: const TextStyle(
                            fontFamily: 'TimesNewRoman',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.edit, color: Color(0xFF2196F3)),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            controller: _noteController,
                            style: const TextStyle(fontFamily: 'TimesNewRoman'),
                            decoration: const InputDecoration(
                              hintText: 'Add a comment...',
                              hintStyle:
                                  TextStyle(fontFamily: 'TimesNewRoman'),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.send, color: Color(0xFFFF9800)),
                          onPressed: _addComment,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // 👥 Other Student Queries
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '👥 Other Students\' Queries',
                    style: TextStyle(
                      fontFamily: 'TimesNewRoman',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2196F3),
                    ),
                  ),
                  const SizedBox(height: 8),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _studentQueries.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: index.isEven
                            ? Colors.blue.shade50
                            : Colors.orange.shade50,
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          leading: const Icon(Icons.chat,
                              color: Color(0xFF2196F3)),
                          title: Text(
                            _studentQueries[index],
                            style: const TextStyle(fontFamily: 'TimesNewRoman'),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),

      // 🚀 Floating Button for AI
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xFF2196F3),
        icon: const Icon(Icons.smart_toy, color: Colors.white),
        label: const Text(
          "Ask AI About Lecture",
          style: TextStyle(fontFamily: 'TimesNewRoman'),
        ),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('🤖 Connecting to AI Assistant...')),
          );
          // TODO: Navigator.push(...) to AI screen
        },
      ),
    );
  }
}
