// // import 'package:flutter/material.dart';

// // class FeeStatusScreen extends StatefulWidget {
// //   const FeeStatusScreen({super.key});

// //   @override
// //   State<FeeStatusScreen> createState() => _FeeStatusScreenState();
// // }

// // class _FeeStatusScreenState extends State<FeeStatusScreen> {
// //   String selectedFilter = "All";

// //   final List<Map<String, dynamic>> fees = [
// //     {"billNo": "190411", "amount": 600.0, "date": "24/05/2023", "status": "Paid"},
// //     {"billNo": "230803", "amount": 15940.0, "date": "04/09/2023", "status": "Paid"},
// //     {"billNo": "280429", "amount": 15940.0, "date": "20/01/2024", "status": "Paid"},
// //     {"billNo": "269892", "amount": 85500.0, "date": "15/02/2024", "status": "Paid"},
// //     {"billNo": "272800", "amount": 3600.0, "date": "15/02/2024", "status": "Paid"},
// //     {"billNo": "293586", "amount": 1300.0, "date": "06/03/2024", "status": "Due"},
// //     {"billNo": "192540", "amount": 94100.0, "date": "11/06/2024", "status": "Paid"},
// //   ];

// //   @override
// //   Widget build(BuildContext context) {
// //     final filteredFees = selectedFilter == "All"
// //         ? fees
// //         : fees.where((fee) => fee["status"] == selectedFilter).toList();

// //     return Scaffold(
// //       backgroundColor: const Color(0xFFF5F7FA),
// //       appBar: AppBar(
// //         title: const Text(
// //           "Fee Status",
// //           style: TextStyle(fontFamily: "TimesNewRoman"),
// //         ),
// //         backgroundColor: const Color(0xFF1E3A8A),
// //         centerTitle: true,
// //         elevation: 2,
// //       ),
// //       body: Column(
// //         children: [
// //           /// Filter buttons
// //           Padding(
// //             padding: const EdgeInsets.all(12),
// //             child: Row(
// //               mainAxisAlignment: MainAxisAlignment.center,
// //               children: [
// //                 FilterChip(
// //                   label: const Text("Paid", style: TextStyle(fontFamily: "TimesNewRoman")),
// //                   selected: selectedFilter == "Paid",
// //                   onSelected: (_) => setState(() => selectedFilter = "Paid"),
// //                   selectedColor: Colors.green.shade100,
// //                 ),
// //                 const SizedBox(width: 10),
// //                 FilterChip(
// //                   label: const Text("Due", style: TextStyle(fontFamily: "TimesNewRoman")),
// //                   selected: selectedFilter == "Due",
// //                   onSelected: (_) => setState(() => selectedFilter = "Due"),
// //                   selectedColor: Colors.red.shade100,
// //                 ),
// //                 const SizedBox(width: 10),
// //                 FilterChip(
// //                   label: const Text("All", style: TextStyle(fontFamily: "TimesNewRoman")),
// //                   selected: selectedFilter == "All",
// //                   onSelected: (_) => setState(() => selectedFilter = "All"),
// //                   selectedColor: Colors.blue.shade100,
// //                 ),
// //               ],
// //             ),
// //           ),

// //           /// Fee List
// //           Expanded(
// //             child: ListView.builder(
// //               itemCount: filteredFees.length,
// //               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
// //               itemBuilder: (context, index) {
// //                 final fee = filteredFees[index];
// //                 return Card(
// //                   shape: RoundedRectangleBorder(
// //                     borderRadius: BorderRadius.circular(12),
// //                   ),
// //                   margin: const EdgeInsets.symmetric(vertical: 8),
// //                   elevation: 2,
// //                   child: ListTile(
// //                     leading: CircleAvatar(
// //                       backgroundColor: fee["status"] == "Paid" ? Colors.green : Colors.red,
// //                       child: const Icon(Icons.receipt_long, color: Colors.white),
// //                     ),
// //                     title: Text(
// //                       "Bill No. ${fee["billNo"]}",
// //                       style: const TextStyle(
// //                         fontFamily: "TimesNewRoman",
// //                         fontWeight: FontWeight.bold,
// //                       ),
// //                     ),
// //                     subtitle: Text(
// //                       "₹ ${fee["amount"]} • ${fee["status"]} on ${fee["date"]}",
// //                       style: TextStyle(
// //                         fontFamily: "TimesNewRoman",
// //                         color: fee["status"] == "Paid" ? Colors.green : Colors.red,
// //                       ),
// //                     ),
// //                     trailing: Text(
// //                       fee["status"],
// //                       style: TextStyle(
// //                         fontFamily: "TimesNewRoman",
// //                         fontWeight: FontWeight.bold,
// //                         color: fee["status"] == "Paid" ? Colors.green : Colors.red,
// //                       ),
// //                     ),
// //                   ),
// //                 );
// //               },
// //             ),
// //           ),

// //           /// Pay button (if dues exist)
// //           if (fees.any((fee) => fee["status"] == "Due"))
// //             Padding(
// //               padding: const EdgeInsets.all(16),
// //               child: SizedBox(
// //                 width: double.infinity,
// //                 child: ElevatedButton(
// //                   onPressed: () {},
// //                   style: ElevatedButton.styleFrom(
// //                     backgroundColor: const Color(0xFF1E3A8A),
// //                     padding: const EdgeInsets.symmetric(vertical: 16),
// //                     shape: RoundedRectangleBorder(
// //                       borderRadius: BorderRadius.circular(12),
// //                     ),
// //                   ),
// //                   child: const Text(
// //                     "PAY NOW",
// //                     style: TextStyle(
// //                       fontFamily: "TimesNewRoman",
// //                       fontSize: 18,
// //                       color: Colors.white,
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //             ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';

// class FeeStatusScreen extends StatefulWidget {
//   const FeeStatusScreen({super.key});

//   @override
//   State<FeeStatusScreen> createState() => _FeeStatusScreenState();
// }

// class _FeeStatusScreenState extends State<FeeStatusScreen> {
//   String selectedFilter = "All";

//   final List<Map<String, dynamic>> fees = [
//     {"billNo": "190411", "amount": 600.0, "date": "24/05/2023", "status": "Paid"},
//     {"billNo": "230803", "amount": 15940.0, "date": "04/09/2023", "status": "Paid"},
//     {"billNo": "280429", "amount": 15940.0, "date": "20/01/2024", "status": "Paid"},
//     {"billNo": "269892", "amount": 85500.0, "date": "15/02/2024", "status": "Paid"},
//     {"billNo": "272800", "amount": 3600.0, "date": "15/02/2024", "status": "Paid"},
//     {"billNo": "293586", "amount": 1300.0, "date": "06/03/2024", "status": "Due"},
//     {"billNo": "192540", "amount": 94100.0, "date": "11/06/2024", "status": "Paid"},
//   ];

//   @override
//   Widget build(BuildContext context) {
//     final filteredFees = selectedFilter == "All"
//         ? fees
//         : fees.where((fee) => fee["status"] == selectedFilter).toList();

//     return Scaffold(
//       backgroundColor: const Color(0xFFF5F7FA),
//       body: Column(
//         children: [
//           /// Curved Gradient Header
//           Container(
//             height: 160,
//             width: double.infinity,
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [Color(0xFF2563EB), Color(0xFF1E3A8A)],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//               ),
//               borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(30),
//                 bottomRight: Radius.circular(30),
//               ),
//             ),
//             child: const SafeArea(
//               child: Center(
//                 child: Text(
//                   "Fee Status",
//                   style: TextStyle(
//                     fontFamily: "TimesNewRoman",
//                     fontSize: 22,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//           ),

//           /// Filter chips
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ChoiceChip(
//                   label: const Text("Paid", style: TextStyle(fontFamily: "TimesNewRoman")),
//                   selected: selectedFilter == "Paid",
//                   onSelected: (_) => setState(() => selectedFilter = "Paid"),
//                   selectedColor: Colors.green.shade300,
//                 ),
//                 const SizedBox(width: 10),
//                 ChoiceChip(
//                   label: const Text("Due", style: TextStyle(fontFamily: "TimesNewRoman")),
//                   selected: selectedFilter == "Due",
//                   onSelected: (_) => setState(() => selectedFilter = "Due"),
//                   selectedColor: Colors.red.shade300,
//                 ),
//                 const SizedBox(width: 10),
//                 ChoiceChip(
//                   label: const Text("All", style: TextStyle(fontFamily: "TimesNewRoman")),
//                   selected: selectedFilter == "All",
//                   onSelected: (_) => setState(() => selectedFilter = "All"),
//                   selectedColor: Colors.orange.shade300,
//                 ),
//               ],
//             ),
//           ),

//           /// Fee List
//           Expanded(
//             child: ListView.builder(
//               itemCount: filteredFees.length,
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//               itemBuilder: (context, index) {
//                 final fee = filteredFees[index];
//                 final isPaid = fee["status"] == "Paid";

//                 return AnimatedContainer(
//                   duration: const Duration(milliseconds: 300),
//                   margin: const EdgeInsets.symmetric(vertical: 8),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(14),
//                     boxShadow: [
//                       BoxShadow(
//                         color: isPaid ? Colors.green.withOpacity(0.2) : Colors.red.withOpacity(0.2),
//                         blurRadius: 8,
//                         offset: const Offset(2, 4),
//                       ),
//                     ],
//                   ),
//                   child: ListTile(
//                     leading: CircleAvatar(
//                       backgroundColor: isPaid ? Colors.green : Colors.red,
//                       child: const Icon(Icons.receipt_long, color: Colors.white),
//                     ),
//                     title: Text(
//                       "Bill No. ${fee["billNo"]}",
//                       style: const TextStyle(
//                         fontFamily: "TimesNewRoman",
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     subtitle: Text(
//                       "₹ ${fee["amount"]} • ${fee["date"]}",
//                       style: TextStyle(
//                         fontFamily: "TimesNewRoman",
//                         color: isPaid ? Colors.green : Colors.red,
//                       ),
//                     ),
//                     trailing: Text(
//                       fee["status"],
//                       style: TextStyle(
//                         fontFamily: "TimesNewRoman",
//                         fontWeight: FontWeight.bold,
//                         color: isPaid ? Colors.green : Colors.red,
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),

//           /// Pay button (if dues exist)
//           if (fees.any((fee) => fee["status"] == "Due"))
//             SafeArea(
//               child: Padding(
//                 padding: const EdgeInsets.all(16),
//                 child: SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         const SnackBar(
//                           content: Text("Redirecting to Payment..."),
//                         ),
//                       );
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.orange.shade700,
//                       padding: const EdgeInsets.symmetric(vertical: 16),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                     child: const Text(
//                       "PAY NOW",
//                       style: TextStyle(
//                         fontFamily: "TimesNewRoman",
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class FeeStatusScreen extends StatefulWidget {
  const FeeStatusScreen({super.key});

  @override
  State<FeeStatusScreen> createState() => _FeeStatusScreenState();
}

class _FeeStatusScreenState extends State<FeeStatusScreen> {
  String selectedFilter = "All";

  final List<Map<String, dynamic>> fees = [
    {"billNo": "190411", "amount": 600.0, "date": "24/05/2023", "status": "Paid"},
    {"billNo": "230803", "amount": 15940.0, "date": "04/09/2023", "status": "Paid"},
    {"billNo": "280429", "amount": 15940.0, "date": "20/01/2024", "status": "Paid"},
    {"billNo": "269892", "amount": 85500.0, "date": "15/02/2024", "status": "Paid"},
    {"billNo": "272800", "amount": 3600.0, "date": "15/02/2024", "status": "Paid"},
    {"billNo": "293586", "amount": 1300.0, "date": "06/03/2024", "status": "Due"},
    {"billNo": "192540", "amount": 94100.0, "date": "11/06/2024", "status": "Paid"},
  ];

  @override
  Widget build(BuildContext context) {
    final filteredFees = selectedFilter == "All"
        ? fees
        : fees.where((fee) => fee["status"] == selectedFilter).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        title: const Text(
          "Fee Status",
          style: TextStyle(fontFamily: "TimesNewRoman", fontWeight: FontWeight.bold ,letterSpacing: 1.2, color: Colors.white,),
        ),
        centerTitle: true,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF2563EB), Color(0xFFFF6B35)], // Blue + Orange
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          /// Filter buttons
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FilterChip(
                  label: const Text("Paid", style: TextStyle(fontFamily: "TimesNewRoman")),
                  selected: selectedFilter == "Paid",
                  onSelected: (_) => setState(() => selectedFilter = "Paid"),
                  selectedColor: Colors.blue.shade100,
                  backgroundColor: Colors.grey.shade200,
                  checkmarkColor: Colors.blue,
                ),
                const SizedBox(width: 10),
                FilterChip(
                  label: const Text("Due", style: TextStyle(fontFamily: "TimesNewRoman")),
                  selected: selectedFilter == "Due",
                  onSelected: (_) => setState(() => selectedFilter = "Due"),
                  selectedColor: Colors.orange.shade100,
                  backgroundColor: Colors.grey.shade200,
                  checkmarkColor: Colors.deepOrange,
                ),
                const SizedBox(width: 10),
                FilterChip(
                  label: const Text("All", style: TextStyle(fontFamily: "TimesNewRoman")),
                  selected: selectedFilter == "All",
                  onSelected: (_) => setState(() => selectedFilter = "All"),
                  selectedColor: Colors.blue.shade200,
                  backgroundColor: Colors.grey.shade200,
                  checkmarkColor: Colors.blue,
                ),
              ],
            ),
          ),

          /// Fee List
          Expanded(
            child: ListView.builder(
              itemCount: filteredFees.length,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              itemBuilder: (context, index) {
                final fee = filteredFees[index];
                final isPaid = fee["status"] == "Paid";
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  elevation: 3,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: isPaid ? Colors.blue : Colors.orange,
                      child: const Icon(Icons.receipt_long, color: Colors.white),
                    ),
                    title: Text(
                      "Bill No. ${fee["billNo"]}",
                      style: const TextStyle(
                        fontFamily: "TimesNewRoman",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      "₹ ${fee["amount"]} • ${fee["status"]} on ${fee["date"]}",
                      style: TextStyle(
                        fontFamily: "TimesNewRoman",
                        color: isPaid ? Colors.blue : Colors.orange,
                      ),
                    ),
                    trailing: Text(
                      fee["status"],
                      style: TextStyle(
                        fontFamily: "TimesNewRoman",
                        fontWeight: FontWeight.bold,
                        color: isPaid ? Colors.blue : Colors.orange,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          /// Pay button (if dues exist)
          if (fees.any((fee) => fee["status"] == "Due"))
            Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Redirecting to payment...")),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF6B35), // Orange
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "PAY NOW",
                    style: TextStyle(
                      fontFamily: "TimesNewRoman",
                      fontSize: 18,
                      color: Colors.white,
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
