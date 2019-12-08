### Autentikasi Google
Gunakan AndroidX agar compatible, adalah project open source yang digunakan oleh tim Android untuk mengembangkan, menguji, mengemas, membuat versi, dan merilis library di dalam Jetpack.
Cara buat AndroidX `flutter create --androidx sign_in_flutter`\
Migrasi AndroidX, `Refactor Menu > Refactor/Migrate to AndroidX` hanya di Android Studio (Jika di VS Code, klik kanan folder android lalu `open in android studio`) atau konfigurasi file `gradle.properties` seperti di bawah lalu `flutter clean`
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
Buat flutter AndroidX `flutter create --androidx --org com.dfa flutterchatdemo` atau migrate ke androidx seperti cara sebelumnya. 
`--org` untuk membuat package name atau bisa ubah package name dengan `com.dfa.flutterchatdemo` di file main>AndroidManifest.xml, debug>AndroidManifest.xml, 
profile>>AndroidManifest.xml, app>build.gradle dan MainActivity. Ubah juga direktori MainActivity menjadi `com>dfa>flutterchatdemo` lalu jalankan `flutter clean build` di terminal\
Tambahkan flutter plugin
```
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^0.1.2
  firebase_auth: ^0.15.1
  google_sign_in: ^4.0.14
  cloud_firestore: ^0.12.11
  fluttertoast: ^3.1.3
  image_picker: ^0.6.2+1
  shared_preferences: ^0.5.4+8
  firebase_storage: ^3.0.8
  cached_network_image: ^1.1.3
  intl: ^0.16.0
  firebase_messaging: ^6.0.2
  flutter_local_notifications: ^0.8.4+3
  photo_view: ^0.9.0
```
Kode sumber aplikasi chatting [libchat](https://github.com/Fourthten/praxis-academy/tree/master/novice/03-03/kasus/lib_chat)\
Tambahkan folder [images](https://github.com/Fourthten/praxis-academy/tree/master/novice/03-03/kasus/images_gif) dan inisialisasi di pubspec.yaml sebagai gambar .gif pada chat.
```
assets:
    - images/
```
Tambahkan [app_icon.png](https://github.com/Fourthten/praxis-academy/blob/master/novice/03-03/kasus/app_icon.png) di `android\app\src\main\res\drawable`\
Ubah icon android seperti materi sebelumnya dengan `app_icon.png`\
Konfigurasi firebase pada aplikasi flutter seperti sebelumnya. enable autentikasi google, cloud firestore dan storage\
Jika error androidX compatible, konfigurasi build.gradle
```
classpath 'com.android.tools.build:gradle:3.5.2'
classpath 'com.google.gms:google-services:4.3.2'
```
Upgrade gradle pada `gradle>wrapper>gradle-wrapper.properties`
```
https\://services.gradle.org/distributions/gradle-5.4.1-all.zip
```
Apabila menggunakan kotlin `ext.kotlin_version = '1.3.0'`\
Jika error `[TAG] Failed to resolve variable '${junit.version}'/'${animal.sniffer.version}'` pada android studio klik `File>Invalidate Caches/Restart` lalu `Build>Clean Project`

<video width="300" autoplay loop>
  <source src="https://github.com/Fourthten/praxis-academy/blob/master/novice/03-03/kasus/record/chatting.mp4" type="video/mp4">
  Your browser does not support the video tag.
</video>

Aplikasi ini akan membuat collection users di cloud firestore setelah login akun google yang berisi profile, chat dengan siapa, dll. 
Dan juga membuat collection messages yang berisi data pesan chat. Storage berisi upload gambar dari chat. 


Sumber:\
[AndroidX](https://developer.android.com/jetpack/androidx?hl=id)\
[Autentikasi Google SignIn](https://medium.com/flutter-community/flutter-implementing-google-sign-in-71888bca24ed)\
[Building Chat App](https://medium.com/flutter-community/building-a-chat-app-with-flutter-and-firebase-from-scratch-9eaa7f41782e)
