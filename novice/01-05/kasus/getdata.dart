import 'dart:async';
import 'dart:io';
import 'dart:convert';

// get content from endpoint
Future<void> printUser() async {
  var request = 
    await HttpClient().getUrl(Uri.parse('https://jsonplaceholder.typicode.com/users'));
  var response = await request.close();
  // transforms and prints the response
  await for (var contents in response.transform(Utf8Decoder())) {
    // print(contents);
    var file = await File('get.txt').writeAsString(contents);
    print('Create file');
  }
}

void main() async {
  await printUser();
  var file = File('get.txt');
  var contents;
  if(await file.exists()){
    //read file
    contents = await file.readAsString();
    print(contents);

    //write file
    var fileCopy = await File('get-copy.txt').writeAsString(contents);
    // print(await fileCopy.exists());
    // print(await fileCopy.length());
    print('File copied');
  }
}