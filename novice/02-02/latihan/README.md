## Pengenalan Widget
Widget menggambarkan tampilan aplikasi yang diberikan konfigurasi dan status saat ini.
Widget digunakan untuk mengontrol *interface* aplikasi.
### Hello World
```
import 'package:flutter/material.dart';
void main() {
  runApp(
    Center(
      child: Text(
        'Hello, world!',
        textDirection: TextDirection.ltr,
      ),
    ),
  );
}
```
### Basic Widgets
Basic yaitu Text, Row, Column, Stack, Container.
```
import 'package:flutter/material.dart';
class MyAppBar extends StatelessWidget {
  MyAppBar({this.title});
  // Fields di Widget subclass selalu memakai "final".
  final Widget title;
  @override
  Widget build(BuildContext context) {
    // Header
    return Container(
      // Tinggi Container 56px
      height: 56.0, // logical pixels
      // Padding 8px kiri kanan
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(color: Colors.blue[500]),
      // Row adalah flex widget horizontal dengan tata letak linear.
      child: Row(
        // <Widget> adalah tipe dari item pada list.
        children: <Widget>[
          // Icons Menu
          IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Navigation menu',
            onPressed: null, // null disables the button
          ),
          // Expanded memperluas child untuk mengisi ruang tersedia.
          Expanded(
            child: title,
          ),
          // Icons Search
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
    );
  }
}

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Material adalah kertas konseptual dimana UI muncul.
    return Material(
      // Column adalah flex widget vertical dengan tata letak linear.
      child: Column(
        children: <Widget>[
          MyAppBar(
            // Text widget untuk membuat style text.
            title: Text(
              'Example title',
              style: Theme.of(context).primaryTextTheme.title,
            ),
          ),
          Expanded(
            child: Center(
              child: Text('Hello, world!'),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'My app', // used by the OS task switcher
    home: MyScaffold(),
  ));
}
```
Widget Stack menempatkan widget diatas satu sama lain dalam urutan.
Posisi widget pada children dari Stack untuk memposisikan relatif ke atas, kanan, bawah, atau kiri.
Stack berdasarkan posisi tata letak absolut web.
Widget Container membuat element visual rectangular. Container dapat di dekorasi dengan 
BoxDecoration seperti background, border, shadow. Container memiliki margin, padding dan constraint sesuai ukuran.
Container dapat ditransformasikan dalam ruang 3 dimensi dengan matriks.
Material Icons gunakan `uses-material-design: true`
### Material Components
Flutter menyediakan widget untuk membuat aplikasi mengikuti Material Design. 
Material app membangun widget di root aplikasi maupun navigator yang mengelola widget dengan identifikasi string atau dikenal `routes`.
Navigator memungkinkan melakukan transisi diantara layar aplikasi.
Kode beralih dari MyAppBar dan MyScaffold ke AppBar dan Scaffold widget dan menambahkan floating action button.

```
import 'package:flutter/material.dart';
void main() {
  runApp(MaterialApp(
    title: 'Flutter Tutorial',
    home: TutorialHome(),
  ));
}
class TutorialHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Scaffold sebagai layout untuk Material Components utama.
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'Navigation menu',
          onPressed: null,
        ),
        title: Text('Example title'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
      // body
      body: Center(
        child: Text('Hello, world!'),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add', // digunakan oleh teknologi assistive
        child: Icon(Icons.add),
        onPressed: null,
      ),
    );
  }
}
```
### Menangani gestures
Aplikasi menyertakan beberapa interaksi pengguna dengan sistem dengan mendeteksi gesture input.
```
class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('MyButton was tapped!');
      },
      child: Container(
        height: 36.0,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.lightGreen[500],
        ),
        child: Center(
          child: Text('Engage'),
        ),
      ),
    );
  }
}
```
Widget GestureDetector mendeteksi gesture yang dibuat pengguna.
GestureDetector memanggil onTap() callback lalu mencetak pesan di console
untuk mendeteksi input gestures seperti tap, drag, scale.
Banyak widget menggunakan GestureDetector untuk memberikan callback widget lain 
seperti IconButton, RaisedButton, FloatingActionButton yang memiliki `onPressed()` callback yang dipicu oleh pengguna.
### Mengubah widget sebagai respon input
Widget stateless menerima argument dari parent widget yang disimpan dalan final variabel. 
Saat widget diminta untuk `build()`, widget menggunakan nilai tersimpan untuk memperoleh argument baru untuk widget yang dibuat.
StatefulWidgets adalah widget khusus untuk bereaksi dengan cara yang menarik pada input pengguna dengan membuat objek State 
kemudian digunakan untuk menahan state, contohnya RaisedButton.
```
class Counter extends StatefulWidget {
  // Konfigurasi state yang menyimpan nilai yang disediakan parnt dan digunakan oleh build
  // method dari state. Fields subclass selalu memakai "final".
  @override
  _CounterState createState() => _CounterState();
}
class _CounterState extends State<Counter> {
  int _counter = 0;
  void _increment() {
    setState(() {
      // Panggilan ke setState memberi tahu Flutter framework sesuatu berubah di State ini
      // yang menjalankan kembali build method sehingga tampilan mencerminkan perubahan value.
      // Jika merubah _counter tanpa panggil setState() maka build method tidak dipanggil dan tidak ada yang terjadi.
      _counter++;
    });
  }
  @override
  Widget build(BuildContext context) {
    // method menjalankan kembali setiap setState di panggil,
    // seperti _increment method above. Flutter framework menjalankan build methods 
    // kembali dengan cepat, sehingga membangun kembali apapun
    // perlu pembaharuan daripada berubah secara individual seperti widget
    return Row(
      children: <Widget>[
        RaisedButton(
          onPressed: _increment,
          child: Text('Increment'),
        ),
        Text('Count: $_counter'),
      ],
    );
  }
}
```
StatefulWidget dan State adalah objek terpisah. 
Widget adalah objek sementara untuk presentasi aplikasi saat ini.
State objek call build() untuk mengingat informasi.
Membuat 2 new StatelessWidget untuk menampilkan dan menghitung counter.
```
class CounterDisplay extends StatelessWidget {
  CounterDisplay({this.count});
  final int count;
  @override
  Widget build(BuildContext context) {
    return Text('Count: $count');
  }
}
class CounterIncrementor extends StatelessWidget {
  CounterIncrementor({this.onPressed});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      child: Text('Increment'),
    );
  }
}
class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}
class _CounterState extends State<Counter> {
  int _counter = 0;
  void _increment() {
    setState(() {
      ++_counter;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      CounterIncrementor(onPressed: _increment),
      CounterDisplay(count: _counter),
    ]);
  }
}
```
### Menyatukan Semua
Contoh konsep menyatukan semua
```
import 'package:flutter/material.dart';
class Product {
  const Product({this.name});
  final String name;
}
typedef void CartChangedCallback(Product product, bool inCart);
class ShoppingListItem extends StatelessWidget {
  ShoppingListItem({Product product, this.inCart, this.onCartChanged})
      : product = product,
        super(key: ObjectKey(product));
  final Product product;
  final bool inCart;
  final CartChangedCallback onCartChanged;
  Color _getColor(BuildContext context) {
    // Tema tergantung BuildContext yang mengindikasi dimana build ditaruh karena tema digunakan.
    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  }
  TextStyle _getTextStyle(BuildContext context) {
    if (!inCart) return null;
    return TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onCartChanged(product, inCart);
      },
      leading: CircleAvatar(
        backgroundColor: _getColor(context),
        child: Text(product.name[0]),
      ),
      title: Text(product.name, style: _getTextStyle(context)),
    );
  }
}
class ShoppingList extends StatefulWidget {
  ShoppingList({Key key, this.products}) : super(key: key);
  final List<Product> products;
  // Framework memanggil createState widget pertama kali
  // jika parent membangun kembali dan menggunakan tipe
  // widget yang sama, framework menggunakan kembali State object
  // tanpa membuat State object baru.
  @override
  _ShoppingListState createState() => _ShoppingListState();
}
class _ShoppingListState extends State<ShoppingList> {
  Set<Product> _shoppingCart = Set<Product>();
  void _handleCartChanged(Product product, bool inCart) {
    setState(() {
      // Ketika pengguna mengubah cart, perlu merubah
      // _shoppingCart ke dalam setState call untuk memicu rebuild.
      // Framework lalu memanggil build di bawah yang memperbaharui tampilan aplikasi.
      if (!inCart)
        _shoppingCart.add(product);
      else
        _shoppingCart.remove(product);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping List'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        children: widget.products.map((Product product) {
          return ShoppingListItem(
            product: product,
            inCart: _shoppingCart.contains(product),
            onCartChanged: _handleCartChanged,
          );
        }).toList(),
      ),
    );
  }
}
void main() {
  runApp(MaterialApp(
    title: 'Shopping App',
    home: ShoppingList(
        // List Product
      products: <Product>[
        Product(name: 'Eggs'),
        Product(name: 'Flour'),
        Product(name: 'Chocolate chips'),
      ],
    ),
  ));
}
```
### Menanggapi event siklus hidup widget
Subclass state dapat menggantikan initState untuk melakukan pekerjaan yang terjadi sekali. 
Implementasi `initState` diperlukan untuk memanggil `super.initState`.
Ketika objek state tidak diperlukan, framework memanggil `dispose()` pada objek state.
Implementasi `dispose` biasanya diakhiri dengan memanggil `super.dispose`.
### Key
Gunakan key untuk mengontrol widget yang cocok dengan framework saat widget dibangun kembali.
Dengan key, framework membutuhkan 2 widget memiliki key dan runtimeType yang sama.
### Global Key
Global key mengidentifikasi child widget. Global key harus unik secara global di seluruh widget dan dapat 
digunakan untuk mengambil state yang terkait dengan widget.





