### Deployment
Tambahkan launcher icon, pada AndroidManifest.xml
```
<application android:icon="@mipmap/ic_launcher" ....>
```
Nama aplikasi
```
<application android:label="localization" ....>
```
Permission jika dibutuhkan
```
<manifest ...>
....
<uses-permission android:name="android.permission.INTERNET" />
....
<application ...>
```
Untuk publish ke playstore buat keystore release jika belum punya
```
keytool -genkey -v -keystore c:/Users/USER_NAME/key.jks -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias key
```
![]()\
keystore aktif selama 10000 hari, kode diatas akan generate file key.jks\
Buat file `android\key.properties`
```
storePassword=<password from previous step>
keyPassword=<password from previous step>
keyAlias=key
storeFile=C:\\Users\\UserName\\key.jks
```
Konfigurasi `android\app\build.gradle`
```
// tambahkan di atas android {
def keystoreProperties = new Properties()
def keystorePropertiesFile = rootProject.file('key.properties')
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(new FileInputStream(keystorePropertiesFile))
}

// tambahkan di atas buildTypes {
signingConfigs {
    release {
        keyAlias keystoreProperties['keyAlias']
        keyPassword keystoreProperties['keyPassword']
        storeFile file(keystoreProperties['storeFile'])
        storePassword keystoreProperties['storePassword']
    }
}

// replace signingConfig signingConfigs.build
signingConfig signingConfigs.release
```
Cek applicationId, versionCode, versionName, minSdkVersion, targetSdkVersion sudah sesuai atau belum\
Bundle menggunakan bundletool untuk membuat set APK yang dapat di ekstrak dengan base dan konfigurasi terpisah. 
Bundle berformat penerbitan, APK berformat packaging untuk di install di perangkat.\
Membuat bundle `flutter build appbundle`, lokasi di `build/app/outputs/bundle/release/app.aab`\
Membuat APK `flutter build apk --release`, lokasi di `build/app/outputs/apk/release/app.apk`. 
dengan `flutter build apk --split-per-abi` menghasilkan apk yang tidak gemuk yang berisi kode untuk semua ABI target.\
Install di perangkat langsung, `flutter install`\
di Android Studio, klik `gradle/build.gradle(Module: app)` pilih menu `build>select build variant` pada `active build variant` pilih `release`

Sumber:\
[Deployment](https://flutter.dev/docs/deployment/android)