## Part 1
- Cara menulis aplikasi Flutter di Android.
- Struktur dasar aplikasi Flutter.
- Menemukan dan menggunakan paket untuk memperluas fungsionalitas.
- Menggunakan hot reload untuk pengembangan lebih cepat.
- Menerapkan *stateful widget*.
- Membuat *infinite scrolling listview*.
### Memulai flutter pada android device / emulator
1. Buat flutter project dengan nama `myapp`
2. *replace* file `lib\main.dart` untuk menampilkan `Hello World`
   ```
    // Copyright 2018 The Flutter team. All rights reserved.
    // Use of this source code is governed by a BSD-style license that can be
    // found in the LICENSE file.

    import 'package:flutter/material.dart';

    void main() => runApp(MyApp());

    class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
        title: 'Welcome to Flutter',
        home: Scaffold(
            appBar: AppBar(
            title: Text('Welcome to Flutter'),
            ),
            body: Center(
            child: Text('Hello World'),
            ),
        ),
        );
    }
    }
   ```
### Menggunakan eksternal *package*
3. Tambahkan *dependencies* `english_words`
   ```
    dependencies:
    flutter:
        sdk: flutter

    # The following adds the Cupertino Icons font to your application.
    # Use with the CupertinoIcons class for iOS style icons.
    cupertino_icons: ^0.1.2
   + english_words: ^3.1.0
   ```
4. *Pull package*
   ```
   flutter pub get
   ```
5. import package `import 'package:english_words/english_words.dart';` di `lib\main.dart`
6. Gunakan english_word untuk generate text
   ```
    class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        + final wordPair = WordPair.random();
        return MaterialApp(
        title: 'Welcome to Flutter',
        home: Scaffold(
            appBar: AppBar(
            title: Text('Welcome to Flutter'),
            ),
            body: Center(
            - child: Text('Hello World'),
            + child: Text(wordPair.asPascalCase),
            ),
        ),
        );
    }
    }
   ```
### Menambahkan Stateful Widgets
   Stateless widgets tidak dapat dirubah. Stateful widgets memungkinkan berubah selama menggunakan widgets 
   terdiri dari 2 yaitu kelas instance dan kelas state itu sendiri yang tidak dapat dirubah dan tetap ada.
1. Buat kelas state
   ```
    class RandomWordsState extends State<RandomWords> {
        // TODO Add build() method
    }
   ```
2. Tambahkan *stateful RandomWords widget* ke `main.dart`
   ```
    class RandomWords extends StatefulWidget {
        @override
        RandomWordsState createState() => RandomWordsState();
    }
   ```
3. Tambahkan `build()` *method* ke `RandomWordsState`
   ```
    class RandomWordsState extends State<RandomWords> {
        @override
        Widget build(BuildContext context) {
            final wordPair = WordPair.random();
            return Text(wordPair.asPascalCase);
        }
    }
   ```
4. Ganti *word generation code* dengan `RandomWords`
   ```
    class MyApp extends StatelessWidget {
        @override
        Widget build(BuildContext context) {
            - final wordPair = WordPair.random();
            return MaterialApp(
            title: 'Welcome to Flutter',
            home: Scaffold(
                appBar: AppBar(
                title: Text('Welcome to Flutter'),
                ),
                body: Center(
                - child: Text(wordPair.asPascalCase),
                + child: RandomWords(),
                ),
            ),
            );
        }
    }
   ```
5. Restart app
### Membuat Infinite Scrolling Listview
1. Tambahkan `_suggestions` *list* pada `RandomWordsState class` untuk menyimpan pasangan kata yang disarankan. 
   Tambahkan `_biggerFont` *variable* untuk font size besar.
   ```
    class RandomWordsState extends State<RandomWords> {
        final _suggestions = <WordPair>[];
        final _biggerFont = const TextStyle(fontSize: 18.0);
        // ···
    }
   ```
2. Tambahkan `_buildSuggestions()` *function* pada `RandomWordsState class`
   ```
    Widget _buildSuggestions() {
        return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
            if (i.isOdd) return Divider(); /*2*/

            final index = i ~/ 2; /*3*/
            if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10)); /*4*/
            }
            return _buildRow(_suggestions[index]);
        });
    }
   ```
3. Tambahkan `_buildRow()` *function* pada `RandomWordsState`
   ```
    Widget _buildRow(WordPair pair) {
        return ListTile(
            title: Text(
            pair.asPascalCase,
            style: _biggerFont,
            ),
        );
    }
   ```
4. Pada `RandomWordsState` *class*, perbarui `build()` *method* untuk menggunakan `_buildSuggestions()`, 
   daripada langsung memanggil *word generation library*. (Scaffold mengimplementasikan dasar tata letak visual Material Design.)
   ```
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
            title: Text('Startup Name Generator'),
            ),
            body: _buildSuggestions(),
        );
    }
   ```
5. Pada `MyApp` *class*, perbaharui `build()` *method* dengan mengganti `title`, dan mengubah home menjadi `RandomWords widget`
   ```
    Widget build(BuildContext context) {
        return MaterialApp(
        + title: 'Startup Name Generator',
        + home: RandomWords(), 
        - title: 'Welcome to Flutter',
        - home: Scaffold(
        -     appBar: AppBar(
        -     title: Text('Welcome to Flutter'),
        -     ),
        -     body: Center(
        -     child: RandomWords(),
        -     ),
        - ),
        );
    }
   ```
## Part 2
- Membuat aplikasi Flutter di Android.
- Menggunakan hot reload untuk pengembangan yang cepat.
- Menambahkan interaktivitas ke *stateful widget*.
- Membuat dan menavigasi ke layar kedua.
- Mengubah tampilan aplikasi menggunakan tema.
### Menambah icons pada list
1. Tambahkan `_saved` *Set*pada `RandomWordsState`. `Set` menyimpan pasangan kata yang disukai, 
   `Set` di implementasikan tanpa memungkinkan duplikat entri daripada `List`.
    ```
    class RandomWordsState extends State<RandomWords> {
        final List<WordPair> _suggestions = <WordPair>[];
        final Set<WordPair> _saved = Set<WordPair>();   // Add this line.
        final TextStyle _biggerFont = TextStyle(fontSize: 18.0);
        ...
    }
    ```
2. Pada `_buildRow` *function* tambahkan `alreadySaved` *check* untuk memastikan pasangan kata belum ditambahkan ke favorit.
   ```
    Widget _buildRow(WordPair pair) {
        final bool alreadySaved = _saved.contains(pair);  // Add this line.
        ...
    }
   ```
3. Pada `_buildRow()` tambahkan `heart-shaped icons` di `ListTile objects` untuk mengaktifkan favorit.
   ```
    Widget _buildRow(WordPair pair) {
    final bool alreadySaved = _saved.contains(pair);
        return ListTile(
            title: Text(
            pair.asPascalCase,
            style: _biggerFont,
            ),
            trailing: Icon(   // Add the lines from here... 
            alreadySaved ? Icons.favorite : Icons.favorite_border,
            color: alreadySaved ? Colors.red : null,
            ),                // ... to here.
        );
    }
   ```
![List](https://github.com/Fourthten/praxis-academy/blob/master/novice/02-01/kasus/images/iconlist.png)
### Menambah interaktivitas
1. Menambahkan kemampuan interaksi dengan *heart icons tappable*.
   Pengguna dapat mengetuk entri pada list untuk mengubah status tambah atau hapus dari favorit.
   Modifikasi `_buildRow` *function*
   ```
    Widget _buildRow(WordPair pair) {
        final alreadySaved = _saved.contains(pair);
        return ListTile(
            title: Text(
            pair.asPascalCase,
            style: _biggerFont,
            ),
            trailing: Icon(
            alreadySaved ? Icons.favorite : Icons.favorite_border,
            color: alreadySaved ? Colors.red : null,
            ),
            onTap: () {      // Add 9 lines from here...
            setState(() {
                if (alreadySaved) {
                _saved.remove(pair);
                } else { 
                _saved.add(pair); 
                } 
            });
            },               // ... to here.
        );
    }
   ```
![Interaktivitas](https://github.com/Fourthten/praxis-academy/blob/master/novice/02-01/kasus/images/interaktivitas.png)
### Navigasi ke Layar Baru
1. Menambah halaman baru dan menavigasi diantara *home route* dan *new route*.
   Tambahkan *icon* dan *action* pada `build` *method*.
   ```
    Widget build(BuildContext context) {
        return Scaffold(
        appBar: AppBar(
            title: Text('Startup Name Generator'),
            actions: <Widget>[      // Add 3 lines from here...
            IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
            ],                      // ... to here.
        ),
        body: _buildSuggestions(),
        );
    }
   ```
2. Tambahkan `_pushSaved()` *function* pada RandomWordsState
   ```
    void _pushSaved() {
    }
   ```
3. Panggil `Navigator.push` untuk *push route* ke *navigator stack*
   ```
    void _pushSaved() {
        Navigator.of(context).push(
        );
    }
   ```
4. Tambahkan `MaterialPageRoute ` dan pembangunannya. Tambahkan *ListTile rows*.
   `divideTiles()` *method* dari ListTile menambahkan *horizontal spacing* diantara ListTile.
   `divided` *variable* dikonversi ke list dengan *convenience function*, toList().
   ```
    void _pushSaved() {
        Navigator.of(context).push(
            MaterialPageRoute<void>(   // Add 20 lines from here...
            builder: (BuildContext context) {
                final Iterable<ListTile> tiles = _saved.map(
                (WordPair pair) {
                    return ListTile(
                    title: Text(
                        pair.asPascalCase,
                        style: _biggerFont,
                    ),
                    );
                },
                );
                final List<Widget> divided = ListTile
                .divideTiles(
                    context: context,
                    tiles: tiles,
                )
                .toList();
            },
            ),                       // ... to here.
        );
    }
   ```
5. *Builder property* mengembalikan Scaffold untuk *new route* dengan nama "Saved Suggestions".
   *Body* terdiri dari `ListView` yang berisi  `ListTiles rows` dengan setiap baris dipisahkan oleh `divider`. 
   Tambahkan *horizontal dividers*
   ```
    void _pushSaved() {
        Navigator.of(context).push(
            MaterialPageRoute<void>(
                builder: (BuildContext context) {
                    // ...
                    return Scaffold(         // Add 6 lines from here...
                    appBar: AppBar(
                        title: Text('Saved Suggestions'),
                    ),
                    body: ListView(children: divided),
                    );                       // ... to here.
                },
            ),
        );
    }
   ```
![Navigasi](https://github.com/Fourthten/praxis-academy/blob/master/novice/02-01/kasus/images/navigasi.png)
### Mengubah UI Menggunakan Tema
1. *theme* mengontrol tampilan aplikasi sesuai keinginan. Mengubah tema aplikasi dengan mengkonfigurasi `ThemeData class`.
   *default theme* mengubah *primary color* aplikasi menjadi putih.
   ```
    class MyApp extends StatelessWidget {
        @override
        Widget build(BuildContext context) {
            return MaterialApp(
            title: 'Startup Name Generator',
            theme: ThemeData(          // Add the 3 lines from here... 
                primaryColor: Colors.white,
            ),                         // ... to here.
            home: RandomWords(),
            );
        }
    }
   ```
![Theme](https://github.com/Fourthten/praxis-academy/blob/master/novice/02-01/kasus/images/theme.png)