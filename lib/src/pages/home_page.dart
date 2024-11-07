import 'package:flutter/material.dart';
import 'package:tienda_ropa/src/Widgets/best_rating.dart';
import 'package:tienda_ropa/src/Widgets/best_seller.dart';
import 'package:tienda_ropa/src/Widgets/categories.dart';
import 'package:tienda_ropa/src/Widgets/promo_banner.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _paginaActual = 0;

  void _navigateToPromoBanner() {
    setState(() {
      _paginaActual = 1; // Assuming PromoBanner is at index 1 in IndexedStack
    });
    Navigator.pop(context); // Close the drawer
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Bienvenido a la Tienda",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: IndexedStack(
        index: _paginaActual,
        children: [
          ListView(
            children: const [
              PromoBanner(),
              Categories(),
              BestSeller(),
              BestRating(),
            ],
          ),
          ListView(
            children: const [
              PromoBanner(),
            ],
          ),
          ListView(
            children: const [
              BestSeller(),
            ],
          ),
          ListView(
            children: const [
              BestRating(),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _paginaActual = index;
          });
        },
        currentIndex: _paginaActual,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Configuración",
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.sell),
              label: "Venta",
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Tú",
              backgroundColor: Colors.black),
        ],
      ),
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 6, 14, 20),
        width: 250,
        shape: const Border(right: BorderSide(color: Colors.red, width: 2.0)),
        child: ListView(
          children: [
            const DrawerHeader(
              child: Text(
                "Bienvenido a la tienda",
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              title:
                  const Text("Item 1", style: TextStyle(color: Colors.white)),
              onTap: _navigateToPromoBanner,
            ),
            const ListTile(
              title: Text("Item 2", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
