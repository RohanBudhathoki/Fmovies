import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:movieapp/Pages/description.dart';
import 'package:movieapp/Pages/home.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();

    homepage();
  }

  homepage() async {
    await Future.delayed(Duration(seconds: 2), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Home()));
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) => Description(
    //               name: trending[index]['title'],
    //               bannerurl:
    //                   'https://image.tmdb.org/t/p/w500' +
    //                       trending[index]['backdrop_path'],
    //               posterurl:
    //                   'https://image.tmdb.org/t/p/w500' +
    //                       trending[index]['poster_path'],
    //               description: trending[index]['overview'],
    //               vote: trending[index]['vote_average']
    //                   .toString(),
    //               launch_on: trending[index]
    //                   ['release_date'],
    //             )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: SpinKitFadingCube(
            color: Colors.white,
            size: 85,
          ),
        ));
  }
}
