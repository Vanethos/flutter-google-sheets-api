import 'package:flutter/material.dart';
import 'package:sheets_backend/models/house_entity.dart';
import 'package:sheets_backend/providers/sheets/google_sheets_provider.dart';
import 'package:sheets_backend/ui/app.dart';

class HomePage extends StatefulWidget {
  final GoogleSheetsProvider provider;
  const HomePage({
    required this.provider,
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<HouseEntity>> get houses => widget.provider.getHouses();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Houses'),
      ),
      body: FutureBuilder<List<HouseEntity>>(
        future: houses,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final houses = snapshot.data!;

          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: ListView.builder(
                itemCount: houses.length,
                itemBuilder: (context, index) => HouseCard(
                      name: houses[index].name,
                      address: houses[index].address,
                      onDelete: () async {
                        await widget.provider.deleteHouse(index);

                        /// should call again the getter
                        setState(() {});
                      },
                    )),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).pushNamed(routeAdd);
          setState(() {});
        },
        child: const Icon(
          Icons.house,
          color: Colors.white,
        ),
      ),
    );
  }
}

class HouseCard extends StatelessWidget {
  final String name;
  final String address;
  final VoidCallback onDelete;

  const HouseCard({
    required this.name,
    required this.address,
    required this.onDelete,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Text(name, textAlign: TextAlign.start),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                color: Colors.grey,
                height: 20.0,
                width: 2.0,
              ),
            ),
            Center(
              child: IconButton(
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                onPressed: onDelete,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
