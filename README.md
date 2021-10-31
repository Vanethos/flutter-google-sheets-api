# Google Sheets Backend example

This is a Google-Sheets-powered application, that can get a list of all the data, delete data and add data.

## Installation

1. Create a `configs` folder at the root of the project
2. Create a `secrets.dart` folder inside it
3. Add the following:
```dart
const credentials = r'''<your-google-cloud-json>''';

const String sheetId = '<sheets id>';

const String worksheetTitle = '<worksheet title>';
```

Now you will be able to run the app!
