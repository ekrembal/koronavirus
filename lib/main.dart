import 'package:evdekalturkiye/ekranlar/ayirici.dart';
import 'package:evdekalturkiye/modeller/kullanici.dart';
import 'package:evdekalturkiye/servisler/kimlik.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    KayitServisi().signOut();
    return StreamProvider<Kullanici>.value(
      value: KayitServisi().kullanici,
      child: MaterialApp(
        title: 'Evde Kal Türkiye',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Ayirici(),
      ),
    );
  }
}
