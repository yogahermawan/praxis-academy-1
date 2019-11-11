import 'package:kasus/kasus.dart';
import 'package:kasus/kasus.dart' as kasus;
import 'package:kasus/testlib.dart' as testlib;
import 'lib.dart' as libr;

main() {
  var awesome = Awesome();
  print('awesome: ${awesome.isAwesome}');
  print('Hello: ${kasus.calculate()}!');
  var textdata = kasus.textdata();
  print(textdata);
  print(libr.numdata());
  print(testlib.checknum(20, 10));
}
