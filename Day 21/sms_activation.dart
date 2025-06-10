import 'package:flutter/material.dart';

void main() {
  runApp(const SmsAlertApp());
}

class SmsAlertApp extends StatelessWidget {
  const SmsAlertApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SMS Alert Activation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: softBlueGray,
        appBarTheme: const AppBarTheme(
          backgroundColor: navyBlue,
          foregroundColor: pureWhite,
          elevation: 4,
        ),
        checkboxTheme: CheckboxThemeData(
          checkColor: MaterialStateProperty.all(pureWhite),
          fillColor: MaterialStateProperty.all(navyBlue),
        ),
        radioTheme: RadioThemeData(
          fillColor: MaterialStateProperty.all(navyBlue),
        ),
      ),
      home: const SmsAlertActivationPage(),
    );
  }
}

// Color constants
const Color pureWhite = Color.fromARGB(255, 255, 255, 255);
const Color softBlueGray = Color.fromARGB(255, 241, 246, 248);
const Color navyBlueDark = Color.fromARGB(255, 20, 40, 80);
const Color navyBlue = Color.fromARGB(255, 30, 60, 100);

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
                  fillColor: pureWhite,
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
                      color: navyBlueDark)),
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
                        foregroundColor: navyBlue,
                        side: const BorderSide(color: navyBlue),
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
                                backgroundColor: pureWhite,
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
                                            color: navyBlueDark),
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
                                          backgroundColor: navyBlue,
                                          foregroundColor: pureWhite,
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
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: navyBlue,
                        foregroundColor: pureWhite,
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
