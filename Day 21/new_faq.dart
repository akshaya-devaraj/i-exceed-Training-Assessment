import 'package:flutter/material.dart';

// Color constants
const Color pureWhite = Color.fromARGB(255, 255, 255, 255);
const Color softBlueGray = Color.fromARGB(255, 241, 246, 248);
const Color mutedGrayPeach = Color.fromARGB(253, 205, 213, 214);
const Color navyBlueDark = Color.fromARGB(255, 20, 40, 80);
const Color navyBlue = Color.fromARGB(255, 30, 60, 100);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Elevator FAQ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: softBlueGray,
        appBarTheme: const AppBarTheme(
          backgroundColor: navyBlue,
          foregroundColor: pureWhite,
        ),
      ),
      home: const FAQElevatorHome(),
    );
  }
}

class FAQElevatorHome extends StatelessWidget {
  const FAQElevatorHome({super.key});

  final List<Map<String, String>> faqData = const [
    {
      'question': 'How do I log in to the banking app?',
      'answer': 'You can log in using your registered mobile number and OTP or your username/password. Biometric login is also supported.'
    },
    {
      'question': 'What should I do if I forget my password?',
      'answer': 'Click on “Forgot Password” on the login screen and follow the steps to reset it.'
    },
    {
      'question': ' Can I use the app on multiple devices?',
      'answer': 'Yes, but for security reasons, you may need to authenticate each device separately using OTP.'
    },
    {
      'question': 'How can I view my account balance and transaction history?',
      'answer': 'Go to the “Accounts” tab to view balance, transactions, and download statements.'
    },
    {
      'question': 'How do I transfer money to another account?',
      'answer': 'Go to “Transfers”, select the beneficiary, enter the amount, and confirm with OTP or biometrics.'
    },
    {
      'question': 'Can I schedule future or recurring payments?',
      'answer': 'Yes, use the “Schedule Transfer” option in the Transfers section.'
    },
    {
      'question': 'How can I update my contact details (phone/email)?',
      'answer': 'Go to Profile > Edit, change your details and verify with OTP.'
    },
    {
      'question': 'How do I change my login PIN or password?',
      'answer': 'Navigate to Settings > Security to change your PIN or password.'
    },
    {
      'question': 'What if my phone is lost or stolen?',
      'answer': 'Contact customer support or use “Deactivate App Access” via internet banking.'
    },
    {
      'question': 'How can I block or unblock my debit/credit card?',
      'answer': 'Go to Card Management, select your card, and use the Block/Unblock option.'
    },
    {
      'question': 'How do I contact customer support?',
      'answer': 'Tap on Help & Support in the menu to chat, email, or call support.'
    },
  ];

  void _showFAQs(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: pureWhite,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      context: context,
      isScrollControlled: true,
      builder: (BuildContext ctx) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.6,
          minChildSize: 0.4,
          maxChildSize: 0.95,
          builder: (_, controller) => Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListView.builder(
              controller: controller,
              itemCount: faqData.length,
              itemBuilder: (context, index) {
                return Card(
                  color: pureWhite,
                  shadowColor: mutedGrayPeach,
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ExpansionTile(
                    iconColor: navyBlueDark,
                    collapsedIconColor: navyBlueDark,
                    title: Text(
                      faqData[index]['question']!,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: navyBlueDark,
                      ),
                    ),
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: mutedGrayPeach,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        child: Text(
                          faqData[index]['answer']!,
                          style: const TextStyle(
                            fontSize: 15,
                            color: navyBlueDark,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Banking App"),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          "Welcome to the Banking App!",
          style: TextStyle(fontSize: 20, color: navyBlueDark),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showFAQs(context),
        label: const Text("FAQs"),
        icon: const Icon(Icons.help_outline),
        backgroundColor: navyBlueDark,
        foregroundColor: pureWhite,
      ),
    );
  }
}
