import 'package:flutter/material.dart';
import '../widgets/grid_item.dart';
import '../models/Icon.dart';

class GridViewScreen extends StatelessWidget {
  const GridViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('2. Grid View Exercise')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(12.0),

              child: Text(
                "Fixed Column Grid",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            SizedBox(
              height: 400,
              child: GridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 1,
                padding: const EdgeInsets.all(8.0),
                physics: const NeverScrollableScrollPhysics(),

                children: List.generate(12, (index) {
                  return GridItem(
                    icon: gridIcons[index],
                    lable: "Item ${index + 1}",
                    color: Colors.lightBlue.shade100,
                  );
                }),
              ),
            ),

            const Padding(
              padding: EdgeInsets.all(12.0),

              child: Text(
                "Responsive Grid",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            SizedBox(
              height: 500,
              child: GridView.extent(
                maxCrossAxisExtent: 150, //
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.8,
                padding: const EdgeInsets.all(10.0),
                physics: const NeverScrollableScrollPhysics(),

                children: List.generate(12, (index) {
                  return GridItem(
                    icon: gridIcons[index],
                    lable: "Item ${index + 1}",
                    color: Colors.lime.shade100,
                  );
                }),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
