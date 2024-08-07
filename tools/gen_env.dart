import 'dart:io';

void main() {
  _createJsonFile('develop');
  _createJsonFile('qa');
  _createJsonFile('staging');
  _createJsonFile('production');
}

void _createJsonFile(String filename) {
  File file = File('env/$filename.json');
  if (!file.existsSync()) {
    file.createSync(recursive: true);
    file.writeAsStringSync('''{
  "FLAVOR": "$filename"
}
''');
    print('File $filename.json created');
  } else {
    print('!!! File $filename.json already exists !!!');
  }
}
