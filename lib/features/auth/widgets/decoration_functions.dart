import 'package:flutter/material.dart';
import 'package:free_man/core/config/palette.dart';

InputDecoration registerInputDecoration({required String hintText}) {
  return InputDecoration(
      contentPadding:
          const EdgeInsets.symmetric(vertical: 18.0, horizontal: 10),
      hintStyle: const TextStyle(color: Colors.white60, fontSize: 18),
      hintText: hintText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: Colors.white),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: Colors.white),
      ));
}

InputDecoration signInInputDecoration({required String hintText}) {
  return InputDecoration(
      contentPadding:
          const EdgeInsets.symmetric(vertical: 18.0, horizontal: 10),
      hintStyle: const TextStyle(fontSize: 18),
      hintText: hintText,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.grey)));
}
