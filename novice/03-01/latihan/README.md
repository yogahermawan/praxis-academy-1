### Imperatif Deklaratif
Flutter bersifat deklaratif yang membangun UI untuk mencerminkan kondisi aplikasi saat ini.\
Imperatif\
Pergi ke ViewB mengambil b dengan selector atau findViewById dan meminta mutasi padanya.
```
// Imperative style
b.setColor(red)
b.clearChildren()
ViewC c3 = new ViewC(...)
b.add(c3)
```
Deklaratif\
Konfigurasi tampilan widget tidak dapat diubah dan hanya blueprint. 
Untuk mengubah UI, widget memicu membangun kembali dengan sendirinya 
(panggil setState() di StatefulWidgets) dan membuat subtree widget baru.
```
// Declarative style
return ViewB(
  color: red,
  child: ViewC(...),
)
```
## Simple provider
ChangeNotifier adalah kelas sederhana yang menyediakan notifikasi perubahan kepada listeners. 
Jika sesuatu seperti ChangeNotifier dapat subscribe untuk perubahannya. 
ChangeNotifier adalah salah satu cara merangkum state aplikasi. 
Panggil notifyListeners() saat model berubah yang dapat mengubah UI aplikasi.\
ChangeNotifierProvider adalah widget yang menyediakan turunan dari ChangeNotifier untuk turunannya. 
ChangeNotifierProvider tidak membangun kembali CartModel jika tidak benar-benar diperlukan. 
Dan secara otomatis memanggil dispose() pada CartModel ketika instance tidak diperlukan. 
Jika ingin memberi lebih dari satu kelas dapat menggunakan MultiProvider.\
Consumer widget membutuhkan builder. Builder adalah fungsi yang dipanggil setiap kali ChangeNotifier berubah. 
Builder dipanggil dengan tiga argument. Pertama Context, Kedua instance dari ChangeNotifier (menggunakan data model untuk tampilan UI), 
Ketiga child yang hanya perlu membangun sekali subtree widget besar di bawah consumer yang tidak berubah dan mendapatkannya melalui builder.\
Provider.of dimana tidak benar-benar membutuhkan data model untuk merubah UI tapi masih perlu untuk aksesnya.
```
Provider.of<CartModel>(context, listen: false).add(item);
```
Kode diatas tidak menyebabkan widget dibangun kembali ketika notifyListeners dipanggil.

### Provider Shopper
1. Buat proyek baru dengan nama `provider_shopper`
2. Tambahkan di pubspec.yaml
```
dependencies:
  flutter:
    sdk: flutter
  provider: ^3.0.0
```
import package provider `import 'package:provider/provider.dart';`\
3. Tambahkan font `Corben` di folder proyek, source: [Corben](https://github.com/Fourthten/praxis-academy/tree/master/novice/03-01/latihan/fonts/Corben)\
4. Tambahkan common, models, screens, main.dart pada folder lib, source: [lib](https://github.com/Fourthten/praxis-academy/tree/master/novice/03-01/latihan/lib_shopper)\
`common\theme.dart` digunakan untuk mengidentifikasi tema pada aplikasi.\
`screens` digunakan sebagai tampilan layar aplikasi. 
Dengan `Provider.of`, memiliki akses ke kelas model sebagai state saat ini.\
`models` berisi kelas model digunakan sebagai akses data pada aplikasi.

<img src="https://github.com/Fourthten/praxis-academy/blob/master/novice/03-01/latihan/record/shopper.gif" width="300">

### Provider Counter
1. Buat proyek baru dengan nama `provider_counter`
2. Tambahkan di pubspec.yaml
```
dependencies:
  flutter:
    sdk: flutter
  provider: ^3.0.0
```
import package provider `import 'package:provider/provider.dart';`\
3. Edit `lib\main.dart` source: [main.dart](https://github.com/Fourthten/praxis-academy/blob/master/novice/03-01/latihan/counter.dart)\
![counter](https://github.com/Fourthten/praxis-academy/blob/master/novice/03-01/latihan/images/counter.PNG)
### Business Logic Component
Buat proyek baru `bloc_update_tutorial`\
Tambahkan bloc library di pubspec.yaml. 
Equatable untuk menyederhanakan perbandingan nilai Dart,
```
dependencies:
  flutter:
    sdk: flutter
  flutter_bloc: ^0.15.1
  equatable: ^0.2.6
```
simple UI weather `lib\main.dart`. source: [simpleweather.dart](https://github.com/Fourthten/praxis-academy/blob/master/novice/03-01/latihan/simpleweather.dart)\
Menggunakan bloc:\
Klik kanan folder `lib`, pilih `Bloc: New Bloc`, beri nama `weather`, pilih `Yes`\
Kemudian copy source ini: [lib](https://github.com/Fourthten/praxis-academy/tree/master/novice/03-01/latihan/lib_weather)

<img src="https://github.com/Fourthten/praxis-academy/blob/master/novice/03-01/latihan/record/weather.gif" width="300">


