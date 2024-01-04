import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lapor_book_bk/models/laporan.dart';
import 'package:lapor_book_bk/models/akun.dart';

class KomentarWidget extends StatefulWidget {
  final Laporan laporan;
  final Akun akun;
  const KomentarWidget({Key? key, required this.laporan, required this.akun})
      : super(key: key);

  @override
  _KomentarWidgetState createState() => _KomentarWidgetState();
}

class _KomentarWidgetState extends State<KomentarWidget> {
  final _komentarController = TextEditingController();
  final _firestore = FirebaseFirestore.instance;

  void postKomentar() async {
    String commentText = _komentarController.text.trim();

    if (commentText.isNotEmpty) {
      String userName = widget.akun.nama; // Use the actual user name

      await _firestore.collection('laporan').doc(widget.laporan.docId).update({
        'komentar': FieldValue.arrayUnion([
          {
            'nama': userName,
            'isi': commentText,
          }
        ]),
      });

      // Update the local list of comments
      setState(() {
        widget.laporan.komentar
            ?.add(Komentar(nama: userName, isi: commentText));
      });

      _komentarController.clear();
    } else {
      // Show an alert or a Snackbar if the comment is empty
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Komentar tidak boleh kosong')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.laporan.komentar?.isEmpty ?? true)
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Belum ada komentar'),
          ),
        // Display existing comments
        ...widget.laporan.komentar?.map((komentar) => Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(komentar.nama,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(komentar.isi),
                  ),
                )) ??
            [],
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _komentarController,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: 'Tambah Komentar',
              suffixIcon: IconButton(
                icon: Icon(Icons.send, color: Theme.of(context).primaryColor),
                onPressed: postKomentar,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
