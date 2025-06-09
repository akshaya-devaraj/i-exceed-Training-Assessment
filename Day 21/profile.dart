import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Bank Profile",
      debugShowCheckedModeBanner: false,
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isEditing = false;
  TextEditingController phoneController = TextEditingController(text: "********06");
  TextEditingController emailController = TextEditingController(text: "aksh*******@gmail.com");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: const Color(0xA8003366),
        foregroundColor: Colors.white,
        title: const Text("Profile", style: TextStyle(fontFamily: "serif")),
        actions: [
          IconButton(
            icon: Icon(isEditing ? Icons.save : Icons.edit),
            tooltip: isEditing ? "Save" : "Edit",
            onPressed: () {
              setState(() {
                isEditing = !isEditing;
              });
              if (!isEditing) {
                // You can add API calls here to update the info on the server.
                print("Saved Phone: ${phoneController.text}");
                print("Saved Email: ${emailController.text}");
              }
            },
          ),
          const Padding(
            padding: EdgeInsets.only(right: 15.0),
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/images/ak.jpg"),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Photo and Name
            Center(
              child: Column(
                children: const [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage("assets/images/ak.jpg"),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "User",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      fontFamily: "serif",
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Account Details Section
            sectionTitle(Icons.account_balance, "Account Details"),
            detailCard([
              buildRow("Account No", "447689036788"),
              buildRow("IFSC Code", "SBIN0090876"),
              buildRow("Branch", "Madiwala Bangalore"),
            ]),

            // Contact Information Section
            sectionTitle(Icons.contact_phone, "Contact Information"),
            detailCard([
              buildRow("Phone", phoneController.text), // Always read-only
              isEditing
                  ? buildEditableRow("Email", emailController)
                  : buildRow("Email", emailController.text), // Only Email editable
            ]),

            // PAN Section
            sectionTitle(Icons.credit_card, "PAN linkage"),
            detailCard([
              buildRow("PAN Number", "EDG**987A"),
            ]),

            const SizedBox(height: 30),
            Center(
              child: ElevatedButton.icon(
                icon: const Icon(Icons.arrow_back),
                label: const Text("Back"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xA8003366),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget sectionTitle(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, bottom: 8),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xA8003366)),
          const SizedBox(width: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              fontFamily: "serif",
            ),
          ),
        ],
      ),
    );
  }

  Widget detailCard(List<Widget> children) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: children),
      ),
    );
  }

  Widget buildRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          Text(value,
              style: TextStyle(fontSize: 16, color: Colors.grey[700])),
        ],
      ),
    );
  }

  Widget buildEditableRow(String title, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              )),
          Expanded(
            flex: 3,
            child: TextFormField(
              controller: controller,
              style: const TextStyle(fontSize: 16),
              decoration: const InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.symmetric(vertical: 8),
                border: UnderlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
