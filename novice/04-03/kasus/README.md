### Profiling kinerja aplikasi
Koneksi physical device, Jalankan dengan mode profil `flutter run --track-widget-creation --trace-startup --profile` di terminal. 
Mode profil tidak bisa dijalankan di emulator dan simulator. Jalankan DevTools pada Google Chrome. 
Testing ini menggunakan aplikasi [Internasionalisasi pendekatan JSON app](https://github.com/Fourthten/praxis-academy/tree/master/novice/03-05/latihan). 
UI mengeksekusi kode Dart di Dart VM. GPU mengeksekusi kode grafis dari Flutter Engine. Jika frame merender di bawah 16ms maka tidak perlu khawatir dengan performa.\
![]()
Untuk meningkatkan performa, ubah stateless widget menjadi stateful widget
```
class AppBody extends StatefulWidget {
  final VoidCallback onChangeLanguage;
  AppBody(this.onChangeLanguage);
  @override
  _AppBodyState createState() => _AppBodyState();
}
class _AppBodyState extends State<AppBody> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(MyLocalizations.of(context).hello),
      ),
      body: new Center(
        child: new Text(MyLocalizations.of(context).greetTo('Agung')),
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.language), onPressed: widget.onChangeLanguage));
  }
}
```
![]()