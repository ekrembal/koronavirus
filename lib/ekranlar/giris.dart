import 'package:evdekalturkiye/ekranlar/yuklenme_ekrani.dart';
import 'package:evdekalturkiye/servisler/kimlik.dart';
import 'package:flutter/material.dart';

class GirisEkrani extends StatefulWidget {
  @override
  _GirisEkraniState createState() => _GirisEkraniState();
}

class _GirisEkraniState extends State<GirisEkrani> {
  final _kimlik = KayitServisi();
  bool yukleniyorMu = false;
  String hataMesaji = '';


  @override
  Widget build(BuildContext context) {
    return yukleniyorMu ? YuklenmeEkrani() :Scaffold(
      appBar: AppBar(
        title: Text('Evde Kal Türkiye'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0,),
        child: Column(
          children: [
            Text('Bildiğiniz üzere koronavirüs...'),
            RaisedButton(
              onPressed: () async {
                setState(() {
                  yukleniyorMu = true;
                });
                dynamic sonuc = await _kimlik.anonimGiris();
                if(sonuc == null){
                  setState(() {
                    hataMesaji = 'Bir sorun çıktı! Internet bağlantınızı kontrol ediniz.';
                    yukleniyorMu = false;
                  });
                }
              },
              child: Text(
                  'Teste Başla',
                  style: TextStyle(fontSize: 20)
              ),
            ),
            SizedBox(height: 20.0,),
            Text(hataMesaji, style: TextStyle(color: Colors.red, fontSize: 14.0),),
          ],
        ),
      ),
    );
  }
}
