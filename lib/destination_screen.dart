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
          crossAxisAlignment: CrossAxisAlignment.start,
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
            // Display the destination image and description
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                    image: AssetImage(
                        dest['imageUrl'] ?? 'images/placeholder.jpg'),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    dest['description'] ?? 'No description available',
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            // Display a list of activities
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                'Activities',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
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
                                color: Colors.white30,
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
                            Positioned(
                              top: 20,
                              left: 160,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    activity['name'] ?? 'No name available',
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    activity['type'] ?? 'No type available',
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.black),
                                  ),
                                  Text(
                                    'Price: \$${activity['price'] ?? 'N/A'}',
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.black),
                                  ),
                                  Row(
                                    children: List.generate(
                                      activity['rating'] ?? 0,
                                      (index) => const Icon(
                                        Icons.star,
                                        size: 14,
                                        color: Colors.amber,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Start Times: ${activity['startTimes']?.join(', ') ?? 'N/A'}',
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
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
