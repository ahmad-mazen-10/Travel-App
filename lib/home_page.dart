import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int selcetedIcon = 0;

  @override
  Widget build(BuildContext context) {
    List ListIcon = [
      FontAwesomeIcons.plane,
      FontAwesomeIcons.hotel,
      FontAwesomeIcons.taxi,
      FontAwesomeIcons.train,
      FontAwesomeIcons.motorcycle,
      FontAwesomeIcons.ship,
    ];
    return Scaffold(
        body: SafeArea(
      child: ListView(
        children: [
          const SizedBox(
            height: 40,
          ),
          const TellUs(),
          const SizedBox(height: 20),
          listofIcon(ListIcon),
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
                Text('All Data',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff3ebace))),
              ],
            ),
          ),
          Container(
              height: 300,
              color: Colors.amber[100],
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    margin:const EdgeInsets.all(15),
                    height: 100,
                    width: 210,
                    color: Colors.green,
                  );
                },
              )),
        ],
      ),
    ));
  }

  SizedBox listofIcon(List<dynamic> ListIcon) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: ListIcon.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              selcetedIcon = index;
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: selcetedIcon == index
                    ? const Color(0xffd8ecf1)
                    : const Color(0xffe7ebee),
              ),
              child: Icon(ListIcon[index],
                  color: selcetedIcon == index
                      ? const Color(0xff3ebace)
                      : const Color(0xffb4c1c4)),
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
      child: Text('Tell us about your destination in Egypt !!',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w600,
          )),
    );
  }
}
