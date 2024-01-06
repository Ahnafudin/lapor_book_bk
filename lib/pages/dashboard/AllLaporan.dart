import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lapor_book_bk/components/list_item.dart';
import 'package:lapor_book_bk/models/akun.dart';
import 'package:lapor_book_bk/models/laporan.dart';

class AllLaporan extends StatefulWidget {
  final Akun akun;
  const AllLaporan({super.key, required this.akun});

  @override
  State<AllLaporan> createState() => _AllLaporanState();
}

class _AllLaporanState extends State<AllLaporan> {
  final _firestore = FirebaseFirestore.instance;

  List<Laporan> listLaporan = [];
  void getTransaksi() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _firestore.collection('laporan').get();

      setState(() {
        listLaporan.clear();
        for (var documents in querySnapshot.docs) {
          List<dynamic>? komentarData = documents.data()['komentar'];

          List<Komentar>? listKomentar = komentarData?.map((map) {
            return Komentar(
              nama: map['nama'],
              isi: map['isi'],
            );
          }).toList();

          listLaporan.add(
            Laporan(
              uid: documents.data()['uid'],
              docId: documents.data()['docId'],
              judul: documents.data()['judul'],
              instansi: documents.data()['instansi'],
              deskripsi: documents.data()['deskripsi'],
              nama: documents.data()['nama'],
              status: documents.data()['status'],
              gambar: documents.data()['gambar'],
              tanggal: documents['tanggal'].toDate(),
              maps: documents.data()['maps'],
              komentar: listKomentar,
            ),
          );
        }
      });
    } catch (e) {
      final snackbar = SnackBar(content: Text(e.toString()));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount =
        screenWidth < 600 ? 2 : 4; // 2 columns for narrow screens, 4 for wider
    final childAspectRatio = screenWidth < 600
        ? 1 / 1.25
        : 1 / 1.6; // Adjust aspect ratio based on screen width
    getTransaksi();

    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(20),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: childAspectRatio,
            ),
            itemCount: listLaporan.length,
            itemBuilder: (context, index) {
              return ListItem(
                laporan: listLaporan[index],
                akun: widget.akun,
                isLaporanku: false,
              );
            }),
      ),
    );
  }
}
