import 'package:flutter/material.dart';
import 'package:lapor_book_bk/components/list_item.dart';
import 'package:lapor_book_bk/models/akun.dart';

class AllLaporan extends StatefulWidget {
  final Akun akun;
  const AllLaporan({super.key, required this.akun});

  @override
  State<AllLaporan> createState() => _AllLaporanState();
}

class _AllLaporanState extends State<AllLaporan> {
  @override
  Widget build(BuildContext context) {
    // getTransaksi();
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1 / 1.234,
            ),
            itemCount: 4,
            itemBuilder: (context, index) {
              return ListItem();
            }),
      ),
    );
  }
}
