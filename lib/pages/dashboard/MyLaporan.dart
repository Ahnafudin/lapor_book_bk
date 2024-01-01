import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lapor_book_bk/components/list_item.dart';
import 'package:lapor_book_bk/models/akun.dart';
import 'package:lapor_book_bk/models/laporan.dart';

class MyLaporan extends StatefulWidget {
  const MyLaporan({super.key, required Akun akun});

  @override
  State<MyLaporan> createState() => _MyLaporanState();
}

class _MyLaporanState extends State<MyLaporan> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('My Laporan'),
    );
  }
}
