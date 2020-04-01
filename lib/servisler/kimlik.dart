import 'package:evdekalturkiye/modeller/kullanici.dart';
import 'package:firebase_auth/firebase_auth.dart';

class KayitServisi{

  final FirebaseAuth _kimlik = FirebaseAuth.instance;

  Kullanici _KullaniciYap(FirebaseUser kullanici){
    if(kullanici == null)
      return null;
    return Kullanici(kullaniciId: kullanici.uid);
  }

  Stream < Kullanici > get kullanici {
    return _kimlik.onAuthStateChanged.map((FirebaseUser kullanici) => _KullaniciYap(kullanici));
  }

  Future getUserId() async {
    FirebaseUser user = await _kimlik.currentUser();
    return user.uid;
  }

  Future anonimGiris() async {
    try{
      AuthResult result = await _kimlik.signInAnonymously();
      return _KullaniciYap(result.user);
    } catch(e){print(e.toString());return null;}

  }
  Future signOut() async {
    try{
      return await _kimlik.signOut();
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

}