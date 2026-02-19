// import 'package:flutter/material.dart';

// class UploadVideoScreen extends StatefulWidget {
//   const UploadVideoScreen({super.key});

//   @override
//   State<UploadVideoScreen> createState() => _UploadVideoScreenState();
// }

// class _UploadVideoScreenState extends State<UploadVideoScreen> {
//   final TextEditingController _titleController = TextEditingController();
//   final TextEditingController _classController = TextEditingController();
//   final TextEditingController _subjectController = TextEditingController();
//   final TextEditingController _descriptionController = TextEditingController();

//   void _pickVideo() {
//     // TODO: Add file picker logic
//     debugPrint('Pick Video File');
//   }

//   void _uploadVideo() {
//     // TODO: Add upload logic
//     debugPrint('Upload Video');
//   }

//   @override
//   void dispose() {
//     _titleController.dispose();
//     _classController.dispose();
//     _subjectController.dispose();
//     _descriptionController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Upload Lecture Video'),
//         backgroundColor: Colors.teal,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               TextField(
//                 controller: _titleController,
//                 decoration: const InputDecoration(
//                   labelText: 'Video Title',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               const SizedBox(height: 12),
//               TextField(
//                 controller: _classController,
//                 decoration: const InputDecoration(
//                   labelText: 'Class',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               const SizedBox(height: 12),
//               TextField(
//                 controller: _subjectController,
//                 decoration: const InputDecoration(
//                   labelText: 'Subject',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               const SizedBox(height: 12),
//               TextField(
//                 controller: _descriptionController,
//                 maxLines: 3,
//                 decoration: const InputDecoration(
//                   labelText: 'Description',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton.icon(
//                 onPressed: _pickVideo,
//                 icon: const Icon(Icons.video_library),
//                 label: const Text('Select Video'),
//                 style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton.icon(
//                 onPressed: _uploadVideo,
//                 icon: const Icon(Icons.cloud_upload),
//                 label: const Text('Upload'),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.teal,
//                   minimumSize: const Size(double.infinity, 50),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';

// class UploadVideoScreen extends StatefulWidget {
//   const UploadVideoScreen({super.key});

//   @override
//   State<UploadVideoScreen> createState() => _UploadVideoScreenState();
// }

// class _UploadVideoScreenState extends State<UploadVideoScreen> {
//   final TextEditingController _titleController = TextEditingController();
//   final TextEditingController _classController = TextEditingController();
//   final TextEditingController _subjectController = TextEditingController();
//   final TextEditingController _descriptionController = TextEditingController();

//   void _pickVideo() {
//     // TODO: Add file picker logic
//     debugPrint('Pick Video File');
//   }

//   void _uploadVideo() {
//     // TODO: Add upload logic
//     debugPrint('Upload Video');
//   }

//   @override
//   void dispose() {
//     _titleController.dispose();
//     _classController.dispose();
//     _subjectController.dispose();
//     _descriptionController.dispose();
//     super.dispose();
//   }

//   InputDecoration _inputDecoration(String label, IconData icon) {
//     return InputDecoration(
//       labelText: label,
//       prefixIcon: Icon(icon, color: Colors.blue),
//       labelStyle: const TextStyle(fontFamily: "Times New Roman"),
//       filled: true,
//       fillColor: Colors.white.withOpacity(0.7),
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(15),
//         borderSide: BorderSide.none,
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         title: const Text(
//           'Upload Lecture Video',
//           style: TextStyle(
//             fontFamily: 'TimesNewRoman',
//             fontWeight: FontWeight.bold,
//             letterSpacing: 1.2,
//             color: Colors.white,
//           ),
//         ),
//         backgroundColor: const Color.fromARGB(0, 44, 7, 111),
//         elevation: 0,
//         centerTitle: true,
//       ),
//       body: Stack(
//         children: [
//           // 🌆 Gradient Background
//           Container(
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [
//               Color(0xFF1E3A8A), // Deep Blue
//               Color.fromARGB(255, 231, 165, 111),
//               Color(0xFF0EA5E9), // Cyan-Blue
//               Color(0xFFFB923C), // Soft Orange
//                 ], // Blue + Orange
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//               ),
//             ),
//           ),

//           // ✨ Glass Effect Form
//           Center(
//             child: Container(
//               margin: const EdgeInsets.all(20),
//               padding: const EdgeInsets.all(20),
//               decoration: BoxDecoration(
//                 color: Colors.white.withOpacity(0.2),
//                 borderRadius: BorderRadius.circular(25),
//                 border: Border.all(color: Colors.white.withOpacity(0.3)),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black26,
//                     blurRadius: 10,
//                     offset: const Offset(0, 6),
//                   )
//                 ],
//               ),
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     TextField(
//                       controller: _titleController,
//                       style: const TextStyle(fontFamily: "Times New Roman"),
//                       decoration: _inputDecoration("Video Title", Icons.title),
//                     ),
//                     const SizedBox(height: 16),
//                     TextField(
//                       controller: _classController,
//                       style: const TextStyle(fontFamily: "Times New Roman"),
//                       decoration:
//                           _inputDecoration("Class", Icons.class_rounded),
//                     ),
//                     const SizedBox(height: 16),
//                     TextField(
//                       controller: _subjectController,
//                       style: const TextStyle(fontFamily: "Times New Roman"),
//                       decoration:
//                           _inputDecoration("Subject", Icons.book_outlined),
//                     ),
//                     const SizedBox(height: 16),
//                     TextField(
//                       controller: _descriptionController,
//                       maxLines: 3,
//                       style: const TextStyle(fontFamily: "Times New Roman"),
//                       decoration: _inputDecoration(
//                           "Description", Icons.description_outlined),
//                     ),
//                     const SizedBox(height: 25),

//                     // 🎥 Pick Video Button
//                     ElevatedButton.icon(
//                       onPressed: _pickVideo,
//                       icon: const Icon(Icons.video_library, color: Colors.white),
//                       label: const Text(
//                         'Select Video',
//                         style: TextStyle(
//                           fontFamily: "Times New Roman",
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                       style: ElevatedButton.styleFrom(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 24, vertical: 14),
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(15)),
//                         backgroundColor: const Color.fromARGB(255, 251, 146, 60),
//                         elevation: 5,
//                       ),
//                     ),
//                     const SizedBox(height: 20),

//                     // ☁️ Upload Button (Full Width with Gradient)
//                     Container(
//                       width: double.infinity,
//                       height: 55,
//                       decoration: BoxDecoration(
//                         gradient: const LinearGradient(
//                           colors: [
//                           Color.fromARGB(255, 251, 146, 60), 
//                           Color.fromARGB(255, 251, 146, 60), // Soft Orange
//                           ],
//                           begin: Alignment.centerLeft,
//                           end: Alignment.centerRight,
//                         ),
//                         borderRadius: BorderRadius.circular(15),
//                       ),
//                       child: ElevatedButton.icon(
//                         onPressed: _uploadVideo,
//                         icon: const Icon(Icons.cloud_upload,
//                             color: Colors.white, size: 22),
//                         label: const Text(
//                           'Upload',
//                           style: TextStyle(
//                             fontFamily: "Times New Roman",
//                             color: Colors.white,
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: const Color.fromARGB(0, 227, 20, 20),
//                           shadowColor: const Color.fromARGB(0, 230, 63, 63),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';

// class UploadVideoScreen extends StatefulWidget {
//   const UploadVideoScreen({super.key});

//   @override
//   State<UploadVideoScreen> createState() => _UploadVideoScreenState();
// }

// class _UploadVideoScreenState extends State<UploadVideoScreen> {

//   final TextEditingController _classController = TextEditingController();
//   final TextEditingController _subjectController = TextEditingController();

//   void _uploadVideo() {

//     if (_classController.text.isEmpty ||
//         _subjectController.text.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Fill all fields")),
//       );
//       return;
//     }

//     // ✅ SEND DATA BACK TO DASHBOARD
//     Navigator.pop(context, {
//       'class': _classController.text,
//       'subject': _subjectController.text,
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Upload Lecture")),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           children: [

//             TextField(
//               controller: _classController,
//               decoration: const InputDecoration(labelText: "Class"),
//             ),

//             const SizedBox(height: 12),

//             TextField(
//               controller: _subjectController,
//               decoration: const InputDecoration(labelText: "Subject"),
//             ),

//             const SizedBox(height: 20),

//             ElevatedButton(
//               onPressed: _uploadVideo,
//               child: const Text("Upload"),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }






import 'dart:ui';
import 'package:flutter/material.dart';

class UploadVideoScreen extends StatefulWidget {
  const UploadVideoScreen({super.key});

  @override
  State<UploadVideoScreen> createState() => _UploadVideoScreenState();
}

class _UploadVideoScreenState extends State<UploadVideoScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _classController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  bool _videoPicked = false;
  String? _videoFileName;

  void _pickVideo() {
    // Placeholder for real file picker integration.
    // Replace with FilePicker or ImagePicker logic.
    setState(() {
      _videoPicked = true;
      _videoFileName = "sample_video.mp4"; // mock filename
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Video selected (mock)")),
    );
  }

  // ✅ SEND DATA BACK TO DASHBOARD
  void _uploadVideo() {
    // required fields: class, subject, title, and a picked video
    if (_classController.text.isEmpty ||
        _subjectController.text.isEmpty ||
        _titleController.text.isEmpty ||
        !_videoPicked) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill required fields and select a video")),
      );
      return;
    }

    Navigator.pop(context, {
      'class': _classController.text,
      'subject': _subjectController.text,
      'title': _titleController.text,
      'description': _descriptionController.text,
      'filename': _videoFileName ?? '',
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _classController.dispose();
    _subjectController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  // NEW: outlined purple style like your first image
  InputDecoration _inputDecoration(String label, IconData icon,
      {Widget? suffix}) {
    const borderRadius = 30.0;
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(
        fontFamily: "Times New Roman",
        color: Colors.deepPurple,
        fontSize: 14,
      ),
      prefixIcon: Icon(icon, color: Colors.blue),
      suffixIcon: suffix,
      filled: true,
      // subtle fill to keep glass feel; tune opacity to match your background
      fillColor: Colors.white.withOpacity(0.12),
      contentPadding:
          const EdgeInsets.symmetric(vertical: 18.0, horizontal: 20.0),
      // normal border
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: const BorderSide(color: Colors.deepPurple, width: 2),
      ),
      // enabled border
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: const BorderSide(color: Colors.deepPurple, width: 2),
      ),
      // focused border
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: const BorderSide(color: Colors.deepPurple, width: 2.6),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      
      appBar: AppBar(
        title: const Text(
          'Upload Lecture Video',
          style: TextStyle(
            fontFamily: 'TimesNewRoman',
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            color: Colors.white,
          ),
        ),
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
      body: Stack(
        children: [
          // 🌆 GRADIENT BACKGROUND
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFFB923C), Color(0xFF0077B6)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          // ✨ GLASS FORM
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
                child: Container(
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.18),
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Colors.white.withOpacity(0.28)),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // Video Title (styled to match first image)
                        TextField(
                          controller: _titleController,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 18),
                          decoration:
                              _inputDecoration("Video Title", Icons.title),
                        ),

                        const SizedBox(height: 16),

                        // Class
                        TextField(
                          controller: _classController,
                          decoration:
                              _inputDecoration("Class", Icons.class_rounded),
                        ),

                        const SizedBox(height: 27),

                        // Subject
                        TextField(
                          controller: _subjectController,
                          decoration:
                              _inputDecoration("Subject", Icons.book_outlined),
                        ),

                        const SizedBox(height: 16),

                        // Description (multiline)
                        TextField(
                          controller: _descriptionController,
                          maxLines: 4,
                          decoration: _inputDecoration(
                              "Description", Icons.description_outlined),
                        ),

                        const SizedBox(height: 20),

                        // Selected video info row (shows filename if picked)
                        if (_videoPicked)
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 12),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.06),
                              borderRadius: BorderRadius.circular(18),
                              border:
                                  Border.all(color: Colors.white.withOpacity(0.08)),
                            ),
                            child: Row(
                              children: [
                                const Icon(Icons.videocam, color: Colors.white),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    _videoFileName ?? "Selected video",
                                    style: const TextStyle(
                                        color: Colors.white70, fontSize: 14),
                                  ),
                                ),
                                TextButton.icon(
                                  onPressed: () {
                                    // allow re-select (mock)
                                    _pickVideo();
                                  },
                                  icon: const Icon(Icons.change_circle,
                                      color: Colors.white),
                                  label: const Text(
                                    "Change",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),

                        const SizedBox(height: 12),

                        // 🎥 SELECT VIDEO BUTTON
                        ElevatedButton.icon(
                          onPressed: _pickVideo,
                          icon:
                              const Icon(Icons.video_library, color: Colors.white),
                          label: const Text(
                            'Select Video',
                            style: TextStyle(
                              fontFamily: "Times New Roman",
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 251, 146, 60),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        // ☁️ UPLOAD BUTTON
                        Container(
                          width: double.infinity,
                          height: 55,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color.fromARGB(255, 251, 146, 60),
                                Color.fromARGB(255, 251, 146, 60),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ElevatedButton.icon(
                            onPressed: _uploadVideo,
                            icon: const Icon(Icons.cloud_upload, color: Colors.white),
                            label: const Text(
                              'Upload',
                              style: TextStyle(
                                fontFamily: "Times New Roman",
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}




// import 'dart:ui';
// import 'package:flutter/material.dart';

// class UploadVideoScreen extends StatefulWidget {
//   const UploadVideoScreen({super.key});

//   @override
//   State<UploadVideoScreen> createState() => _UploadVideoScreenState();
// }

// class _UploadVideoScreenState extends State<UploadVideoScreen> {

//   final TextEditingController _titleController = TextEditingController();
//   final TextEditingController _classController = TextEditingController();
//   final TextEditingController _subjectController = TextEditingController();
//   final TextEditingController _descriptionController = TextEditingController();
//   final TextEditingController _durationController = TextEditingController();
//   final TextEditingController _tagsController = TextEditingController();

//   void _pickVideo() {
//     // 👉 Later you can add file_picker here
//     debugPrint("Select Video Clicked");
//   }

//   // ✅ SEND DATA BACK TO DASHBOARD
//   void _uploadVideo() {

//     if (_classController.text.isEmpty ||
//         _subjectController.text.isEmpty ||
//         _titleController.text.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Please fill required fields")),
//       );
//       return;
//     }

//     Navigator.pop(context, {
//       'class': _classController.text,
//       'subject': _subjectController.text,
//       'title': _titleController.text,
//       'description': _descriptionController.text,
//       'duration': _durationController.text,
//       'tags': _tagsController.text,
//     });
//   }

//   @override
//   void dispose() {
//     _titleController.dispose();
//     _classController.dispose();
//     _subjectController.dispose();
//     _descriptionController.dispose();
//     _durationController.dispose();
//     _tagsController.dispose();
//     super.dispose();
//   }

//   InputDecoration _inputDecoration(String label, IconData icon) {
//     return InputDecoration(
//       labelText: label,
//       prefixIcon: Icon(icon, color: Colors.blue),
//       labelStyle: const TextStyle(fontFamily: "Times New Roman"),
//       filled: true,
//       fillColor: Colors.white.withOpacity(0.7),
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(15),
//         borderSide: BorderSide.none,
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,

//       appBar: AppBar(
//         title: const Text(
//           'Upload Lecture Video',
//           style: TextStyle(
//             fontFamily: 'TimesNewRoman',
//             fontWeight: FontWeight.bold,
//             letterSpacing: 1.2,
//             color: Colors.white,
//           ),
//         ),
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         centerTitle: true,
//       ),

//       body: Stack(
//         children: [

//           // 🌆 GRADIENT BACKGROUND
//           Container(
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                  colors: [Color(0xFFFB923C), Color(0xFF0077B6)],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//               ),
//             ),
//           ),

//           // ✨ GLASS FORM
//           Center(
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(25),
//               child: BackdropFilter(
//                 filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
//                 child: Container(
//                   margin: const EdgeInsets.all(20),
//                   padding: const EdgeInsets.all(20),
//                   decoration: BoxDecoration(
//                     color: Colors.white.withOpacity(0.2),
//                     borderRadius: BorderRadius.circular(25),
//                     border: Border.all(color: Colors.white.withOpacity(0.3)),
//                   ),
//                   child: SingleChildScrollView(
//                     child: Column(
//                       children: [

//                         TextField(
//                           controller: _titleController,
//                           decoration:
//                               _inputDecoration("Video Title", Icons.title),
//                         ),

//                         const SizedBox(height: 16),

//                         TextField(
//                           controller: _classController,
//                           decoration:
//                               _inputDecoration("Class", Icons.class_rounded),
//                         ),

//                         const SizedBox(height: 16),

//                         TextField(
//                           controller: _subjectController,
//                           decoration:
//                               _inputDecoration("Subject", Icons.book_outlined),
//                         ),

//                         const SizedBox(height: 16),


//                         TextField(
//                           controller: _descriptionController,
//                           maxLines: 3,
//                           decoration: _inputDecoration(
//                               "Description",
//                               Icons.description_outlined),
//                         ),

//                         const SizedBox(height: 25),

//                         // 🎥 SELECT VIDEO BUTTON
//                         ElevatedButton.icon(
//                           onPressed: _pickVideo,
//                           icon: const Icon(Icons.video_library,
//                               color: Colors.white),
//                           label: const Text(
//                             'Select Video',
//                             style: TextStyle(
//                               fontFamily: "Times New Roman",
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white,
//                             ),
//                           ),
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor:
//                                 const Color.fromARGB(255, 251, 146, 60),
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 24, vertical: 14),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(15),
//                             ),
//                           ),
//                         ),

//                         const SizedBox(height: 20),

//                         // ☁️ UPLOAD BUTTON
//                         Container(
//                           width: double.infinity,
//                           height: 55,
//                           decoration: BoxDecoration(
//                             gradient: const LinearGradient(
//                               colors: [
//                                 Color.fromARGB(255, 251, 146, 60),
//                                 Color.fromARGB(255, 251, 146, 60),
//                               ],
//                             ),
//                             borderRadius: BorderRadius.circular(15),
//                           ),
//                           child: ElevatedButton.icon(
//                             onPressed: _uploadVideo,
//                             icon: const Icon(Icons.cloud_upload,
//                                 color: Colors.white),
//                             label: const Text(
//                               'Upload',
//                               style: TextStyle(
//                                 fontFamily: "Times New Roman",
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white,
//                               ),
//                             ),
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.transparent,
//                               shadowColor: Colors.transparent,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
