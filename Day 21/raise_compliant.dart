import 'package:flutter/material.dart';

void main() {
  runApp(ComplaintApp());
}

class ComplaintApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bank Complaint Form',
      debugShowCheckedModeBanner: false,
      home: ComplaintFormPage(),
    );
  }
}

class ComplaintFormPage extends StatefulWidget {
  @override
  _ComplaintFormPageState createState() => _ComplaintFormPageState();
}

class _ComplaintFormPageState extends State<ComplaintFormPage> {
  final _formKey = GlobalKey<FormState>();

  // Controllers and variables for form fields
  final TextEditingController accountNumberController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController transactionDateController = TextEditingController();
  final TextEditingController transactionAmountController = TextEditingController();
  final TextEditingController transactionRefController = TextEditingController();
  final TextEditingController complaintDescriptionController = TextEditingController();
  final TextEditingController incidentDateController = TextEditingController();

  String? complaintType;
  String? preferredResolution;

  final List<String> complaintTypes = [
    'Transaction Issue',
    'Card Issue',
    'ATM Issues',
    'Loan/EMI Issues',
    'Internet Banking Problems',
    'Mobile App Issues',
    'Others'
  ];

  final List<String> resolutionOptions = [
    'Refund',
    'Investigation',
    'Reversal',
    'Other'
  ];

  @override
  void dispose() {
    accountNumberController.dispose();
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    transactionDateController.dispose();
    transactionAmountController.dispose();
    transactionRefController.dispose();
    complaintDescriptionController.dispose();
    incidentDateController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        controller.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

 void _submitForm() {
  if (_formKey.currentState!.validate()) {
    showDialog(
      context: context,
      builder: (ctx) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: Colors.white,
        elevation: 16,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.check_circle, color: Colors.green, size: 60),
              SizedBox(height: 15),
              Text(
                'Complaint Submitted',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Your complaint has been successfully submitted. Our support team will get back to you shortly.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Navigator.of(ctx).pop();
                  _formKey.currentState!.reset();
                  setState(() {
                    complaintType = null;
                    preferredResolution = null;
                  });
                },
                child: Text('OK', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Raise a Complaint'),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Account Number
              TextFormField(
                controller: accountNumberController,
                decoration: InputDecoration(
                  labelText: 'Account Number',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (val) =>
                val == null || val.isEmpty ? 'Please enter account number' : null,
              ),
              SizedBox(height: 16),

              // Name
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  border: OutlineInputBorder(),
                ),
                validator: (val) =>
                val == null || val.isEmpty ? 'Please enter your name' : null,
              ),
              SizedBox(height: 16),

              // Phone
              TextFormField(
                controller: phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
                maxLength: 10,
                validator: (val) =>
                val == null || val.isEmpty ? 'Please enter phone number' : null,
              ),
              SizedBox(height: 16),

              // Email
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email Address',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (val) =>
                val == null || val.isEmpty ? 'Please enter email' : null,
              ),
              SizedBox(height: 16),

              // Complaint Type
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Complaint Type',
                  border: OutlineInputBorder(),
                ),
                value: complaintType,
                items: complaintTypes
                    .map((type) => DropdownMenuItem<String>(
                  value: type,
                  child: Text(type),
                ))
                    .toList(),
                onChanged: (val) {
                  setState(() {
                    complaintType = val;
                  });
                },
                validator: (val) => val == null ? 'Please select complaint type' : null,
              ),
              SizedBox(height: 16),

              // Transaction Date
              TextFormField(
                controller: transactionDateController,
                decoration: InputDecoration(
                  labelText: 'Transaction Date (if applicable)',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () => _selectDate(context, transactionDateController),
                  ),
                ),
                readOnly: true,
              ),
              SizedBox(height: 16),

              // Transaction Amount
              TextFormField(
                controller: transactionAmountController,
                decoration: InputDecoration(
                  labelText: 'Transaction Amount (if applicable)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),

              // Transaction Reference Number
              TextFormField(
                controller: transactionRefController,
                decoration: InputDecoration(
                  labelText: 'Transaction Reference Number (if applicable)',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),

              // Date of Incident
              TextFormField(
                controller: incidentDateController,
                decoration: InputDecoration(
                  labelText: 'Date of Incident',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () => _selectDate(context, incidentDateController),
                  ),
                ),
                readOnly: true,
                validator: (val) =>
                val == null || val.isEmpty ? 'Please select date of incident' : null,
              ),
              SizedBox(height: 16),

              // Complaint Description
              TextFormField(
                controller: complaintDescriptionController,
                decoration: InputDecoration(
                  labelText: 'Complaint Description',
                  border: OutlineInputBorder(),
                  alignLabelWithHint: true,
                ),
                maxLines: 5,
                validator: (val) =>
                val == null || val.isEmpty ? 'Please enter complaint details' : null,
              ),
              SizedBox(height: 16),

              // Preferred Resolution
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Preferred Resolution (Optional)',
                  border: OutlineInputBorder(),
                ),
                value: preferredResolution,
                items: resolutionOptions
                    .map((res) => DropdownMenuItem<String>(
                  value: res,
                  child: Text(res),
                ))
                    .toList(),
                onChanged: (val) {
                  setState(() {
                    preferredResolution = val;
                  });
                },
              ),
              SizedBox(height: 24),

              ElevatedButton(
                onPressed: _submitForm,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  child: Text('Submit Complaint', style: TextStyle(fontSize: 18)),
                ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
