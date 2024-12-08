import 'package:flutter/material.dart';

class DestinationScreen extends StatelessWidget {
  final Map<String, dynamic> dest; // Change to dynamic
  final List<dynamic> activities; // Change to dynamic

  const DestinationScreen(
      {super.key,
      required this.dest,
      this.activities = const [] // Provide a default empty list
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // Add SafeArea for better layout
        child: Column(
          children: [
            // Add a back button and destination details
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                Expanded(
                  child: Text(
                    dest['city'] ?? 'Destination',
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),

            Expanded(
              child: activities.isEmpty
                  ? const Center(child: Text('No activities available'))
                  : ListView.builder(
                      itemCount: activities.length,
                      itemBuilder: (context, index) {
                        // Null-aware checks for activity details
                        final activity = activities[index];
                        return Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.green[400],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              height: 190,
                              margin: const EdgeInsets.fromLTRB(70, 5, 20, 5),
                            ),
                            Positioned(
                              top: 10,
                              bottom: 10,
                              left: 15,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image(
                                  height: 130,
                                  width: 130, // Add width to prevent overflow
                                  fit: BoxFit.cover,
                                  // Null-aware image loading
                                  image: AssetImage(activity['imageUrl'] ??
                                      'images/placeholder.jpg'),
                                ),
                              ),
                            ),
                            // Add more activity details here if needed
                          ],
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
