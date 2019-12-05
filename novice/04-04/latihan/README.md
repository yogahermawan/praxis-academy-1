### Flavors
Produk flavor mirip dengan build type, dengan flavor dapat menentukan konfigurasi build dan mengubahnya sesuai keinginan. 
Dengan flavor dapat membuat beberapa aplikasi dengan sumber kode yang sama namun berbeda konfigurasi. Contoh flavor,\
Buat projek flutter `flutter create flavorsexample`\
Buat aplikasi seperti kode dart berikut: []()
Install flutter package
```
dependencies:
  flutter:
    sdk: flutter
  intl: ^0.15.7
```
Tambahkan [image]() di `assets\`\
Konfigurasi flavor di `android\app\build.gradle`
```
    defaultConfig { ... }
    flavorDimensions "app"
    productFlavors {
        app1 {
            dimension "app"
            applicationId "com.example.flavorsexample.app1"
            versionCode 1
            versionName "1.0"
        }
        app2 {
            dimension "app"
            applicationId "com.example.flavorsexample.app2"
            versionCode 1
            versionName "1.0"
        }
    }
    buildTypes { ... }
```
Konfigurasi `AndroidManifest`
```
<application
    android:name="io.flutter.app.FlutterApplication"
    android:label="@string/app_name"
    android:icon="@mipmap/ic_launcher">
```
Tambahkan file strings.xml di `android/app/src/main/res/values`
```
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="app_name">Default App Name</string>
</resources>
```
Tambahkan file strings.xml di `android/app/src/app1/res/values`
```
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="app_name">App 1</string>
</resources>
```
Tambahkan file strings.xml di `android/app/src/app2/res/values`
```
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="app_name">App 2</string>
</resources>
```
Jalankan `flutter run --flavor app1` atau `flutter run --flavor app2`\
![]()\
Tambahkan Flavors, buat main_common, main_app1, main_app2 seperti ini []()\
app_config.dart untuk mengkonfigurasi nama tampilan aplikasi dan internal id aplikasi. 
home_page.dart untuk menampilkan UI aplikasi. 
Jalankan di terminal `flutter run --flavor app1 -t lib/main_app1.dart` atau 
`flutter run --flavor app2 -t lib/main_app2.dart`\
Custom beberapa sumber string dan assets pada flavor, Contoh fike []()\

