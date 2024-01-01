import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lapor_book_bk/components/input_widget.dart';
import 'package:lapor_book_bk/components/validators.dart';
import 'package:lapor_book_bk/components/styles.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<StatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  String? nama;
  String? email;
  String? noHP;
  final TextEditingController _password = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> register() async {
    try {
      CollectionReference akunCollection = _db.collection('akun');

      final password = _password.text;
      await _auth.createUserWithEmailAndPassword(
          email: email!, password: password);

      final docId = akunCollection.doc().id;
      await akunCollection.doc(docId).set({
        'uid': _auth.currentUser!.uid,
        'nama': nama,
        'email': email,
        'noHP': noHP,
        'docId': docId,
        'role': 'user',
      });

      return;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 80),
              Text('Register', style: headerStyle(level: 1)),
              const Text(
                'Create your profile to start your journey',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 50),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      InputLayout(
                          'Nama',
                          TextFormField(
                              onChanged: (String value) => setState(() {
                                    nama = value;
                                  }),
                              validator: notEmptyValidator,
                              decoration:
                                  customInputDecoration("Nama Lengkap"))),
                      InputLayout(
                          'Email',
                          TextFormField(
                              onChanged: (String value) => setState(() {
                                    email = value;
                                  }),
                              validator: notEmptyValidator,
                              decoration:
                                  customInputDecoration("email@email.com"))),
                      InputLayout(
                          'No. Handphone',
                          TextFormField(
                              onChanged: (String value) => setState(() {
                                    noHP = value;
                                  }),
                              validator: notEmptyValidator,
                              decoration:
                                  customInputDecoration("+62 80000000"))),
                      InputLayout(
                          'Password',
                          TextFormField(
                              controller: _password,
                              validator: notEmptyValidator,
                              obscureText: true,
                              decoration: customInputDecoration(""))),
                      InputLayout(
                          'Konfirmasi Password',
                          TextFormField(
                              validator: (value) =>
                                  passConfirmationValidator(value, _password),
                              obscureText: true,
                              decoration: customInputDecoration(""))),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Sudah punya akun? '),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: const Text('Login di sini',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                width: double.infinity,
                child: ElevatedButton(
                  style: buttonStyle,
                  child: Text('Register', style: headerStyle(level: 2)),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return FutureBuilder<void>(
                            future: register(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else if (snapshot.hasError) {
                                return AlertDialog(
                                  title: const Text('Error'),
                                  content: SingleChildScrollView(
                                    child: ListBody(
                                      children: <Widget>[
                                        Text('${snapshot.error}'),
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text('OK'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              } else {
                                Future.delayed(Duration.zero, () {
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                      '/login',
                                      (Route<dynamic> route) => false);
                                });
                                return const SizedBox.shrink();
                              }
                            },
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
