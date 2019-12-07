### Autentikasi Google
Gunakan AndroidX agar compatible, adalah project open source yang digunakan oleh tim Android untuk mengembangkan, menguji, mengemas, membuat versi, dan merilis library di dalam Jetpack.
Cara buat AndroidX `flutter create --androidx sign_in_flutter`\
Migrasi AndroidX, `Refactor Menu > Refactor/Migrate to AndroidX` hanya di Android Studio atau konfigurasi file `gradle.properties` seperti di bawah lalu `flutter clean build` di terminal. 
```
android.useAndroidX=true
android.enableJetifier=true
```
Tambahkan plugin flutter
```
dependencies:
  firebase_auth: ^0.15.1
  google_sign_in: ^4.0.14
```
import package,
```
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
```
Konfigurasi firebase dengan aplikasi sehingga terhubung dan enable autentikasi google. 
File Kode Sumber [lib](https://github.com/Fourthten/praxis-academy/tree/master/novice/03-03/kasus/lib_autentikasi)\
File `main.dart` call widget `LoginPage` pada `login_page.dart`. 
`LoginPage` memiliki `_LoginPageState` yang berisi tampilan halaman login google. 
Di dalamnya memanggil method `signInWithGoogle` apabila button di klik, method ini berada di `sign_in.dart`. 
Method ini menjalankan perintah login ke akun google dan return profil penggunanya yang kemudian navigasi ke `home.dart`. 
Ini berisi tampilan nama bayi, Klik menu profil untuk menavigasi ke `profil.dart` yang menampilkan profil akun google. 
Klik button sign out yang memanggil method `signOutGoogle` untuk keluar akun google saat ini. 

<img src="https://github.com/Fourthten/praxis-academy/blob/master/novice/03-03/kasus/record/autentikasi.gif" width="300">

### Aplikasi Chatting
Tambahkan flutter plugin
```
dependencies:
  flutter:
    sdk: flutter
  firebase_core: ^0.4.0+9
  firebase_analytics: ^5.0.2
  firebase_auth: ^0.15.0+1
  cloud_firestore: ^0.12.10+2
  google_sign_in: ^4.0.14
  firebase_storage: ^3.0.8
  fluttertoast: ^3.1.3
  shared_preferences: ^0.5.4+6
  image_picker: ^0.6.2+1
  cached_network_image: ^1.1.3
  intl: ^0.16.0
```

Sumber:\
[AndroidX](https://developer.android.com/jetpack/androidx?hl=id)\
[Autentikasi Google SignIn](https://medium.com/flutter-community/flutter-implementing-google-sign-in-71888bca24ed)
