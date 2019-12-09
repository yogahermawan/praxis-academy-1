### Internasionalisasi app
Sarana mengadaptasi perangkat lunak komputer ke bahasa yang berbeda, kekhasan regional dan persyaratan teknis dari target lokal. 
Aplikasi Internasionalisasi digunakan untuk pengguna yang berbicara bahasa lain.
### Internasionalisasi pendekatan JSON app
Tambahkan flutter localization di pubspec.yaml
```
dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_localizations:
    sdk: flutter
```
tambah json assets
```
assets: 
    - assets/i18n/en.json
    - assets/i18n/fr.json
```
[Kode sumber](https://github.com/Fourthten/praxis-academy/tree/master/novice/03-05/latihan/localization_i18n)\
Widget App dengan _AppState memiliki widget AppBody yang berisi tampilan aplikasi. 
Method `onChangeLanguage` untuk mengubah bahasa aplikasi. 
`MyLocalizations.of(context)` untuk mendapatkan data bahasa dan mengubahnya pada tampilan. 
MyLocalizationsDelegate sebagai inheritance dari MyLocalizations yang menginisialisasi localizedValues. 
Method `initialize()` memiliki `loadJsonFromAsset()` dan `convertValueToString()` untuk mendeklarasi bahasa dari file json. 

<img src="https://github.com/Fourthten/praxis-academy/blob/master/novice/03-05/latihan/record/localizationi18n.gif" width="300">

### Internasionalisasi JSON sesuai bahasa sistem
Tambahkan flutter_localizations
```
dependencies:
  flutter:
    sdk: flutter
  flutter_localizations:
    sdk: flutter
```
Tambah json assets
```
assets: 
    - resources/lang/tr.json
    - resources/lang/en.json
```
[Kode Sumber]()
Aplikasi ini mengubah bahasa inggris dan turki menyesuaikan bahasa sistem yang digunakan. 
MyApp mendeklarasi locale dan berisi tampilan widget MyPage. 
DemoLocalizations.of(context) untuk menyesuaikan text sesuai bahasa yang dipakai. 
DemoLocalizationsDelegate sebagai turunan dari DemoLocalizations yang menginisialisasi bahasa sistem.\
![]()



sumber: 
[Flutter Internationalization Tutorials](https://medium.com/@datvt9312/flutter-internationalization-tutorials-d8f0f711e7f)\
[Github Internationalization](https://github.com/anilcancakir/flutter-internationalization)

