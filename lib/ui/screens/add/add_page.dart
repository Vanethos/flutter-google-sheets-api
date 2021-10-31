import 'package:flutter/material.dart';
import 'package:sheets_backend/providers/sheets/google_sheets_provider.dart';

class AddPage extends StatefulWidget {
  final GoogleSheetsProvider provider;
  const AddPage({required this.provider, Key? key}) : super(key: key);

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add House"),
      ),
      body: Center(
        child: SizedBox(
          width: size > 300 ? 300 : size,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              /// House name
              TextFormField(
                controller: _nameController,
                onChanged: (_) => setState(() {}),
                decoration: const InputDecoration(hintText: "House Name"),
              ),

              const SizedBox(
                height: 12.0,
              ),

              /// House name
              TextFormField(
                controller: _addressController,
                onChanged: (_) => setState(() {}),
                decoration: const InputDecoration(hintText: "House Address"),
              ),

              const SizedBox(
                height: 12.0,
              ),

              MaterialButton(
                  child: const Text(
                    'Add House',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Theme.of(context).primaryColor,
                  onPressed: () async {
                    await widget.provider.addHouse(
                        _nameController.text, _addressController.text);
                    Navigator.of(context).pop();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
