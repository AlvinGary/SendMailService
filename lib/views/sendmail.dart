import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

import '../services/services.dart';

class SendMailPage extends StatefulWidget {
  const SendMailPage({super.key});

  @override
  State<SendMailPage> createState() => _SendMailPageState();
}

class _SendMailPageState extends State<SendMailPage> {
  @override
  void initState() {
    super.initState();
  }

  final _mailKey = GlobalKey<FormState>();
  final ctrlEmail = TextEditingController();

  @override
  void dispose() {
    ctrlEmail.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Send Mail Page"),
      ),
      body: Container(
        padding: EdgeInsets.all(28),
        child: Form(
          key: _mailKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Receiver Email",
                  prefixIcon: Icon(Icons.email_rounded),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.grey),
                  ),
                ),
                controller: ctrlEmail,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  return !EmailValidator.validate(value.toString())
                      ? 'Email tidak valid'
                      : null;
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (_mailKey.currentState!.validate()) {
            await SendEmailService.sendEmail(ctrlEmail.text).then((value) {
              var result = json.decode(value.body);
              Fluttertoast.showToast(
                msg: result['message'].toString(),
                toastLength: Toast.LENGTH_SHORT,
                fontSize: 14,
                backgroundColor: Colors.greenAccent,
                textColor: Colors.white,
              );
            });
          } else {
            Fluttertoast.showToast(
                msg: "Please fill all fields!",
                toastLength: Toast.LENGTH_SHORT,
                fontSize: 14,
                backgroundColor: Colors.redAccent,
                textColor: Colors.white);
          }
        },
        tooltip: 'Send Email',
        child: Icon(Icons.send_and_archive),
      ),
    );
  }
}
