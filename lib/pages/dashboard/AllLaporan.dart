import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lapor_book_bk/components/list_item.dart';
import 'package:lapor_book_bk/models/akun.dart';
import 'package:lapor_book_bk/models/laporan.dart';

class AllLaporan extends StatefulWidget {
  final Akun akun;
  AllLaporan({super.key, required this.akun});

  @override
  State<AllLaporan> createState() => _AllLaporanState();
}

class _AllLaporanState extends State<AllLaporan> {
  final _firestore = FirebaseFirestore.instance;

  List<Laporan> listLaporan = [];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('All Laporan'),
    );
  }
}
