[DevTools](https://flutter.dev/docs/development/tools/devtools), serangkaian alat kinerja dan profil yang berjalan di browser. 
Install DevTools terlebih dahulu jalankan , di terminal `flutter pub global activate devtools` 
atau dengan VS Code `View>Command Palette>Dart: Open DevTools>Activate Dart DevTools` dengan terlebih dahulu menjalankan aplikasi (f5). 
DevTools hanya support pada browser Google Chrome. Pilih tab [Flutter Inspector](https://flutter.dev/docs/development/tools/devtools/inspector) 
pada DevTools untuk membuka inspektur aplikasi. Pada IDE berjalan secara default apabila menggunakan terminal gunakan `flutter run --track-widget-creation` 
sehingga flutter inspector dapat menyajikan widget tree dalam cara yang sama bagaimana UI didefinisikan dalam kode. Buka DevTools di browser dengan `http://localhost:9100` 
lalu masukkan port url aplikasinya misal `http://127.0.0.1:56440/ucN44DE3X-w=/`. 

<img src="https://github.com/Fourthten/praxis-academy/blob/master/novice/04-03/latihan/images/devtools.PNG" width="600">

Select widget mode untuk menampilkan detail tree; Performance overlay berisi grafik GPU dan CPU; Paint Baselines untuk render text garis dasar; Debug Paint untuk render display border, padding, alignment, and spacer; 
logging untuk debug log; Slow Animations untuk inspeksi visual dengan memperlambat animasi; Repaint Rainbow menampilkan rotasi warna pada layar ketika di warna ulang. 
Mengukur waktu startup aplikasi dengan `flutter run --trace-startup --profile`, profile mode tidak bisa dijalankan pada emulator dan simulator karena performa tidak real. 
hasil trace disimpan pada file `start_up_info.json` di dalam folder build.
```
{
  "engineEnterTimestampMicros": 490472173216,
  "timeToFrameworkInitMicros": 290277,
  "timeToFirstFrameRasterizedMicros": 911105,
  "timeToFirstFrameMicros": 656220,
  "timeAfterFrameworkInitMicros": 365943
}
```
Tracing ditampilkan secara timeline view. UI mengeksekusi kode Dart di Dart VM. GPU mengeksekusi kode grafis dari Flutter Engine.\

<img src="https://github.com/Fourthten/praxis-academy/blob/master/novice/04-03/latihan/images/timeline.PNG" width="600">

Build mode terdiri dari Debug mode, aplikasi diatur untuk debugging pada physical device, emulator, simulator. 
Release mode, untuk menggunakan aplikasi saat menginginkan optimalisasi maksimum dan ukuran footprint minimal. 
Profile mode, beberapa kemampuan debugging cukup untuk profil kinerja aplikasi.\
Testing aplikasi flutter dengan [Unit test](https://flutter.dev/docs/cookbook/testing/unit/introduction) untuk tes single function, method atau class. 
[Widget test](https://flutter.dev/docs/testing#widget-tests) untuk tes single widget. [Integration test](https://flutter.dev/docs/testing#integration-tests) untuk tes aplikasi lengkap atau hanya sebagian besar.\

Sumber:\
[Debugging Flutter apps](https://flutter.dev/docs/testing/debugging)\
[Debugging Flutter apps programmatically](https://flutter.dev/docs/testing/code-debugging)\
[Build Mode](https://flutter.dev/docs/testing/build-modes)\
[Testing Flutter](https://flutter.dev/docs/testing)\
[VS Code Debug](https://dartcode.org/docs/debugging-commands/)\
[VS Code Log](https://dartcode.org/docs/logging/)\
[Android Studio Debug](https://flutter.dev/docs/testing/oem-debuggers)