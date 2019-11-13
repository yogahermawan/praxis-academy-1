mixin Musical {
  bool canPlayPiano = true;
  bool canCompose = false;
  bool canConduct = false;
  
  void entertainMe() {
    if (canPlayPiano) {
      print('Playing piano');
    } else if (canConduct) {
      print('Waving hands');
    } else {
      print('Humming to self');
    }
  }
}
class Musician with Musical {
  var b = Musical;
}
main(){
  var c = Musician();
  print(c);
}