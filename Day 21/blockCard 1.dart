import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class AppColors {
  static const pureWhite = Color.fromARGB(255, 255, 255, 255);          // previously dominantBlue / translucentWhite
  static const softBlueGray = Color.fromARGB(255, 241, 246, 248);       // previously lighterBlue
  static const mutedGrayPeach = Color.fromARGB(253, 205, 213, 214);     // previously palePeach
  static const navyBlueDark = Color.fromARGB(255, 20, 40, 80);          // previously deepBlueDark
  static const navyBlue = Color.fromARGB(255, 30, 60, 100);             // previously deeperBlue
}

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

class MyApp extends StatelessWidget {
  const MyApp({super.key});
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
        dropdownMenuTheme: DropdownMenuThemeData(

        ),
      ),

      home: const BlockDebitCardPage(),
    );
  }
}

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
                        child:
                        Icon(FontAwesomeIcons.solidCreditCard, color: Colors.white, size: 20),
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
                      style:
                      TextStyle(fontWeight: FontWeight.w600, color: AppColors.navyBlueDark)),
                  const SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    value: selectedCardType,
                    dropdownColor: Colors.white, // ✅ this sets the popup color
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
                      style:
                      TextStyle(fontWeight: FontWeight.w600, color: AppColors.navyBlueDark)),
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
                      style:
                      TextStyle(fontWeight: FontWeight.w600, color: AppColors.navyBlueDark)),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: reasonController,
                    maxLines: 4,
                    decoration: InputDecoration(
                      prefixIcon:
                      const Icon(FontAwesomeIcons.exclamationTriangle, color: Colors.orange),
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
                const Icon(Icons.check_circle_outline, color: Colors.green, size: 80),
                const SizedBox(height: 20),
                const Text("Card Blocked!",
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
                  onPressed: () => Navigator.pop(context),
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
          Expanded(flex: 3, child: Text("$label:", style: const TextStyle(fontWeight: FontWeight.bold))),
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
          pw.Expanded(flex: 3, child: pw.Text("$label:", style: pw.TextStyle(fontWeight: pw.FontWeight.bold))),
          pw.Expanded(flex: 5, child: pw.Text(value)),
        ],
      ),
    );
  }
}
