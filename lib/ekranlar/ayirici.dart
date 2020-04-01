import 'package:evdekalturkiye/ekranlar/giris.dart';
import 'package:evdekalturkiye/ekranlar/test_ekrani.dart';
import 'package:evdekalturkiye/modeller/kullanici.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Ayirici extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final kullanici = Provider.of<Kullanici>(context);
    if(kullanici == null)
      return GirisEkrani();
    else
      return TestEkrani();
  }
}
