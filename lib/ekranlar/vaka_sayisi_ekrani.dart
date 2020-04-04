import 'package:evdekalturkiye/ekranlar/yuklenme_ekrani.dart';
import 'package:evdekalturkiye/modeller/vaka_sayisi.dart';
import 'package:flutter/material.dart';
class VakaSayisiEkrani extends StatefulWidget {
  @override
  _VakaSayisiEkraniState createState() => _VakaSayisiEkraniState();
}

class _VakaSayisiEkraniState extends State<VakaSayisiEkrani> {
  Future<VakaSayisi> veriler;

  @override
  void initState() {
    super.initState();
    veriler = VakaSayisi().sitedenVeriGetir();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Vaka Sayisi:"),),
       body: FutureBuilder<VakaSayisi>(
          future: veriler,
          builder: (context, snapshot) {
            if(snapshot.hasError) {
              return Text("${snapshot.error}");
            } else if(snapshot.hasData) {
              return Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                             child: ListTile(
                               title: Text(snapshot.data.bugunkuTest.toString()),
                               subtitle: Text("Bugünkü Test Sayısı"),
                             ),
                            ),
                          Expanded(
                            child: ListTile(
                              title: Text(snapshot.data.bugunkuVaka.toString()),
                              subtitle: Text("Bugünkü Vaka Sayısı"),
                            ),
                          ),
                          Expanded(
                            child: ListTile(
                              title: Text(snapshot.data.bugunkuVefat.toString()),
                              subtitle: Text("Bugünkü Vefat Sayısı"),
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: ListTile(
                              title: Text(snapshot.data.toplamTest.toString()),
                              subtitle: Text("Toplam Test Sayısı"),
                            ),
                          ),
                          Expanded(
                            child: ListTile(
                              title: Text(snapshot.data.toplamVaka.toString()),
                              subtitle: Text("Toplam Vaka Sayısı"),
                            ),
                          ),
                          Expanded(
                            child: ListTile(
                              title: Text(snapshot.data.toplamVefat.toString()),
                              subtitle: Text("Toplam Vefat Sayısı"),
                            ),
                          ),
                          Expanded(
                            child: ListTile(
                              title: Text(snapshot.data.toplamYogunBakim.toString()),
                              subtitle: Text("Toplam Yoğun Bakım Sayısı"),
                            ),
                          ),
                          Expanded(
                            child: ListTile(
                              title: Text(snapshot.data.toplamEntube.toString()),
                              subtitle: Text("Toplam Entube Sayısı"),
                            ),
                          ),
                          Expanded(
                            child: ListTile(
                              title: Text(snapshot.data.toplamIyilesen.toString()),
                              subtitle: Text("Toplam iyileşen Sayısı"),
                            ),
                          ),
                        ],
                      ),
                   ],
                ),
              );
            }

            return YuklenmeEkrani();
          },
      ),
    );
  }
}
