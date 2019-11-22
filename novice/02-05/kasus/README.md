### Gesture Detector
Pada aplikasi sebelumnya, tambahkan widget Header
```
class Header extends StatelessWidget {
    Header(this.headerText,{Key key,}) : super(key: key);
    // GlobalKey untuk Sliver AppBar
    final GlobalKey globalKey = new GlobalKey();
    // Text header
    final String headerText;

    void collaps(){
        // startBehavior: start, dependencies: [_ScrollableScope]
        Scrollable.ensureVisible(globalKey.currentContext);
    }

    @override
    Widget build(BuildContext context){
        return GestureDetector(
            key: globalKey,
            // onTap
            onTap: collaps,
            // Container style
            child: Container(
                color: Colors.lightBlue,
                child: Center(
                    child: Text(headerText)
                )
            ),
        );
    }
}
```
Dan juga ubah kode berikut,
```
SliverPersistentHeader makeHeader(String headerText) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverAppBarDelegate(
        minHeight: 60.0,
        maxHeight: 200.0,
        - child: Container(
        -  color: Colors.lightBlue, 
        -  child: Center(child: Text(headerText))),
        + child: Header(headerText)
      ),
    );
  }
```
File contoh [gestureheader.dart](https://github.com/Fourthten/praxis-academy/blob/master/novice/02-05/kasus/gestureheader.dart)

<img src="https://github.com/Fourthten/praxis-academy/blob/master/novice/02-05/kasus/record/gestureheader.gif" width="300">
