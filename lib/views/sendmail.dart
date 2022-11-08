import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:class_week6/views/congratspage.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:uni_links/uni_links.dart';

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
    _handleIncomingLinks();
    _handleInitialUri();
  }

  Uri? _initialUri;
  Uri? _latestUri;
  Object? _err;
  StreamSubscription? _sub;
  final _mailKey = GlobalKey<FormState>();
  final ctrlEmail = TextEditingController();
  bool _initialUriHandled = false;

  @override
  void dispose() {
    ctrlEmail.dispose();
    _sub?.cancel();
    super.dispose();
  }

  void _handleIncomingLinks() {
    if (!kIsWeb) {
      _sub = uriLinkStream.listen((Uri? uri) {
        if (!mounted) return;
        print('got uri: $uri');
        Navigator.pushAndRemoveUntil<dynamic>(
            context,
            MaterialPageRoute<dynamic>(builder: (context) => CongratsPage()),
            (route) => false);
        setState(() {
          _latestUri = uri;
          _err = null;
        });
      }, onError: (Object err) {
        if (!mounted) return;
        print('got err: $err');
        setState(() {
          _latestUri = null;
          _err = err;
        });
      });
    }
  }

  Future<void> _handleInitialUri() async {
    if (!_initialUriHandled) {
      _initialUriHandled = true;
      print('_handleInitialUri called');
      try {
        final uri = await getInitialUri();
        if (uri == null) {
          print('no initial uri');
        } else {
          print('got initial uri: $uri');
          // Navigator.pushAndRemoveUntil<dynamic>(
          //     context,
          //     MaterialPageRoute<dynamic>(builder: (context) => CongratsPage()),
          //     (route) => false);
        }
        if (!mounted) return;
        setState(() => _initialUri = uri);
      } on FormatException catch (err) {
        if (!mounted) return;
        print('malformed initial uri');
        setState(() => _err = err);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AFL Cloud Computing"),
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
              print(result);
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
