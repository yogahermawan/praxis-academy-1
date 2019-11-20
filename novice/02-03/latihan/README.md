### Menambah Asset dan image
Spesifik lokasi di pubspec.yaml
```
flutter:
  assets:
    - assets/images/my_icon.png
    - assets/images/background.png
```
All assets
```
flutter:
  assets:
    - assets/
```
Assets variant
```
flutter:
  assets:
    - graphics/background.png
```
Example Code
```
import 'package:flutter/material.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Image from assets"),
        ),
        body: Image.asset('assets/images/paint.png'),
      ),
    );
  }
}
```
![images](https://github.com/Fourthten/praxis-academy/blob/master/novice/02-03/latihan/images/images.PNG)
### Mengganti Icon Android
Untuk android lokasi di `android\app\src\main\res\mipmap` atau pubspec.yaml:
```
dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_launcher_icons: ^0.7.4

flutter_icons:
  image_path: "assets/images/praxis.png"
  android: true
  ios: true
```
run in terminal
```
>flutter pub get
>flutter pub pub run flutter_launcher_icons:main
```
atau buka android studio, tunggu build selesai. 
klik kanan folder `res`, `New>Image Asset`, konfigurasi ikonnya.
![icon](https://github.com/Fourthten/praxis-academy/blob/master/novice/02-03/latihan/images/icon.PNG)
### Launch/splash screen
Untuk android lokasi di `android\app\src\main\res\drawable\launch_background.xml`.
```
<layer-list xmlns:android="http://schemas.android.com/apk/res/android">
    <!-- <item android:drawable="@android:color/white" /> -->
    <!-- insert image assets here -->
    <item>
        <bitmap
            android:gravity="center"
            android:src="@mipmap/ic_launcher" />
    </item>
</layer-list>
```
![navigasi](https://github.com/Fourthten/praxis-academy/blob/master/novice/02-03/latihan/images/launchscreen.PNG)
### Navigasi
- Animasi widget di layar berbeda
1. Dua layar dengan gambar sama
```
class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return DetailScreen();
          }));
        },
        child: Image.network(
          'https://picsum.photos/250?image=9',
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Image.network(
            'https://picsum.photos/250?image=9',
          ),
        ),
      ),
    );
  }
}
```
2. Gunakan hero widget untuk koneksi dua layar dengan animasi
```
Hero(
  tag: 'imageHero',
  child: Image.network(
    'https://picsum.photos/250?image=9',
  ),
);
```
```
import 'package:flutter/material.dart';

void main() => runApp(HeroApp());

class HeroApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Transition Demo',
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
      ),
      body: GestureDetector(
        child: Hero(
          tag: 'imageHero',
          child: Image.network(
            'https://picsum.photos/250?image=9',
          ),
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return DetailScreen();
          }));
        },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: Hero(
            tag: 'imageHero',
            child: Image.network(
              'https://picsum.photos/250?image=9',
            ),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
```
![animate](https://github.com/Fourthten/praxis-academy/blob/master/novice/02-03/latihan/record/animation.gif)
- Navigasi layar baru dan kembali
1. Buat 2 routes
```
class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Route'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Open route'),
          onPressed: () {
            // Navigate to second route when tapped.
          },
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
```
2. Navigasi route kedua menggunakan `Navigator.push()`
```
onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => SecondRoute()),
  );
}
```
3. Kembali ke route pertama menggunakan `Navigator.pop()`
```
onPressed: () {
  Navigator.pop(context);
}
```
```
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: FirstRoute(),
  ));
}

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Route'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Open route'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondRoute()),
            );
          },
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
```
![navigate](https://github.com/Fourthten/praxis-academy/blob/master/novice/02-03/latihan/record/navigate.gif)