import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      'question':' Can I use the app on multiple devices?',
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("FAQ"),
          toolbarHeight: 80,
          foregroundColor: Colors.white,
          backgroundColor: Colors.deepPurple,
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: faqData.length,
                itemBuilder: (BuildContext context, int index) {
                  return ExpansionTile(
                    title: Text(
                      faqData[index]['question']!,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'serif'),
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                        child: Text(
                          faqData[index]['answer']!,
                          style: const TextStyle(
                              fontSize: 16, color: Colors.black87),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton.icon(
                icon: const Icon(Icons.arrow_back),
                label: const Text("Back"),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                    padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12)),
                onPressed: () {
                  // Use this if you want to pop back to a previous screen
                  // Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
