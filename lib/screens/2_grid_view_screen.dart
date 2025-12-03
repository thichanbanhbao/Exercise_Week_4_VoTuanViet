import 'package:flutter/material.dart';

final List<Map<String, dynamic>> gridItems = [
  {'icon': Icons.camera_alt, 'label': 'Item 1'},
  {'icon': Icons.settings, 'label': 'Item 2'},
  {'icon': Icons.music_note, 'label': 'Item 3'},
  {'icon': Icons.pets, 'label': 'Item 4'},
  {'icon': Icons.access_alarms, 'label': 'Item 5'},
  {'icon': Icons.palette, 'label': 'Item 6'},
  {'icon': Icons.cloud, 'label': 'Item 7'},
  {'icon': Icons.favorite, 'label': 'Item 8'},
  {'icon': Icons.folder, 'label': 'Item 9'},
  {'icon': Icons.star, 'label': 'Item 10'},
  {'icon': Icons.battery_charging_full, 'label': 'Item 11'},
  {'icon': Icons.wifi, 'label': 'Item 12'},
];

Widget buildGridItem(BuildContext context, Map<String, dynamic> item) {
  return Column(
    children: [
      Expanded(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.teal.shade100,
            borderRadius: BorderRadius.circular(15.0),
          ),
          margin: const EdgeInsets.all(5.0),
          child: Center(
            child: Icon(
              item['icon'] as IconData,
              size: 40.0,
              color: Colors.teal.shade800,
            ),
          ),
        ),
      ),

      Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Text(
          item['label'] as String,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ),
    ],
  );
}

class GridViewScreen extends StatelessWidget {
  const GridViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('2. Grid View Exercise'),
        backgroundColor: Colors.orange,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              "Fixed Column Grid",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange,
              ),
            ),
            const SizedBox(height: 10),

            GridView.count(
              crossAxisCount: 3,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              childAspectRatio: 1.0,

              shrinkWrap: true,

              physics: const NeverScrollableScrollPhysics(),

              children: List.generate(
                gridItems.length,
                (index) => buildGridItem(context, gridItems[index]),
              ).sublist(0, 6),
            ),

            const SizedBox(height: 30),
            const Text(
              "Responsive Grid",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange,
              ),
            ),
            const SizedBox(height: 10),

            GridView.extent(
              maxCrossAxisExtent: 150.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 0.8,

              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),

              children: List.generate(
                gridItems.length,
                (index) => buildGridItem(context, gridItems[index]),
              ).sublist(6, 12),
            ),
          ],
        ),
      ),
    );
  }
}
