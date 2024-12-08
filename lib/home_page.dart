import 'package:flutter/material.dart';
import 'package:flutter_application_1/database.dart';
import 'package:flutter_application_1/destination_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int selectedIcon = 0;

  @override
  Widget build(BuildContext context) {
    List<IconData> listIcon = [
      FontAwesomeIcons.plane,
      FontAwesomeIcons.hotel,
      FontAwesomeIcons.taxi,
      FontAwesomeIcons.train,
      FontAwesomeIcons.motorcycle,
      FontAwesomeIcons.ship,
    ];

    return Scaffold(
      backgroundColor: const Color(0xfff3f5f7),
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 40),
            const TellUs(),
            const SizedBox(height: 20),
            listOfIcons(listIcon),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Top Destinations',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'All Data',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff3ebace),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: destinations.length,
                itemBuilder: (context, index) {
                  final destination = destinations[index];
                  return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                          return DestinationScreen(dest: destination, activities: destination['activities'] ?? []);
                        }));
                      },
                      child: DestinationCard(destination: destination));
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Exclusive Hotels',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'All Data',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff3ebace),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: hotels.length,
                itemBuilder: (context, index) {
                  final hotel = hotels[index];
                  return HotelCard(hotel: hotel);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox listOfIcons(List<IconData> listIcon) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: listIcon.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIcon = index;
              });
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: selectedIcon == index
                    ? const Color(0xffd8ecf1)
                    : const Color(0xffe7ebee),
              ),
              child: Icon(
                listIcon[index],
                color: selectedIcon == index
                    ? const Color(0xff3ebace)
                    : const Color(0xffb4c1c4),
              ),
            ),
          );
        },
      ),
    );
  }
}

class TellUs extends StatelessWidget {
  const TellUs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 10, right: 100),
      child: Text(
        'Tell us about your destinations in Egypt!!',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class DestinationCard extends StatelessWidget {
  final Map<String, dynamic> destination;

  const DestinationCard({required this.destination});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15, bottom: 15, left: 7, right: 7),
      height: 100,
      width: 210,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            bottom: 5,
            child: Container(
              width: 200,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 40, top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${destination['activities']?.length ?? 0} Activities',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      destination['description'] ?? 'No description available',
                      style: const TextStyle(color: Colors.grey),
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 180,
            width: 180,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black54,
                      offset: Offset(4, 4),
                      blurRadius: 10),
                  BoxShadow(
                      color: Colors.black54,
                      offset: Offset(4, 4),
                      blurRadius: 10),
                ],
                color: Colors.white),
          ),
          Hero(
            tag: destination['imageUrl'],
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(
                width: 180,
                height: 180,
                fit: BoxFit.cover,
                image: AssetImage(destination['imageUrl'] ?? 'images/placeholder.jpg'), // Added a placeholder
              ),
            ),
          ),
          Positioned(
            top: 120,
            left: 15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: Colors.white,
                    ),
                    Text(
                      destination['city'] ?? 'Unknown City',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.location_searching,
                      color: Colors.white,
                    ),
                    Text(
                      destination['country'] ?? 'Unknown Country',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HotelCard extends StatelessWidget {
  final Map<String, dynamic> hotel;

  const HotelCard({required this.hotel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15, bottom: 15, left: 7, right: 7),
      height: 100,
      width: 210,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            bottom: 5,
            child: Container(
              width: 200,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      hotel['name'] ?? 'No name available',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      hotel['address'] ?? 'No address available',
                      style: const TextStyle(color: Colors.grey),
                      maxLines: 2,
                    ),
                    Text(
                      '\$${hotel['price']?.toString() ?? 'N/A'} / night',
                      style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 180,
            width: 180,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black54,
                      offset: Offset(4, 4),
                      blurRadius: 10),
                  BoxShadow(
                      color: Colors.black54,
                      offset: Offset(4, 4),
                      blurRadius: 10),
                ],
                color: Colors.white),
          ),
          Hero(
            tag: hotel['imageUrl'],
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(
                width: 180,
                height: 180,
                fit: BoxFit.cover,
                image: AssetImage(hotel['imageUrl'] ?? 'images/placeholder.jpg'), // Added a placeholder
              ),
            ),
          ),
          Positioned(
            top: 120,
            left: 15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: Colors.white,
                    ),
                    Text(
                      hotel['name'] ?? 'Unknown Hotel',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TellUsWidget extends StatelessWidget {
  const TellUsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 10, right: 100),
      child: Text(
        'Tell us about your destinations in Egypt!!',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
