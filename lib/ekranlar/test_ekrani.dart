import 'package:evdekalturkiye/ekranlar/vaka_sayisi_ekrani.dart';
import 'package:flutter/material.dart';

class TestEkrani extends StatefulWidget {
  @override
  _TestEkraniState createState() => _TestEkraniState();
}

class _TestEkraniState extends State<TestEkrani> {
  @override
  Widget build(BuildContext context) {
    return VakaSayisiEkrani();
  }
}
