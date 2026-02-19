// import 'package:flutter/material.dart';

// class ChangePasswordScreen extends StatefulWidget {
//   const ChangePasswordScreen({super.key});

//   @override
//   State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
// }

// class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
//   final TextEditingController _currentPasswordController = TextEditingController();
//   final TextEditingController _newPasswordController = TextEditingController();
//   final TextEditingController _confirmPasswordController = TextEditingController();

//   bool _obscureCurrent = true;
//   bool _obscureNew = true;
//   bool _obscureConfirm = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Change Password'),
//         backgroundColor: const Color(0xFF00A8E8),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(24),
//         child: Column(
//           children: [
//             const SizedBox(height: 40),
//             _buildPasswordField(
//               label: 'Current Password',
//               controller: _currentPasswordController,
//               obscureText: _obscureCurrent,
//               toggle: () {
//                 setState(() {
//                   _obscureCurrent = !_obscureCurrent;
//                 });
//               },
//             ),
//             const SizedBox(height: 20),
//             _buildPasswordField(
//               label: 'New Password',
//               controller: _newPasswordController,
//               obscureText: _obscureNew,
//               toggle: () {
//                 setState(() {
//                   _obscureNew = !_obscureNew;
//                 });
//               },
//             ),
//             const SizedBox(height: 20),
//             _buildPasswordField(
//               label: 'Confirm New Password',
//               controller: _confirmPasswordController,
//               obscureText: _obscureConfirm,
//               toggle: () {
//                 setState(() {
//                   _obscureConfirm = !_obscureConfirm;
//                 });
//               },
//             ),
//             const SizedBox(height: 40),
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: () {
//                   // TODO: Add change password logic
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color(0xFF00A8E8),
//                   padding: const EdgeInsets.symmetric(vertical: 16),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                 ),
//                 child: const Text('Update Password'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildPasswordField({
//     required String label,
//     required TextEditingController controller,
//     required bool obscureText,
//     required VoidCallback toggle,
//   }) {
//     return TextField(
//       controller: controller,
//       obscureText: obscureText,
//       decoration: InputDecoration(
//         labelText: label,
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
//         suffixIcon: IconButton(
//           icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility),
//           onPressed: toggle,
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _oldPass = TextEditingController();
  final TextEditingController _newPass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();

  bool _isObscureOld = true;
  bool _isObscureNew = true;
  bool _isObscureConfirm = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4FF),

      /// Gradient AppBar
      appBar: AppBar(
        elevation: 3,
        centerTitle: true,
        title: const Text(
          "Change Password",
          style: TextStyle(
            fontFamily: "TimesNewRoman",
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            color: Colors.white,
          ),
        ),
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

      /// Scrollable Form
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Update your password securely",
                style: TextStyle(
                  fontFamily: "TimesNewRoman",
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 25),

              _buildPasswordField(
                controller: _oldPass,
                label: "Old Password",
                obscure: _isObscureOld,
                toggle: () => setState(() => _isObscureOld = !_isObscureOld),
                icon: Icons.lock_outline,
                iconColor: Colors.blue,
              ),
              const SizedBox(height: 20),

              _buildPasswordField(
                controller: _newPass,
                label: "New Password",
                obscure: _isObscureNew,
                toggle: () => setState(() => _isObscureNew = !_isObscureNew),
                icon: Icons.lock_reset,
                iconColor: Colors.orange,
                validator: (value) {
                  if (value == null || value.length < 6) {
                    return "Password must be at least 6 characters";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              _buildPasswordField(
                controller: _confirmPass,
                label: "Confirm Password",
                obscure: _isObscureConfirm,
                toggle: () =>
                    setState(() => _isObscureConfirm = !_isObscureConfirm),
                icon: Icons.verified_user,
                iconColor: Colors.green,
                validator: (value) {
                  if (value != _newPass.text) {
                    return "Passwords do not match";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 60), // space before bottom button
            ],
          ),
        ),
      ),

      /// Gradient Button at Bottom
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF2196F3), Color(0xFFFF9800)], // Blue + Orange
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text(
                      "Password Updated Successfully 🎉",
                      style: TextStyle(fontFamily: "TimesNewRoman"),
                    ),
                    backgroundColor: Colors.blue.shade700,
                    behavior: SnackBarBehavior.floating,
                    margin: const EdgeInsets.all(12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            child: const Text(
              "Update Password",
              style: TextStyle(
                fontSize: 18,
                fontFamily: "TimesNewRoman",
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Reusable Password Field
  Widget _buildPasswordField({
    required TextEditingController controller,
    required String label,
    required bool obscure,
    required VoidCallback toggle,
    required IconData icon,
    required Color iconColor,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      style: const TextStyle(fontFamily: "TimesNewRoman"),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(fontFamily: "TimesNewRoman"),
        prefixIcon: Icon(icon, color: iconColor),
        suffixIcon: IconButton(
          icon: Icon(
            obscure ? Icons.visibility_off : Icons.visibility,
            color: Colors.purple,
          ),
          onPressed: toggle,
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: iconColor.withOpacity(0.4)),
        ),
      ),
      validator: validator,
    );
  }
}
