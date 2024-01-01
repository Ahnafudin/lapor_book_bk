import 'package:flutter/material.dart';

// Mengubah warna tema
var primaryColor = const Color(0xff507DBC); // Warna biru
var warningColor = const Color(0xFFF6C065); // Warna kuning
var dangerColor = const Color(0xFFD9534F); // Warna merah
var successColor = const Color(0xFF5CB85C); // Warna hijau
var greyColor = const Color(0xFFAFAFAF); // Warna abu-abu

TextStyle headerStyle({int level = 1, bool dark = true}) {
  List<double> levelSize = [30, 24, 20];
  return TextStyle(
    fontSize: levelSize[level - 1],
    fontWeight: FontWeight.bold,
    color: dark ? Colors.black : Colors.white,
  );
}

var buttonStyle = ElevatedButton.styleFrom(
  padding: const EdgeInsets.symmetric(vertical: 15),
  backgroundColor: primaryColor,
);
