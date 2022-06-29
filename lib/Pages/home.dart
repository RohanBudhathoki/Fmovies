import 'package:flutter/material.dart';
import 'package:movieapp/Pages/NavigationDrawer.dart';
import 'package:movieapp/Pages/toprated.dart';

import 'package:tmdb_api/tmdb_api.dart';

import 'package:movieapp/Pages/trending.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingmovis = [];
  List topratedmovies = [];
  List? tv = [];
  List action = [];
  bool? isadultl;
  String? adult;

  final String apikey = 'c9b7ab5d41c8e4f99deff9a7b81cd25d';
  final readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjOWI3YWI1ZDQxYzhlNGY5OWRlZmY5YTdiODFjZDI1ZCIsInN1YiI6IjYxYjVkYmMyYTNkMDI3MDAxZDJkOWI2NyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.F51NgJN2-h1SuOLBhGR6yB9-AK6MB3htTxgIqjji2bE';

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apikey, readaccesstoken),
        logConfig: ConfigLogger(showLogs: true, showErrorLogs: true));

    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvseries = await tmdbWithCustomLogs.v3.tv.getPouplar();
    Map genreresult = await tmdbWithCustomLogs.v3.movies.getNowPlaying();

    setState(() {
      trendingmovis = trendingresult['results'];
      topratedmovies = topratedresult['results'];
      tv = genreresult['results'];

      // action = genreresult['results'];

      // tv = tvseries['result'];
    });

    print(tv);
  }

  void search() {
    setState(() {});
  }

  @override
  void initState() {
    loadmovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: PreferredSize(
          child: AppBar(
            backgroundColor: Colors.black,
            elevation: 0,
            title: Text(
              'Fmovies',
              style: TextStyle(color: Colors.cyan.shade400),
            ),
            centerTitle: true,
            actions: <Widget>[
              IconButton(icon: const Icon(Icons.search), onPressed: () {}),
              const CircleAvatar(
                backgroundImage: AssetImage('asset/c.jpg'),
              )
            ],
          ),
          preferredSize: const Size.fromHeight(35)),
      body: Container(
        decoration: BoxDecoration(
          image: const DecorationImage(
              image: AssetImage('asset/2.jpg'), fit: BoxFit.cover),
          border: Border.all(
            color: Colors.black,
            width: 8,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
          children: [
            Container(
              height: 40,
              width: double.infinity,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Chip(
                      label: Text(
                        'All',
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.orange,
                      padding: EdgeInsets.only(left: 12, right: 12),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Chip(
                      label: Text(
                        'Action',
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.grey,
                      padding: EdgeInsets.only(left: 12, right: 12),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Chip(
                      label: Text(
                        'Comedy',
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.grey,
                      padding: EdgeInsets.only(left: 12, right: 12),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Chip(
                      label: Text(
                        'Adventure',
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.grey,
                      padding: EdgeInsets.only(left: 12, right: 12),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Chip(
                      label: Text(
                        'Mystry',
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.grey,
                      padding: EdgeInsets.only(left: 12, right: 12),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: TrendingMovies(
                trending: trendingmovis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(6, 10, 5, 0),
              child: TopRatedMovie(toprated: topratedmovies),
            ),
          ],
        ),
      ),
    );
  }
}
