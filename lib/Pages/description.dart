import 'package:flutter/material.dart';
import 'package:movieapp/text.dart';

import 'home.dart';

class Description extends StatelessWidget {
  final String name, description, bannerurl, posterurl, vote, launch_on;
  final bool adult;
  const Description({
    Key? key,
    required this.name,
    required this.description,
    required this.bannerurl,
    required this.posterurl,
    required this.vote,
    required this.launch_on,
    required this.adult,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      body: Container(
        child: ListView(children: [
          Container(
            height: 330,
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                            bannerurl,
                          ),
                          fit: BoxFit.cover),
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                    ),
                    // child: Image.network(
                    //   bannerurl,
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 120),
                  child: GestureDetector(
                    onTap: () {},
                    child: Center(
                      child: Column(
                        children: const [
                          Icon(
                            Icons.play_circle_fill,
                            color: Colors.orange,
                            size: 60,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  child: modified_text(text: '⭐ Average Rating - ' + vote),
                ),
                Positioned(
                  top: 10,
                  right: 5,
                  child: !adult
                      ? Chip(
                          backgroundColor: Colors.red,
                          label: Text(!adult ? 'adult' : ''),
                        )
                      : Container(),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Container(
              padding: EdgeInsets.all(10),
              child: modified_text(
                  text: name != null ? name : 'Not Loaded', size: 24)),
          Container(
              padding: EdgeInsets.only(left: 10),
              child:
                  modified_text(text: 'Releasing On - ' + launch_on, size: 14)),
          Row(
            children: [
              // Container(
              //   height: 200,
              //   width: 200,
              //   child: Image.network(posterurl),
              // ),
              Flexible(
                child: Container(
                    padding: EdgeInsets.all(10),
                    child: modified_text(text: description, size: 18)),
              ),
            ],
          )
        ]),
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Home()));
        },
        label: Text(
          'Back',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
