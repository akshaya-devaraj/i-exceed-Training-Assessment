import 'package:flutter/material.dart';

void main() {
  runApp(SmsAlertApp());
}

class SmsAlertApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SmsAlertActivationPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SmsAlertActivationPage extends StatefulWidget {
  @override
  _SmsAlertActivationPageState createState() => _SmsAlertActivationPageState();
}

class _SmsAlertActivationPageState extends State<SmsAlertActivationPage> {
  String? selectedAccount;
  bool activateAlerts = false;
  bool awareOfCharges = false;
  bool cheque=false;
  bool card=false;
  bool hold_on_account_balance=false;

  List<String> accountOptions = ['Account 1', 'Account 2', 'Account 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SMS ALERT ACTIVATION'),
        backgroundColor: Colors.deepPurple[300],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Select Account"),
            DropdownButton<String>(
              isExpanded: true,
              hint: Text("--Please Select--"),
              value: selectedAccount,
              items: accountOptions.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (val) {
                setState(() {
                  selectedAccount = val;
                });
              },
            ),
            SizedBox(height: 16),
            Text("All SMS Alerts"),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<bool>(
                    title: Text("Activate"),
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
                    title: Text("Deactivate"),
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
            Divider(),
            CheckboxListTile(
                title: Text("Cheque"),
                value: cheque,
                onChanged: (val)
                {
                  setState(() {
                    cheque=val!;
                  });
                }
            ),
            CheckboxListTile(
                title: Text("Credit/Debit Account"),
                value: card,
                onChanged: (val)
            {
                  setState(() {
                    card=val!;
                  });
            }),
            CheckboxListTile(
                title: Text("Hold on Account Balance"),
                value: hold_on_account_balance,
                onChanged: (val){
                  setState(() {
                    hold_on_account_balance=val!;
                  });
                }
            ),
            CheckboxListTile(
              title: Text("I am aware of Charges"),
              value: awareOfCharges,
              onChanged: (val) {
                setState(() {
                  awareOfCharges = val!;
                });
              },
            ),
            Spacer(),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                       Navigator.pop(context);
                    },
                    child: Text("Back"),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: selectedAccount != null && awareOfCharges
                        ? () {

                      showDialog(
                        context: context,
                        barrierDismissible:
                        false, // user must tap button
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("SMS Alert Activated"),
                            content: Text(
                                "SMS alert activation has been done for $selectedAccount."),
                            actions: [
                              TextButton(
                                child: Text("OK"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              )
                            ],
                          );
                        },
                      );


                      // Submit action
                    }
                        : null,
                    child: Text("Submit"),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}