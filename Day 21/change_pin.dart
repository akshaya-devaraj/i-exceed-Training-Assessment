import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: UpdatePasswordScreen(),
  ));
}

// Theme colors
const Color pureWhite = Color.fromARGB(255, 255, 255, 255);
const Color softBlueGray = Color.fromARGB(255, 241, 246, 248);
const Color mutedGrayPeach = Color.fromARGB(253, 205, 213, 214);
const Color navyBlueDark = Color.fromARGB(255, 20, 40, 80);
const Color navyBlue = Color.fromARGB(255, 30, 60, 100);

class UpdatePasswordScreen extends StatefulWidget {
  const UpdatePasswordScreen({super.key});

  @override
  State<UpdatePasswordScreen> createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _showOld = false;
  bool _showNew = false;
  bool _showConfirm = false;

  void _submit() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          backgroundColor: pureWhite,
          contentPadding: const EdgeInsets.all(24),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.check_circle, color: Colors.green, size: 60),
              const SizedBox(height: 16),
              const Text(
                "Password Updated",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: navyBlueDark,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Your password has been updated successfully.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: navyBlueDark),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: navyBlue,
                  foregroundColor: pureWhite,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  _formKey.currentState!.reset();
                  _oldPasswordController.clear();
                  _newPasswordController.clear();
                  _confirmPasswordController.clear();
                },
                child: const Text("OK"),
              )
            ],
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: softBlueGray,
      appBar: AppBar(
        title: const Text("Update Password"),
        centerTitle: true,
        backgroundColor: navyBlue,
        foregroundColor: pureWhite,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              buildPasswordField("Old Password", _oldPasswordController, _showOld, (val) {
                setState(() => _showOld = !_showOld);
              }),
              const SizedBox(height: 16),
              buildPasswordField("New Password", _newPasswordController, _showNew, (val) {
                setState(() => _showNew = !_showNew);
              }),
              const SizedBox(height: 16),
              buildPasswordField("Confirm Password", _confirmPasswordController, _showConfirm, (val) {
                setState(() => _showConfirm = !_showConfirm);
              }),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: navyBlueDark,
                  foregroundColor: pureWhite,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                ),
                onPressed: _submit,
                child: const Text("Update Password", style: TextStyle(fontSize: 16)),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPasswordField(String label, TextEditingController controller, bool isVisible, Function toggle) {
    return TextFormField(
      controller: controller,
      obscureText: !isVisible,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        filled: true,
        fillColor:mutedGrayPeach,
        suffixIcon: IconButton(
          icon: Icon(isVisible ? Icons.visibility : Icons.visibility_off),
          onPressed: () => toggle(!isVisible),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) return "Please enter $label";
        if (label == "Confirm Password" && value != _newPasswordController.text) {
          return "Passwords do not match";
        }
        return null;
      },
    );
  }
}
