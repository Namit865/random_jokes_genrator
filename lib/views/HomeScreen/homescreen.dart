  import 'package:flutter/material.dart';
  import 'package:provider/provider.dart';
  import 'package:random_jokes_genrator/views/Helper/api_helper.dart';
  import 'package:random_jokes_genrator/views/Helper/provider_value.dart';

  class HomeScreen extends StatefulWidget {
    const HomeScreen({Key? key}) : super(key: key);

    @override
    _HomeScreenState createState() => _HomeScreenState();
  }

  class _HomeScreenState extends State<HomeScreen> {

    @override
    Widget build(BuildContext context) {
      int currentIndex =
          Provider.of<indexProvider>(context).variable.CurrentIndex;

      Widget currentScreen;
      String appBarTitle = '';
      switch (currentIndex) {
        case 0:
          currentScreen = HomeContent();
          appBarTitle = 'Home';
          break;
        case 1:
          currentScreen = CategoriesContent();
          appBarTitle = 'Categories';
          break;
        case 2:
          currentScreen = FavoritesContent();
          appBarTitle = 'Favourite';
          break;
        default:
          currentScreen = HomeContent();
      }

      return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffAC1F49),
          title: Text(appBarTitle),
        ),
        drawer: _buildDrawer(),
        body: currentScreen,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xffAC1F49),
          currentIndex: currentIndex,
          onTap: (index) {
            Provider.of<indexProvider>(context, listen: false).updateIndex(index);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorites',
            ),
          ],
        ),
      );
    }

    Widget _buildDrawer() {
      return Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/drawer.jpg"),
                  opacity: 0.4,
                ),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: Image.asset("assets/images/jokes.jpg"),
                    title: Text(
                      "Jokes App",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "Find all Your jokes here",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.favorite_border),
              title: const Text(
                'My Favourite',
                style: TextStyle(fontSize: 18),
              ),
              onTap: () {},
            ),
          ],
        ),
      );
    }
  }

  class HomeContent extends StatefulWidget {
    const HomeContent({super.key});

    @override
    State<HomeContent> createState() => _HomeContentState();
  }

  class _HomeContentState extends State<HomeContent> {
    Map<String, dynamic> jokes = {};
    @override
  void initState() {
    super.initState();
    fetchjokes();
  }

    fetchjokes() async {
      final data = await ApiService.fetchJokes();
      jokes = data;
      setState(() {});
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/drawer.jpg"), fit: BoxFit.fill),
          ),
          child: Center(
            child: Container(
              height: 200,
              width: 300,
              color: const Color.fromRGBO(255, 255, 255, 0.4),
              child: jokes.isNotEmpty
                  ? Opacity(
                opacity: 0.8,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: Text(
                      jokes['value'],
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              )
                  : Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        ),
      );
    }
  }

  class FavoritesContent extends StatefulWidget {
    const FavoritesContent({super.key});

    @override
    State<FavoritesContent> createState() => _FavoritesContentState();
  }

  class _FavoritesContentState extends State<FavoritesContent> {
    @override
    Widget build(BuildContext context) {
      return Scaffold();
    }
  }

  class CategoriesContent extends StatefulWidget {
    const CategoriesContent({super.key});

    @override
    State<CategoriesContent> createState() => _CategoriesContentState();
  }

  class _CategoriesContentState extends State<CategoriesContent> {
    @override
    Widget build(BuildContext context) {
      return Scaffold();
    }
  }
