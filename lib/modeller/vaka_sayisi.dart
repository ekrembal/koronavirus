import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;

class VakaSayisi{
  final int toplamTest;
  final int toplamVaka;
  final int toplamVefat;
  final int toplamYogunBakim;
  final int toplamEntube;
  final int toplamIyilesen;
  final int bugunkuTest;
  final int bugunkuVaka;
  final int bugunkuVefat;
  VakaSayisi({this.toplamTest, this.toplamVaka, this.toplamVefat, this.toplamYogunBakim, this.toplamEntube, this.toplamIyilesen, this.bugunkuTest, this.bugunkuVaka, this.bugunkuVefat});
  
  int sayiyaCevir(dom.Element eleman){
    return int.parse(eleman.innerHtml.trim().replaceAll(".", ""));
  }

  Future<VakaSayisi> sitedenVeriGetir() async {
    http.Response response = await http.get('https://covid19.saglik.gov.tr/');
    dom.Document document = parser.parse(response.body);
    List<dom.Element> veriler = document.getElementsByTagName('span');
    if(veriler == null || veriler.length != 30)
      return null;
//    print(veriler[1].innerHtml.trim().replaceAll(".", ""));
//    print(veriler[3].innerHtml.trim());
    return VakaSayisi(
      toplamTest: sayiyaCevir(veriler[1]),
      toplamVaka: sayiyaCevir(veriler[3]),
      toplamVefat: sayiyaCevir(veriler[5]),
      toplamYogunBakim: sayiyaCevir(veriler[7]),
      toplamEntube: sayiyaCevir(veriler[9]),
      toplamIyilesen: sayiyaCevir(veriler[11]),
      bugunkuTest: sayiyaCevir(veriler[13]),
      bugunkuVaka: sayiyaCevir(veriler[15]),
      bugunkuVefat: sayiyaCevir(veriler[17]),
    );
  }
}