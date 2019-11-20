### Stateless Widgets
```
// import package
import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    // Menampilkan text 'Cool'
    // home: new Text("Cool"),
    // Panggil Widget MyStatelessWidget()
    home: new MyStatelessWidget(),
    debugShowCheckedModeBanner: false,
  ));
}

// Widget MyStatelessWidget
class MyStatelessWidget extends StatelessWidget {
  @override
  // BuildContext mengidentifikasi dimana widget dibangun
  Widget build(BuildContext context){
    //Scaffold menyediakan fungsionalitas appbar, body, dll
    return new Scaffold(
      // appBar
      appBar: new AppBar(title: new Text("Stateless Widget")),
      // body aplikasi
      body: new Container(
        // padding sekitar card di dalam container
        padding: new EdgeInsets.all(20.0),
        // child berisi single widget
        child: new Column(
          // posisi alignment dilebarkan
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // children berisi list widget
          children: <Widget>[
            // simple list card
            // new Text("Hey"),
            // new Text("My name"),
            // new Text("Is Raunak")

            // list card
            new MyCard(
              // title style
              title: new Text("I love Flutter", style: new TextStyle(fontSize: 20.0)),
              // icon style
              icon: new Icon(Icons.favorite, size: 40.0, color: Colors.redAccent)
            ),
            new MyCard(
              title: new Text("I love Donuts", style: new TextStyle(fontSize: 20.0)),
              icon: new Icon(Icons.donut_large, size: 40.0, color: Colors.brown)
            ),
            new MyCard(
              title: new Text("I see you", style: new TextStyle(fontSize: 20.0)),
              icon: new Icon(Icons.visibility, size: 40.0, color: Colors.blue)
            )
          ]
        )
      )
    );
  }
}

// Widget MyCard
class MyCard extends StatelessWidget {
  // constructor
  MyCard({this.title, this.icon});

  final Widget title;
  final Widget icon;

  @override
  Widget build(BuildContext context){
    return new Container(
      // bottom padding card
      padding: new EdgeInsets.only(bottom: 20.0),
      child: new Card(
        child: new Container(
          // padding di dalam card
          padding: new EdgeInsets.all(15.0),
          child: new Column(
          children: <Widget>[
              // simple isi card
              // new Text("I love Flutter"),
              // new Icon(Icons.favorite)
              
              // get title dan icon
              this.title,
              this.icon
            ]
          )
        )
      )
    );
  }
}
```
`void main()` menjalankan `MaterialApp` yang berisi widget `MyStatelessWidget`. 
`MyStatelessWidget` berisi appBar dan body aplikasi. Body berisi list widget `MyCard`. 
Widget `MyCard` berisi title dan icon.\
![Stateless](https://github.com/Fourthten/praxis-academy/blob/master/novice/02-02/kasus/images/stateless_widget.PNG)
### Button dan Stateful Widget
Stateful dan state terpisah dan berbeda,
```
// import package
import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    // panggil widget AwesomeButton()
    home: new AwesomeButton(),
    debugShowCheckedModeBanner: false
  ));
}

// Widget AwesomeButton
class AwesomeButton extends StatefulWidget {
  @override
  AwesomeButtonState createState() => new AwesomeButtonState();
}

// state awesomebutton
class AwesomeButtonState extends State<AwesomeButton> {
  // constructor
  int counter = 0;
  List<String> strings = ["Flutter", "Is", "Awesome"];
  String displayedString = "";

  // variables juga bisa seperti ini
  // var counter = 0;
  // var strings = ["Flutter", "Is", "Awesome"];

  // onPressed function
  void onPressed(){
    // state merupakan data private variabel yang tidak bisa diakses variabel lain
    // ketika state berubah maka variabel akan di render atau rebuild
    setState(() {
      displayedString = strings[counter];
      counter = counter < 2 ? counter+1 : 0;
    });
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      // appBar style
      appBar: new AppBar(title: new Text("Stateful Widget!"), backgroundColor: Colors.deepOrange),
      // body app
      body: new Container(
        // child center
        child: new Center(
          // chiled vertical
          child: new Column(
            // posisi alignment center
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // text style
              new Text(displayedString, style: new TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
              // padding
              new Padding(padding: new EdgeInsets.all(15.0)),
              // raised button
              new RaisedButton(
                // text button style
                child: new Text("Press me!", style: new TextStyle(color: Colors.white, fontStyle: FontStyle.italic, fontSize: 20.0)),
                // color button
                color: Colors.red,
                // action onPressed function
                onPressed: onPressed
              )
            ]
          )
        )
      )
    );
  }
}
```
`void main()` menjalankan `MaterialApp` yang berisi widget `AwesomeButton`. 
`AwesomeButton` berisi state class `AwesomeButtonState`. Di dalamnya terdiri dari constructor, function, Scaffold. 
Scaffold berisi appBar, body. Body memiliki raisedbutton yang apabila di press/klik menjalankan function onPressed() 
untuk mengubah value variabel dalam state tersebut. Kemudian value tersebut ditampilkan ke dalam body.\
![statefull](https://github.com/Fourthten/praxis-academy/blob/master/novice/02-02/kasus/images/statefull_widget.PNG)