import 'package:flutter/material.dart';

String? notEmptyValidator(var value) {
  if (value == null || value.isEmpty) {
    return "Isian tidak boleh kosong";
  } else {
    return null;
  }
}

String? passConfirmationValidator(
    var value, TextEditingController passController) {
  String? notEmpty = notEmptyValidator(value);
  if (notEmpty != null) {
    return notEmpty;
  }

  if (value.length < 6) {
    return "Password minimal 6 karakter";
  }

  if (value != passController.value.text) {
    return "Password dan konfirmasi harus sama";
  }

  return null;
}
