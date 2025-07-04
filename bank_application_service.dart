import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyBankingApp());
}

// Theme Colors
class AppColors {
  static const pureWhite = Color.fromARGB(255, 255, 255, 255);
  static const softBlueGray = Color.fromARGB(255, 241, 246, 248);
  static const mutedGrayPeach = Color.fromARGB(253, 205, 213, 214);
  static const navyBlueDark = Color.fromARGB(255, 20, 40, 80);
  static const navyBlue = Color.fromARGB(255, 30, 60, 100);
  static const lighterBlue = Color.fromARGB(253, 241, 240, 240);
}

// Helper function for card decoration
BoxDecoration getCardBoxDecoration() {
  return BoxDecoration(
    gradient: const LinearGradient(
      colors: [AppColors.softBlueGray, AppColors.mutedGrayPeach],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    borderRadius: BorderRadius.circular(20),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.05),
        blurRadius: 12,
        offset: const Offset(0, 6),
      ),
    ],
  );
}

// Service Item Model
class ServiceItem {
  final String section;
  final String label;
  final IconData icon;
  final String? route;
  final VoidCallback? onTap;

  const ServiceItem({
    required this.section,
    required this.label,
    required this.icon,
    this.route,
    this.onTap,
  });
}

// Main App
class MyBankingApp extends StatelessWidget {
  const MyBankingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Banking Application",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.pureWhite,
        fontFamily: "serif",
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.navyBlue,
          foregroundColor: Colors.white,
        ),
        cardColor: AppColors.lighterBlue,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.navyBlue,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
            textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        snackBarTheme: const SnackBarThemeData(
          backgroundColor: AppColors.navyBlue,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: AppColors.navyBlueDark),
        ),
        checkboxTheme: CheckboxThemeData(
          checkColor: MaterialStateProperty.all(AppColors.pureWhite),
          fillColor: MaterialStateProperty.all(AppColors.navyBlue),
        ),
        radioTheme: RadioThemeData(
          fillColor: MaterialStateProperty.all(AppColors.navyBlue),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const CustomerServicesPage(),
        '/block-card': (context) => const BlockDebitCardPage(),
        '/request-card': (context) => RequestNewCardPage(),
        '/set-limits': (context) => CardLimitationsPage(),
        '/faq': (context) => const FAQPage(),
        '/settings': (context) => const YonoSettingsPage(),
        '/change-pin': (context) => const ChangePinScreen(),
        '/update-password': (context) => const UpdatePasswordScreen(),
        '/sms-alerts': (context) => const SmsAlertActivationPage(),
        '/contact-us': (context) => const ContactUsPage(),
        '/raise-complaint': (context) => const RaiseComplaintPage(),
        '/language-settings': (context) => const LanguageSettingsPage(),
        '/privacy-security': (context) => const PrivacySecurityPage(),
        '/update-profile': (context) => const UpdatePersonalDetailsScreen(),
      },
    );
  }
}

// Enhanced Customer Services Page with updated sections
class CustomerServicesPage extends StatelessWidget {
  const CustomerServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ServiceItem> services = [
      // Profile and Settings
      const ServiceItem(section: "Profile and Settings", label: "Update Personal Details", icon: Icons.person, route: '/update-profile'),
      const ServiceItem(section: "Profile and Settings", label: "Settings", icon: Icons.settings, route: '/settings'),

      // Card Services
      const ServiceItem(section: "Card Services", label: "Block Debit Card", icon: Icons.block, route: '/block-card'),
      const ServiceItem(section: "Card Services", label: "Request New Card", icon: Icons.credit_card, route: '/request-card'),
      const ServiceItem(section: "Card Services", label: "Set Card Limits", icon: Icons.tune, route: '/set-limits'),

      // Support
      const ServiceItem(section: "Support", label: "Contact Us", icon: Icons.support_agent, route: '/contact-us'),
      const ServiceItem(section: "Support", label: "Raise a Complaint", icon: Icons.report_problem, route: '/raise-complaint'),
    ];

    final grouped = <String, List<ServiceItem>>{};
    for (var item in services) {
      grouped.putIfAbsent(item.section, () => []).add(item);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Customer Services"),
        centerTitle: true,
        backgroundColor: AppColors.navyBlue,
        foregroundColor: Colors.white,
      ),
      backgroundColor: AppColors.pureWhite,
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: grouped.entries.map((entry) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Plain sector title (no box)
              Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 16),
                child: Text(
                  entry.key,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.navyBlueDark,
                  ),
                ),
              ),

              // Cards with gradient background
              ...entry.value.map((item) => Container(
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppColors.softBlueGray, AppColors.mutedGrayPeach],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 6,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ListTile(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  leading: CircleAvatar(
                    backgroundColor: AppColors.navyBlue,
                    child: Icon(item.icon, color: Colors.white, size: 20),
                  ),
                  title: Text(
                    item.label,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColors.navyBlueDark,
                    ),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: AppColors.navyBlueDark),
                  onTap: () {
                    if (item.route != null) {
                      Navigator.pushNamed(context, item.route!);
                    } else if (item.onTap != null) {
                      item.onTap!();
                    }
                  },
                ),
              )),
              const SizedBox(height: 16),
            ],
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, '/faq');
        },
        backgroundColor: AppColors.navyBlue,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.help_outline),
        label: const Text("FAQ"),
        heroTag: "faq_button",
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

// Update Personal Details Screen (integrated from attachment)
class UpdatePersonalDetailsScreen extends StatefulWidget {
  const UpdatePersonalDetailsScreen({super.key});

  @override
  State<UpdatePersonalDetailsScreen> createState() => _UpdatePersonalDetailsScreenState();
}

class _UpdatePersonalDetailsScreenState extends State<UpdatePersonalDetailsScreen> {
  bool isEditing = false;
  TextEditingController phoneController = TextEditingController(text: "********06");
  TextEditingController emailController = TextEditingController(text: "aksh*******@gmail.com");
  TextEditingController nameController = TextEditingController(text: "Akshay Kumar");
  TextEditingController addressController = TextEditingController(text: "123, MG Road, Bangalore");

  @override
  void dispose() {
    phoneController.dispose();
    emailController.dispose();
    nameController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Personal Details"),
        backgroundColor: AppColors.navyBlue,
        foregroundColor: AppColors.pureWhite,
        actions: [
          IconButton(
            icon: Icon(isEditing ? Icons.save : Icons.edit),
            tooltip: isEditing ? "Save" : "Edit",
            onPressed: () {
              setState(() {
                isEditing = !isEditing;
              });
              if (!isEditing) {
                // Show success message when saving
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Personal details updated successfully!"),
                    backgroundColor: AppColors.navyBlue,
                  ),
                );
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Stack(
                    children: [
                      const CircleAvatar(
                        radius: 60,
                        backgroundColor: AppColors.softBlueGray,
                        child: Icon(
                          Icons.person,
                          size: 60,
                          color: AppColors.navyBlue,
                        ),
                      ),
                      if (isEditing)
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: AppColors.navyBlue,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.camera_alt, color: Colors.white, size: 20),
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text("Photo update feature coming soon!")),
                                );
                              },
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  isEditing
                      ? SizedBox(
                    width: 200,
                    child: TextFormField(
                      controller: nameController,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: AppColors.navyBlueDark,
                      ),
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        isDense: true,
                      ),
                    ),
                  )
                      : Text(
                    nameController.text,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: AppColors.navyBlueDark,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            sectionTitle(Icons.account_balance, "Account Details"),
            detailCard([
              buildRow("Account No", "447689036788"),
              buildRow("IFSC Code", "SBIN0090876"),
              buildRow("Branch", "Madiwala Bangalore"),
              buildRow("Account Type", "Savings Account"),
            ]),

            sectionTitle(Icons.contact_phone, "Contact Information"),
            detailCard([
              isEditing
                  ? buildEditableRow("Phone", phoneController)
                  : buildRow("Phone", phoneController.text),
              isEditing
                  ? buildEditableRow("Email", emailController)
                  : buildRow("Email", emailController.text),
              isEditing
                  ? buildEditableRow("Address", addressController, maxLines: 2)
                  : buildRow("Address", addressController.text),
            ]),

            sectionTitle(Icons.credit_card, "PAN Linkage"),
            detailCard([
              buildRow("PAN Number", "EDG**987A"),
              buildRow("Status", "Verified", valueColor: Colors.green),
            ]),

            sectionTitle(Icons.security, "Security Information"),
            detailCard([
              buildRow("Last Login", "Today, 10:30 AM"),
              buildRow("Login Method", "Biometric"),
              buildRow("Two-Factor Auth", "Enabled", valueColor: Colors.green),
            ]),

            const SizedBox(height: 30),

            if (isEditing)
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      icon: const Icon(Icons.cancel),
                      label: const Text("Cancel"),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.navyBlue,
                        side: const BorderSide(color: AppColors.navyBlue),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      onPressed: () {
                        setState(() {
                          isEditing = false;
                          // Reset controllers to original values
                          phoneController.text = "********06";
                          emailController.text = "aksh*******@gmail.com";
                          nameController.text = "Akshay Kumar";
                          addressController.text = "123, MG Road, Bangalore";
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.save),
                      label: const Text("Save Changes"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.navyBlue,
                        foregroundColor: AppColors.pureWhite,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      onPressed: () {
                        setState(() {
                          isEditing = false;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Personal details updated successfully!"),
                            backgroundColor: AppColors.navyBlue,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              )
            else
              Center(
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.arrow_back),
                  label: const Text("Back"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.navyBlue,
                    foregroundColor: AppColors.pureWhite,
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
          Icon(icon, color: AppColors.navyBlue),
          const SizedBox(width: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppColors.navyBlueDark,
            ),
          ),
        ],
      ),
    );
  }

  Widget detailCard(List<Widget> children) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: getCardBoxDecoration(),
      padding: const EdgeInsets.all(16),
      child: Column(children: children),
    );
  }

  Widget buildRow(String title, String value, {Color? valueColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: AppColors.navyBlueDark,
            ),
          ),
          Flexible(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 16,
                color: valueColor ?? Colors.grey[700],
                fontWeight: valueColor != null ? FontWeight.w600 : FontWeight.normal,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildEditableRow(String title, TextEditingController controller, {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: AppColors.navyBlueDark,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: TextFormField(
              controller: controller,
              maxLines: maxLines,
              style: const TextStyle(fontSize: 16),
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: AppColors.navyBlue),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: AppColors.navyBlue, width: 2),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// FAQ Page
class FAQPage extends StatelessWidget {
  const FAQPage({super.key});

  final List<Map<String, String>> faqData = const [
    {
      'question': 'How do I log in to the banking app?',
      'answer': 'Use registered mobile number and OTP or your username/password. Biometric login is also supported.'
    },
    {
      'question': 'What should I do if I forget my password?',
      'answer': 'Click "Forgot Password" on login screen and follow the reset steps.'
    },
    {
      'question': 'Can I use the app on multiple devices?',
      'answer': 'Yes. Authenticate each device with OTP for security.'
    },
    {
      'question': 'How can I view my account balance?',
      'answer': 'Go to "Accounts" tab for balance and transaction history.'
    },
    {
      'question': 'How do I transfer money?',
      'answer': 'Go to "Transfers", select beneficiary, enter amount and confirm with OTP.'
    },
    {
      'question': 'How do I block my card if it\'s lost or stolen?',
      'answer': 'Go to Card Services > Block Debit Card, select your card type, enter details and submit the request.'
    },
    {
      'question': 'Can I set spending limits on my card?',
      'answer': 'Yes, go to Card Services > Set Card Limits to customize your daily spending and withdrawal limits.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.navyBlue,
      appBar: AppBar(
        title: const Text("Frequently Asked Questions"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: faqData.length,
              itemBuilder: (context, index) {
                return Card(
                  color: AppColors.softBlueGray,
                  margin: const EdgeInsets.all(8),
                  child: ExpansionTile(
                    iconColor: Colors.black,
                    collapsedIconColor: Colors.black,
                    title: Text(
                      faqData[index]['question']!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'serif',
                      ),
                    ),
                    children: [
                      Container(
                        color: AppColors.mutedGrayPeach,
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        child: Text(
                          faqData[index]['answer']!,
                          style: const TextStyle(fontSize: 16, color: Colors.black87),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton.icon(
              icon: const Icon(Icons.arrow_back),
              label: const Text("Back"),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }
}

// Enhanced Block Debit Card Page
class BlockDebitCardPage extends StatefulWidget {
  const BlockDebitCardPage({super.key});

  @override
  State<BlockDebitCardPage> createState() => _BlockDebitCardPageState();
}

class _BlockDebitCardPageState extends State<BlockDebitCardPage> {
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController reasonController = TextEditingController();

  String selectedCardType = 'Debit';
  final List<String> cardTypes = ['Debit', 'Credit', 'Prepaid', 'Virtual'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Block Card")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Card Details",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColors.navyBlueDark)),
            const SizedBox(height: 15),
            Container(
              decoration: getCardBoxDecoration(),
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      CircleAvatar(
                        backgroundColor: AppColors.navyBlue,
                        radius: 24,
                        child: Icon(FontAwesomeIcons.solidCreditCard,
                            color: Colors.white, size: 20),
                      ),
                      SizedBox(width: 14),
                      Text(
                        "Secure Card Blocking",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.navyBlueDark,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  const Text("Card Type",
                      style: TextStyle(fontWeight: FontWeight.w600,
                          color: AppColors.navyBlueDark)),
                  const SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    value: selectedCardType,
                    dropdownColor: Colors.white,
                    items: cardTypes.map((String type) {
                      return DropdownMenuItem<String>(
                        value: type,
                        child: Text(type),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedCardType = value!;
                      });
                    },
                    decoration: InputDecoration(
                      prefixIcon: const Icon(FontAwesomeIcons.idCard),
                      labelText: "Select card type",
                      labelStyle: const TextStyle(color: AppColors.navyBlue),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: AppColors.navyBlue),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text("Card Number",
                      style: TextStyle(fontWeight: FontWeight.w600,
                          color: AppColors.navyBlueDark)),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: cardNumberController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(FontAwesomeIcons.creditCard),
                      labelText: "Enter card number",
                      labelStyle: const TextStyle(color: AppColors.navyBlue),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: AppColors.navyBlue),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text("Reason for Blocking",
                      style: TextStyle(fontWeight: FontWeight.w600,
                          color: AppColors.navyBlueDark)),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: reasonController,
                    maxLines: 4,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(FontAwesomeIcons.exclamationTriangle,
                          color: Colors.orange),
                      labelText: "Briefly explain your reason",
                      labelStyle: const TextStyle(color: AppColors.navyBlue),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: AppColors.navyBlue),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  if (cardNumberController.text.isEmpty || reasonController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Please fill in all fields.")),
                    );
                    return;
                  }

                  final now = DateTime.now();
                  final formattedDate = DateFormat('yyyy-MM-dd – HH:mm:ss').format(now);
                  final last4 = cardNumberController.text.length >= 4
                      ? cardNumberController.text.substring(cardNumberController.text.length - 4)
                      : "****";
                  final reason = reasonController.text;
                  final reference = "REF${now.millisecondsSinceEpoch.toString().substring(7)}";

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Your card has been blocked successfully.")),
                  );

                  Future.delayed(const Duration(seconds: 1), () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CardBlockedConfirmationPage(
                          last4Digits: last4,
                          reason: reason,
                          dateTime: formattedDate,
                          referenceNumber: reference,
                          cardType: selectedCardType,
                        ),
                      ),
                    );
                  });
                },
                icon: const Icon(Icons.block),
                label: const Text("Block Card"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Request New Card Page
class RequestNewCardPage extends StatefulWidget {
  @override
  _RequestNewCardPageState createState() => _RequestNewCardPageState();
}

class _RequestNewCardPageState extends State<RequestNewCardPage> {
  String _selectedCardType = 'Debit Card';
  bool _internationalUsage = false;
  bool _setLimit = false;
  double _limitAmount = 25000;
  String _deliveryOption = 'Home Delivery';

  final cardTypes = ['Debit Card', 'Credit Card', 'Prepaid Card'];
  final deliveryOptions = ['Home Delivery', 'Branch Pickup'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pureWhite,
      appBar: AppBar(
        title: const Text("Request New Card"),
        backgroundColor: AppColors.navyBlue,
        foregroundColor: AppColors.pureWhite,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          buildGradientCard("Card Type", DropdownButton<String>(
            value: _selectedCardType,
            isExpanded: true,
            items: cardTypes.map((e) => DropdownMenuItem(value: e, child: Text(e, style: const TextStyle(color: AppColors.navyBlueDark)))).toList(),
            onChanged: (val) => setState(() => _selectedCardType = val!),
          )),
          buildGradientCard("Delivery Option", Column(
            children: deliveryOptions.map((e) => RadioListTile(
              title: Text(e, style: const TextStyle(color: AppColors.navyBlueDark)),
              value: e,
              groupValue: _deliveryOption,
              onChanged: (val) => setState(() => _deliveryOption = val!),
            )).toList(),
          )),
          buildGradientCard(null, SwitchListTile(
            title: const Text("Enable International Usage", style: TextStyle(color: AppColors.navyBlueDark)),
            value: _internationalUsage,
            onChanged: (val) => setState(() => _internationalUsage = val),
          )),
          buildGradientCard(null, SwitchListTile(
            title: const Text("Set Card Limit", style: TextStyle(color: AppColors.navyBlueDark)),
            value: _setLimit,
            onChanged: (val) => setState(() => _setLimit = val),
          )),
          if (_setLimit)
            buildGradientCard("Limit: ₹${_limitAmount.toInt()}", Slider(
              value: _limitAmount,
              min: 1000,
              max: 100000,
              divisions: 20,
              label: _limitAmount.toInt().toString(),
              onChanged: (val) => setState(() => _limitAmount = val),
            )),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.navyBlue,
              foregroundColor: AppColors.pureWhite,
            ),
            icon: const Icon(Icons.send),
            label: const Text("Submit Request"),
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text("Request Submitted", style: TextStyle(color: AppColors.navyBlueDark)),
                  content: const Text("Your new card request has been submitted successfully.",
                      style: TextStyle(color: AppColors.navyBlueDark)),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("OK", style: TextStyle(color: AppColors.navyBlue)),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget buildGradientCard(String? title, Widget child) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.softBlueGray, AppColors.mutedGrayPeach],
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Card(
        color: Colors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (title != null)
                Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.navyBlueDark)),
              if (title != null) const SizedBox(height: 8),
              child,
            ],
          ),
        ),
      ),
    );
  }
}

// Card Limitations Page
class CardLimitationsPage extends StatefulWidget {
  @override
  _CardLimitationsPageState createState() => _CardLimitationsPageState();
}

class _CardLimitationsPageState extends State<CardLimitationsPage> {
  bool atmUsage = true;
  bool onlineUsage = true;
  double dailyLimit = 20000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pureWhite,
      appBar: AppBar(
        title: const Text("Set Card Limitations"),
        backgroundColor: AppColors.navyBlue,
        foregroundColor: AppColors.pureWhite,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            buildGradientCard(
              Column(
                children: [
                  SwitchListTile(
                    title: const Text("ATM Usage", style: TextStyle(color: AppColors.navyBlueDark)),
                    subtitle: const Text("Enable/disable ATM withdrawals", style: TextStyle(color: AppColors.navyBlueDark)),
                    value: atmUsage,
                    onChanged: (val) => setState(() => atmUsage = val),
                  ),
                  SwitchListTile(
                    title: const Text("Online Payments", style: TextStyle(color: AppColors.navyBlueDark)),
                    subtitle: const Text("Enable/disable online transactions", style: TextStyle(color: AppColors.navyBlueDark)),
                    value: onlineUsage,
                    onChanged: (val) => setState(() => onlineUsage = val),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            buildGradientCard(
              Column(
                children: [
                  Text("Daily Limit: ₹${dailyLimit.toInt()}",
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.navyBlueDark)),
                  const SizedBox(height: 10),
                  Slider(
                    value: dailyLimit,
                    min: 1000,
                    max: 100000,
                    divisions: 20,
                    label: dailyLimit.toInt().toString(),
                    onChanged: (val) => setState(() => dailyLimit = val),
                  ),
                  const Text("₹1,000 - ₹1,00,000", style: TextStyle(color: AppColors.navyBlueDark)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.navyBlue,
                foregroundColor: AppColors.pureWhite,
              ),
              icon: const Icon(Icons.save),
              label: const Text("Save Changes"),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Card limits updated successfully.")),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Widget buildGradientCard(Widget child) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.softBlueGray, AppColors.mutedGrayPeach],
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Card(
        color: Colors.transparent,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: child,
        ),
      ),
    );
  }
}

// Enhanced Settings Page with navigation to new pages
class YonoSettingsPage extends StatelessWidget {
  const YonoSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<_SettingItem> items = [
      _SettingItem(
        icon: Icons.lock,
        title: "Change PIN",
        subtitle: "Update your security PIN",
        route: '/change-pin',
      ),
      _SettingItem(
        icon: Icons.password,
        title: "Update Password",
        subtitle: "Change your login password",
        route: '/update-password',
      ),
      _SettingItem(
        icon: Icons.notifications,
        title: "Notification Preferences",
        subtitle: "Manage your SMS alerts and notifications",
        route: '/sms-alerts',
      ),
      _SettingItem(
        icon: Icons.language,
        title: "Language",
        subtitle: "Choose your preferred language",
        route: '/language-settings',
      ),
      _SettingItem(
        icon: Icons.privacy_tip,
        title: "Privacy & Security",
        subtitle: "Manage your privacy settings",
        route: '/privacy-security',
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.pureWhite,
      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: AppColors.navyBlue,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.softBlueGray, AppColors.mutedGrayPeach],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 6,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ListTile(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              leading: Icon(item.icon, color: AppColors.navyBlueDark),
              title: Text(
                item.title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppColors.navyBlueDark,
                ),
              ),
              subtitle: Text(
                item.subtitle,
                style: const TextStyle(
                  color: AppColors.navyBlueDark,
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: AppColors.navyBlueDark),
              onTap: () {
                Navigator.pushNamed(context, item.route);
              },
            ),
          );
        },
      ),
    );
  }
}

class _SettingItem {
  final IconData icon;
  final String title;
  final String subtitle;
  final String route;

  _SettingItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.route,
  });
}

// Language Settings Page
class LanguageSettingsPage extends StatefulWidget {
  const LanguageSettingsPage({super.key});

  @override
  State<LanguageSettingsPage> createState() => _LanguageSettingsPageState();
}

class _LanguageSettingsPageState extends State<LanguageSettingsPage> {
  String selectedLanguage = 'English';

  final List<Map<String, String>> languages = [
    {'code': 'en', 'name': 'English', 'nativeName': 'English'},
    {'code': 'hi', 'name': 'Hindi', 'nativeName': 'हिंदी'},
    {'code': 'bn', 'name': 'Bengali', 'nativeName': 'বাংলা'},
    {'code': 'te', 'name': 'Telugu', 'nativeName': 'తెలుగు'},
    {'code': 'mr', 'name': 'Marathi', 'nativeName': 'मराठी'},
    {'code': 'ta', 'name': 'Tamil', 'nativeName': 'தமிழ்'},
    {'code': 'gu', 'name': 'Gujarati', 'nativeName': 'ગુજરાતી'},
    {'code': 'kn', 'name': 'Kannada', 'nativeName': 'ಕನ್ನಡ'},
    {'code': 'ml', 'name': 'Malayalam', 'nativeName': 'മലയാളം'},
    {'code': 'pa', 'name': 'Punjabi', 'nativeName': 'ਪੰਜਾਬੀ'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Language Settings"),
        backgroundColor: AppColors.navyBlue,
        foregroundColor: AppColors.pureWhite,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.softBlueGray,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: const [
                  Icon(Icons.info_outline, color: AppColors.navyBlue),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      "Select your preferred language for the banking app interface.",
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.navyBlueDark,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Available Languages",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.navyBlueDark,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: languages.length,
                itemBuilder: (context, index) {
                  final language = languages[index];
                  final isSelected = selectedLanguage == language['name'];

                  return Card(
                    margin: const EdgeInsets.only(bottom: 8),
                    elevation: isSelected ? 4 : 1,
                    color: isSelected ? AppColors.navyBlue.withOpacity(0.1) : Colors.white,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: isSelected ? AppColors.navyBlue : Colors.grey.shade300,
                        child: Text(
                          language['code']!.toUpperCase(),
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black54,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      title: Text(
                        language['name']!,
                        style: TextStyle(
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          color: isSelected ? AppColors.navyBlue : Colors.black87,
                        ),
                      ),
                      subtitle: Text(
                        language['nativeName']!,
                        style: TextStyle(
                          color: isSelected ? AppColors.navyBlue : Colors.black54,
                        ),
                      ),
                      trailing: isSelected
                          ? const Icon(Icons.check_circle, color: AppColors.navyBlue)
                          : const Icon(Icons.radio_button_unchecked, color: Colors.grey),
                      onTap: () {
                        setState(() {
                          selectedLanguage = language['name']!;
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      title: const Text("Language Updated"),
                      content: Text("Language has been changed to $selectedLanguage. The app will restart to apply changes."),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                          },
                          child: const Text("OK"),
                        ),
                      ],
                    ),
                  );
                },
                icon: const Icon(Icons.save),
                label: const Text("Save Language"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.navyBlue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Privacy & Security Settings Page
class PrivacySecurityPage extends StatefulWidget {
  const PrivacySecurityPage({super.key});

  @override
  State<PrivacySecurityPage> createState() => _PrivacySecurityPageState();
}

class _PrivacySecurityPageState extends State<PrivacySecurityPage> {
  bool biometricLogin = true;
  bool autoLogout = true;
  bool transactionAlerts = true;
  bool dataSharing = false;
  bool marketingEmails = false;
  bool locationTracking = false;
  int autoLogoutTime = 5;

  final List<int> logoutTimes = [1, 2, 5, 10, 15, 30];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pureWhite,
      appBar: AppBar(
        title: const Text("Privacy & Security"),
        backgroundColor: AppColors.navyBlue,
        foregroundColor: AppColors.pureWhite,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSectionHeader("Security Settings", Icons.security),
          _buildCard([
            _buildSwitchTile(
              "Biometric Login",
              "Use fingerprint or face ID to login",
              biometricLogin,
              Icons.fingerprint,
                  (val) => setState(() => biometricLogin = val),
            ),
            _buildDivider(),
            _buildSwitchTile(
              "Auto Logout",
              "Automatically logout after $autoLogoutTime minutes of inactivity",
              autoLogout,
              Icons.timer,
                  (val) => setState(() => autoLogout = val),
            ),
            if (autoLogout) ...[
              _buildDivider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    const SizedBox(width: 56),
                    const Text("Logout after: ", style: TextStyle(color: AppColors.navyBlueDark)),
                    DropdownButton<int>(
                      value: autoLogoutTime,
                      dropdownColor: AppColors.pureWhite,
                      items: logoutTimes.map((time) {
                        return DropdownMenuItem(
                          value: time,
                          child: Text("$time min${time > 1 ? 's' : ''}"),
                        );
                      }).toList(),
                      onChanged: (val) => setState(() => autoLogoutTime = val!),
                    ),
                  ],
                ),
              ),
            ],
            _buildDivider(),
            _buildSwitchTile(
              "Transaction Alerts",
              "Get instant alerts for all transactions",
              transactionAlerts,
              Icons.notifications_active,
                  (val) => setState(() => transactionAlerts = val),
            ),
          ]),
          const SizedBox(height: 24),

          _buildSectionHeader("Privacy Settings", Icons.privacy_tip),
          _buildCard([
            _buildSwitchTile(
              "Data Sharing",
              "Share anonymized data for service improvement",
              dataSharing,
              Icons.share,
                  (val) => setState(() => dataSharing = val),
            ),
            _buildDivider(),
            _buildSwitchTile(
              "Marketing Communications",
              "Receive promotional emails and offers",
              marketingEmails,
              Icons.email,
                  (val) => setState(() => marketingEmails = val),
            ),
            _buildDivider(),
            _buildSwitchTile(
              "Location Tracking",
              "Allow location access for nearby ATM/branch finder",
              locationTracking,
              Icons.location_on,
                  (val) => setState(() => locationTracking = val),
            ),
          ]),
          const SizedBox(height: 24),

          _buildSectionHeader("Data Management", Icons.storage),
          _buildCard([
            _buildListTile("Download My Data", "Get a copy of your personal data", Icons.download, _showDataDownloadDialog),
            _buildDivider(),
            _buildListTile("Delete Account", "Permanently delete your account and data", Icons.delete_forever, _showDeleteAccountDialog, iconColor: Colors.red),
          ]),
          const SizedBox(height: 24),

          _buildSectionHeader("Legal", Icons.gavel),
          _buildCard([
            _buildListTile("Privacy Policy", "", Icons.description, _showPrivacyPolicy),
            _buildDivider(),
            _buildListTile("Terms of Service", "", Icons.description, _showTermsOfService),
          ]),
          const SizedBox(height: 24),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Privacy and security settings updated successfully."),
                    backgroundColor: AppColors.navyBlue,
                  ),
                );
              },
              icon: const Icon(Icons.save),
              label: const Text("Save Settings"),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.navyBlue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, color: AppColors.navyBlue, size: 24),
          const SizedBox(width: 12),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.navyBlueDark,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(List<Widget> children) {
    return Card(
      color: AppColors.mutedGrayPeach,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(children: children),
    );
  }

  Widget _buildSwitchTile(String title, String subtitle, bool value, IconData icon, Function(bool) onChanged) {
    return SwitchListTile(
      title: Text(title, style: const TextStyle(color: AppColors.navyBlueDark)),
      subtitle: Text(subtitle, style: const TextStyle(color: AppColors.navyBlueDark)),
      value: value,
      onChanged: onChanged,
      secondary: Icon(icon, color: AppColors.navyBlue),
    );
  }

  Widget _buildListTile(String title, String subtitle, IconData icon, Function() onTap, {Color iconColor = AppColors.navyBlue}) {
    return ListTile(
      leading: Icon(icon, color: iconColor),
      title: Text(title, style: const TextStyle(color: AppColors.navyBlueDark)),
      subtitle: subtitle.isNotEmpty ? Text(subtitle, style: const TextStyle(color: AppColors.navyBlueDark)) : null,
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: AppColors.navyBlueDark),
      onTap: onTap,
    );
  }

  Widget _buildDivider() => const Divider(height: 1, color: Colors.grey);

  void _showDataDownloadDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        backgroundColor: AppColors.pureWhite,
        title: const Text(
          "Download Personal Data",
          style: TextStyle(color: AppColors.navyBlueDark),
        ),
        content: const Text(
          "We'll prepare a file containing all your personal data and send it to your registered email address within 24-48 hours.",
          style: TextStyle(color: AppColors.navyBlueDark),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel", style: TextStyle(color: AppColors.navyBlue)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.navyBlue,
              foregroundColor: AppColors.pureWhite,
            ),
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Data download request submitted. You'll receive an email shortly."),
                  backgroundColor: AppColors.navyBlue,
                ),
              );
            },
            child: const Text("Request Download"),
          ),
        ],
      ),
    );
  }

  void _showDeleteAccountDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        backgroundColor: AppColors.pureWhite,
        title: const Text(
          "Delete Account",
          style: TextStyle(color: AppColors.navyBlueDark),
        ),
        content: const Text(
          "⚠️ This action cannot be undone. All your data will be permanently deleted. "
              "Please contact customer support to proceed with account deletion.",
          style: TextStyle(color: AppColors.navyBlueDark),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel", style: TextStyle(color: AppColors.navyBlue)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: AppColors.pureWhite,
            ),
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/contact-us');
            },
            child: const Text("Contact Support"),
          ),
        ],
      ),
    );
  }

  void _showPrivacyPolicy() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        backgroundColor: AppColors.pureWhite,
        title: const Text(
          "Privacy Policy",
          style: TextStyle(color: AppColors.navyBlueDark),
        ),
        content: const SingleChildScrollView(
          child: Text(
            "Privacy Policy Summary:\n\n"
                "• We collect personal information to provide banking services\n"
                "• Your data is encrypted and stored securely\n"
                "• We don't share personal data with third parties without consent\n"
                "• You can request data deletion or modification\n"
                "• We use cookies to improve user experience\n\n"
                "For the complete privacy policy, visit our website or contact customer support.",
            style: TextStyle(color: AppColors.navyBlueDark),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Close", style: TextStyle(color: AppColors.navyBlue)),
          ),
        ],
      ),
    );
  }

  void _showTermsOfService() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        backgroundColor: AppColors.pureWhite,
        title: const Text(
          "Terms of Service",
          style: TextStyle(color: AppColors.navyBlueDark),
        ),
        content: const SingleChildScrollView(
          child: Text(
            "Terms of Service Summary:\n\n"
                "• You must be 18+ to use our services\n"
                "• Account security is your responsibility\n"
                "• We reserve the right to suspend accounts for suspicious activity\n"
                "• Service fees may apply for certain transactions\n"
                "• These terms are subject to change with notice\n\n"
                "For complete terms and conditions, visit our website or contact customer support.",
            style: TextStyle(color: AppColors.navyBlueDark),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Close", style: TextStyle(color: AppColors.navyBlue)),
          ),
        ],
      ),
    );
  }

}

// SMS Alert Activation Page
class SmsAlertActivationPage extends StatefulWidget {
  const SmsAlertActivationPage({super.key});

  @override
  _SmsAlertActivationPageState createState() => _SmsAlertActivationPageState();
}

class _SmsAlertActivationPageState extends State<SmsAlertActivationPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _accountController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();

  bool activateAlerts = false;
  bool awareOfCharges = false;
  bool cheque = false;
  bool card = false;
  bool holdOnAccountBalance = false;

  @override
  void dispose() {
    _accountController.dispose();
    _mobileController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SMS ALERT ACTIVATION'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 6),
              TextFormField(
                controller: _accountController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: AppColors.pureWhite,
                  hintText: "Enter Account Number",
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your account number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _mobileController,
                keyboardType: TextInputType.phone,
                maxLength: 10,
                decoration: const InputDecoration(
                  labelText: "Mobile Number",
                  hintText: "Please type the mobile number",
                  border: OutlineInputBorder(),
                  counterText: "",
                ),
                validator: (value) {
                  if (value == null || value.trim().length != 10) {
                    return 'Enter a valid 10-digit mobile number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              const Text("All SMS Alerts",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.navyBlueDark)),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<bool>(
                      title: const Text("Activate"),
                      value: true,
                      groupValue: activateAlerts,
                      onChanged: (val) {
                        setState(() {
                          activateAlerts = true;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<bool>(
                      title: const Text("Deactivate"),
                      value: false,
                      groupValue: activateAlerts,
                      onChanged: (val) {
                        setState(() {
                          activateAlerts = false;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const Divider(),
              CheckboxListTile(
                title: const Text("Cheque"),
                value: cheque,
                onChanged: (val) {
                  setState(() {
                    cheque = val!;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text("Credit/Debit Account"),
                value: card,
                onChanged: (val) {
                  setState(() {
                    card = val!;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text("Hold on Account Balance"),
                value: holdOnAccountBalance,
                onChanged: (val) {
                  setState(() {
                    holdOnAccountBalance = val!;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text("I am aware of Charges"),
                value: awareOfCharges,
                onChanged: (val) {
                  setState(() {
                    awareOfCharges = val!;
                  });
                },
              ),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.navyBlue,
                        side: const BorderSide(color: AppColors.navyBlue),
                      ),
                      child: const Text("Back"),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate() &&
                            awareOfCharges) {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                backgroundColor: AppColors.pureWhite,
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(Icons.check_circle,
                                          color: Colors.green, size: 60),
                                      const SizedBox(height: 15),
                                      const Text(
                                        "SMS Alert Activated",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.navyBlueDark),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        "SMS alert has been activated for account ${_accountController.text} and mobile ${_mobileController.text}.",
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            color: Colors.black87),
                                      ),
                                      const SizedBox(height: 20),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: AppColors.navyBlue,
                                          foregroundColor: AppColors.pureWhite,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text("OK"),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          );

                          _accountController.clear();
                          _mobileController.clear();
                        } else if (!awareOfCharges) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Please acknowledge that you are aware of charges."),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.navyBlue,
                        foregroundColor: AppColors.pureWhite,
                      ),
                      child: const Text("Submit"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Change PIN Screen
class ChangePinScreen extends StatefulWidget {
  const ChangePinScreen({super.key});

  @override
  State<ChangePinScreen> createState() => _ChangePinScreenState();
}

class _ChangePinScreenState extends State<ChangePinScreen> {
  final _formKey = GlobalKey<FormState>();
  final _oldPinController = TextEditingController();
  final _newPinController = TextEditingController();
  final _confirmPinController = TextEditingController();

  bool _showOld = false;
  bool _showNew = false;
  bool _showConfirm = false;

  void _submit() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          backgroundColor: AppColors.pureWhite,
          contentPadding: const EdgeInsets.all(24),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.check_circle, color: Colors.green, size: 60),
              const SizedBox(height: 16),
              const Text(
                "PIN Updated",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.navyBlueDark,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Your PIN has been updated successfully.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: AppColors.navyBlueDark),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.navyBlue,
                  foregroundColor: AppColors.pureWhite,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop(); // Go back to settings
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
      backgroundColor: AppColors.softBlueGray,
      appBar: AppBar(
        title: const Text("Change PIN"),
        centerTitle: true,
        backgroundColor: AppColors.navyBlue,
        foregroundColor: AppColors.pureWhite,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              buildPinField("Current PIN", _oldPinController, _showOld, (val) {
                setState(() => _showOld = !_showOld);
              }),
              const SizedBox(height: 16),
              buildPinField("New PIN", _newPinController, _showNew, (val) {
                setState(() => _showNew = !_showNew);
              }),
              const SizedBox(height: 16),
              buildPinField("Confirm PIN", _confirmPinController, _showConfirm, (val) {
                setState(() => _showConfirm = !_showConfirm);
              }),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.navyBlueDark,
                  foregroundColor: AppColors.pureWhite,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                ),
                onPressed: _submit,
                child: const Text("Update PIN", style: TextStyle(fontSize: 16)),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPinField(String label, TextEditingController controller, bool isVisible, Function toggle) {
    return TextFormField(
      controller: controller,
      obscureText: !isVisible,
      keyboardType: TextInputType.number,
      maxLength: 6,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        filled: true,
        fillColor: AppColors.mutedGrayPeach,
        counterText: "", // Hide character counter
        suffixIcon: IconButton(
          icon: Icon(isVisible ? Icons.visibility : Icons.visibility_off),
          onPressed: () => toggle(!isVisible),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) return "Please enter $label";
        if (value.length != 4 && value.length != 6) {
          return "PIN must be 4 or 6 digits";
        }
        if (label == "Confirm PIN" && value != _newPinController.text) {
          return "PINs do not match";
        }
        return null;
      },
    );
  }

  @override
  void dispose() {
    _oldPinController.dispose();
    _newPinController.dispose();
    _confirmPinController.dispose();
    super.dispose();
  }
}

// Update Password Screen
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
          backgroundColor: AppColors.pureWhite,
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
                  color: AppColors.navyBlueDark,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Your password has been updated successfully.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: AppColors.navyBlueDark),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.navyBlue,
                  foregroundColor: AppColors.pureWhite,
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
      backgroundColor: AppColors.softBlueGray,
      appBar: AppBar(
        title: const Text("Update Password"),
        centerTitle: true,
        backgroundColor: AppColors.navyBlue,
        foregroundColor: AppColors.pureWhite,
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
                  backgroundColor: AppColors.navyBlueDark,
                  foregroundColor: AppColors.pureWhite,
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
        fillColor: AppColors.mutedGrayPeach,
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
        if (label == "New Password" && value.length < 6) {
          return "Password must be at least 6 characters";
        }
        return null;
      },
    );
  }

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}

// Contact Us Page
class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  Widget _buildSectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.navyBlueDark,
        ),
      ),
    );
  }

  // Updated to remove the onTap navigation
  Widget _buildContactCard(
      IconData icon, String label, String value, BuildContext context) {
    return Card(
      color: AppColors.softBlueGray,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: AppColors.navyBlue),
        title: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(value),
        // Removed onTap property
      ),
    );
  }

  // Updated to remove spacing between icons
  Widget _buildSocialIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center, // Changed to center
      children: [
        _buildSocialButton(Icons.facebook, "https://facebook.com"),
        _buildSocialButton(Icons.alternate_email, "https://twitter.com"),
        _buildSocialButton(Icons.link, "https://linkedin.com"),
      ],
    );
  }

  Widget _buildSocialButton(IconData icon, String url) {
    return Material(
      shape: const CircleBorder(),
      color: Colors.grey.shade200,
      child: InkWell(
        onTap: () => _launchURL(url),
        customBorder: const CircleBorder(),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Icon(icon, color: AppColors.navyBlue),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController messageController = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.pureWhite,
      appBar: AppBar(
        title: const Text("Contact Us"),
        backgroundColor: AppColors.navyBlue,
        foregroundColor: AppColors.pureWhite,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            const Text(
              "📞 Let's get in touch",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: AppColors.navyBlueDark,
              ),
            ),
            const SizedBox(height: 8),
            const Text("We're here to help you anytime."),

            _buildSectionTitle("Reach Our Support Team"),

            // Updated to remove URL parameters
            _buildContactCard(
              Icons.phone,
              "Phone",
              "+91-9876543210",
              context,
            ),
            _buildContactCard(
              Icons.email,
              "Email",
              "support@yourbank.com",
              context,
            ),
            _buildContactCard(
              Icons.location_on,
              "Address",
              "123, Financial Road, Mumbai, India",
              context,
            ),

            _buildSectionTitle("Customer Care Hours"),
            const Text("Mon–Sat: 9:00 AM – 6:00 PM"),
            const Text("Sunday: Closed"),
            const SizedBox(height: 8),
            Row(
              children: const [
                Icon(Icons.circle, color: Colors.green, size: 12),
                SizedBox(width: 6),
                Text("Support is online"),
              ],
            ),

            _buildSectionTitle("Send us a Message"),
            TextField(
              controller: messageController,
              maxLines: 4,
              decoration: InputDecoration(
                labelText: "Your Message",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (messageController.text.trim().isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Row(
                          children: const [
                            Icon(Icons.error_outline, color: Colors.white),
                            SizedBox(width: 10),
                            Text("Please fill in the message before sending."),
                          ],
                        ),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Row(
                          children: const [
                            Icon(Icons.check_circle_outline, color: Colors.white),
                            SizedBox(width: 10),
                            Text("Message sent successfully."),
                          ],
                        ),
                      ),
                    );
                    messageController.clear();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.navyBlue,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Send Message",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),

            _buildSectionTitle("Follow us on"),
            _buildSocialIcons(),
          ],
        ),
      ),
    );
  }
}
// Raise Complaint Page
class RaiseComplaintPage extends StatefulWidget {
  const RaiseComplaintPage({super.key});

  @override
  State<RaiseComplaintPage> createState() => _RaiseComplaintPageState();
}

class _RaiseComplaintPageState extends State<RaiseComplaintPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController complaintController = TextEditingController();
  String? selectedCategory;
  DateTime? selectedDate;

  final List<String> categories = [
    'Transaction Issue',
    'Card Block Request',
    'Login Problem',
    'Other',
  ];

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    complaintController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pureWhite,
      appBar: AppBar(
        title: const Text("Raise a Complaint"),
        backgroundColor: AppColors.navyBlue,
        foregroundColor: AppColors.pureWhite,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Text(
              "📝 We're here to help",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.navyBlueDark,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Please fill in the details below and our support team will get back to you.",
              style: TextStyle(fontSize: 14, color: AppColors.navyBlueDark),
            ),
            const SizedBox(height: 20),

            // Stylish Card Form
            Card(
              color: AppColors.pureWhite,
              elevation: 8,
              shadowColor: AppColors.softBlueGray,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    // Name Field
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: "Your Name",
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelStyle: const TextStyle(color: AppColors.navyBlueDark),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Email Field
                    TextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "Email Address",
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelStyle: const TextStyle(color: AppColors.navyBlueDark),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Category Dropdown
                    DropdownButtonFormField<String>(
                      value: selectedCategory,
                      dropdownColor: Colors.white,
                      items: categories.map((category) {
                        return DropdownMenuItem(
                          value: category,
                          child: Text(category),
                        );
                      }).toList(),
                      decoration: InputDecoration(
                        labelText: "Complaint Category",
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelStyle: const TextStyle(color: AppColors.navyBlueDark),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          selectedCategory = value;
                        });
                      },
                    ),
                    const SizedBox(height: 16),

                    // Complaint Details
                    TextField(
                      controller: complaintController,
                      maxLines: 5,
                      decoration: InputDecoration(
                        labelText: "Complaint Details",
                        alignLabelWithHint: true,
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelStyle: const TextStyle(color: AppColors.navyBlueDark),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Date Picker
                    ElevatedButton.icon(
                      onPressed: () async {
                        final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2020),
                          lastDate: DateTime.now(),
                          builder: (context, child) {
                            return Theme(
                              data: Theme.of(context).copyWith(
                                dialogBackgroundColor: Colors.white,
                                colorScheme: const ColorScheme.light(
                                  primary: AppColors.navyBlue,
                                  onPrimary: AppColors.pureWhite,
                                  onSurface: AppColors.navyBlueDark,
                                ),
                                textButtonTheme: TextButtonThemeData(
                                  style: TextButton.styleFrom(
                                    foregroundColor: AppColors.navyBlue,
                                  ),
                                ),
                              ),
                              child: child!,
                            );
                          },
                        );
                        if (picked != null) {
                          setState(() {
                            selectedDate = picked;
                          });
                        }
                      },
                      icon: const Icon(Icons.calendar_today),
                      label: const Text("Select Date of Issue"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.mutedGrayPeach,
                        foregroundColor: AppColors.navyBlueDark,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    if (selectedDate != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          "Date Selected: ${selectedDate!.toLocal().toIso8601String().split('T').first}",
                          style: const TextStyle(color: AppColors.navyBlueDark),
                        ),
                      ),
                    const SizedBox(height: 24),

                    // Submit Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (nameController.text.isEmpty ||
                              emailController.text.isEmpty ||
                              complaintController.text.isEmpty ||
                              selectedCategory == null ||
                              selectedDate == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Row(
                                  children: const [
                                    Icon(Icons.error_outline, color: Colors.white),
                                    SizedBox(width: 10),
                                    Text("Please complete all the fields"),
                                  ],
                                ),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Row(
                                  children: const [
                                    Icon(Icons.check_circle_outline, color: Colors.white),
                                    SizedBox(width: 10),
                                    Text("Complaint submitted successfully."),
                                  ],
                                ),
                              ),
                            );
                            nameController.clear();
                            emailController.clear();
                            complaintController.clear();
                            setState(() {
                              selectedCategory = null;
                              selectedDate = null;
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.navyBlue,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          "Submit Complaint",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Card Block Confirmation Page with PDF Generation
class CardBlockedConfirmationPage extends StatelessWidget {
  final String last4Digits;
  final String reason;
  final String dateTime;
  final String referenceNumber;
  final String cardType;

  const CardBlockedConfirmationPage({
    super.key,
    required this.last4Digits,
    required this.reason,
    required this.dateTime,
    required this.referenceNumber,
    required this.cardType,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Confirmation")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Container(
            decoration: getCardBoxDecoration(),
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(FontAwesomeIcons.circleCheck,
                    color: Colors.green, size: 80),
                const SizedBox(height: 20),
                const Text("Card Blocked Successfully!",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const Divider(height: 30, thickness: 1.5),
                infoRow("Card Type", cardType),
                infoRow("Card Ending", "**** $last4Digits"),
                infoRow("Reason", reason),
                infoRow("Date & Time", dateTime),
                infoRow("Reference No", referenceNumber),
                const SizedBox(height: 30),
                ElevatedButton.icon(
                  onPressed: () => _generatePdf(context),
                  icon: const Icon(Icons.picture_as_pdf),
                  label: const Text("Download PDF"),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
                ),
                const SizedBox(height: 15),
                ElevatedButton.icon(
                  onPressed: () => Navigator.popUntil(
                    context,
                    ModalRoute.withName('/'),
                  ),
                  icon: const Icon(Icons.home),
                  label: const Text("Back to Home"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Expanded(flex: 3, child: Text("$label:",
              style: const TextStyle(fontWeight: FontWeight.bold))),
          Expanded(flex: 5, child: Text(value)),
        ],
      ),
    );
  }

  void _generatePdf(BuildContext context) async {
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text("Card Block Confirmation",
                style: pw.TextStyle(fontSize: 22, fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 30),
            _pdfRow("Card Type", cardType),
            _pdfRow("Card Ending", "**** $last4Digits"),
            _pdfRow("Reason", reason),
            _pdfRow("Date & Time", dateTime),
            _pdfRow("Reference No", referenceNumber),
            pw.SizedBox(height: 40),
            pw.Text("This is a system-generated confirmation. No signature required.",
                style: pw.TextStyle(fontStyle: pw.FontStyle.italic, fontSize: 10)),
          ],
        ),
      ),
    );

    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
      name: 'Card_Block_Confirmation.pdf',
    );
  }

  pw.Widget _pdfRow(String label, String value) {
    return pw.Padding(
      padding: const pw.EdgeInsets.symmetric(vertical: 6),
      child: pw.Row(
        children: [
          pw.Expanded(flex: 3, child: pw.Text("$label:",
              style: pw.TextStyle(fontWeight: pw.FontWeight.bold))),
          pw.Expanded(flex: 5, child: pw.Text(value)),
        ],
      ),
    );
  }
}