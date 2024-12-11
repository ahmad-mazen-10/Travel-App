import 'package:flutter/material.dart';

class HotelScreen extends StatelessWidget {
  final Map<String, dynamic> hotel;

  const HotelScreen({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 2),
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: Hero(
                    tag: hotel['imageUrl'],
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image(
                        image: AssetImage(hotel['imageUrl']),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 40,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        iconSize: 30,
                        color: Colors.black,
                        onPressed: () => Navigator.pop(context),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.search),
                            iconSize: 30,
                            color: Colors.black,
                            onPressed: () => {},
                          ),
                          IconButton(
                            icon: const Icon(Icons.sort),
                            iconSize: 30,
                            color: Colors.black,
                            onPressed: () => {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 20,
                  bottom: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        hotel['name'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: 15,
                            color: Colors.white70,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            hotel['address'],
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Positioned(
                  right: 20,
                  bottom: 20,
                  child: Icon(
                    Icons.location_on,
                    color: Colors.white70,
                    size: 25,
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 10, bottom: 15),
                itemCount: hotel['activities']?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  Map<String, dynamic> activity = hotel['activities'][index];
                  return Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(40, 5, 20, 5),
                        height: 170,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(100, 20, 20, 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 120,
                                    child: Text(
                                      activity['name'] ?? 'No name available',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        '\$${activity['price'] ?? 'N/A'}',
                                        style: const TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const Text(
                                        'per night',
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Text(
                                activity['type'] ?? 'No type available',
                                style: const TextStyle(color: Colors.grey),
                              ),
                              _buildRatingStars(activity['rating'] ?? 0),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.access_time,
                                    size: 15,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    activity['startTimes']?.join(' - ') ??
                                        'No start times available',
                                    style: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 20,
                        top: 15,
                        bottom: 15,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image(
                            width: 110,
                            image: AssetImage(activity['imageUrl'] ??
                                'images/placeholder.jpg'),
                            fit: BoxFit.cover,
                          ),
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

  Text _buildRatingStars(int rating) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += '⭐ ';
    }
    stars.trim();
    return Text(stars);
  }
}
