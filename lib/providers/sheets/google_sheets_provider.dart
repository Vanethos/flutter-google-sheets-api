import 'package:gsheets/gsheets.dart';
import 'package:sheets_backend/models/house_entity.dart';

class GoogleSheetsProvider {
  final GSheets _gsheets;

  late Worksheet _worksheet;

  GoogleSheetsProvider(String credentials) : _gsheets = GSheets(credentials);

  Future<void> initializeForWorksheet(
      String spreadsheetId, String worksheetTitle) async {
    final excel = await _gsheets.spreadsheet(spreadsheetId);

    _worksheet = excel.worksheetByTitle(worksheetTitle)!;
  }

  Future<List<HouseEntity>> getHouses() async {
    /// skips the first value which is the header
    final values = (await _worksheet.values.allRows()).skip(1).toList();
    return values.map((value) => HouseEntity.fromSheets(value)).toList();
  }

  Future<bool> deleteHouse(int index) {
    /// We add one to the index so that we can:
    /// 1. Start at index 1
    /// 2. Skip the first row
    return _worksheet.deleteRow(index + 2);
  }

  Future<bool> addHouse(String name, String address) {
    return _worksheet.values.appendRow([name, address]);
  }
}
