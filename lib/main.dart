import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'pages/FormRegis.dart';
import 'pages/profilPengguna.dart';
import 'pages/listkendaraan.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    WelcomeScreen(),
    RegistrasiPage(),
    ListKendaraan(),
    ProfilePage(),
    
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SIDATA APP',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey[800],
          title: Text(
            "SIDATA APP",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Stack(
          children: [
            Container(
              constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/images/bg.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(child: _pages[_selectedIndex]),
          ],
        ),
        bottomNavigationBar: ConvexAppBar(
          style: TabStyle.react,
          backgroundColor: Colors.blueGrey[800],
          items: [
            TabItem(icon: Icons.home, title: 'Beranda'),
            TabItem(icon: Icons.app_registration, title: 'Registrasi'),
            TabItem(icon: Icons.list, title: 'List Kendaraan'),
            TabItem(icon: Icons.person, title: 'Akun'),
          ],
          initialActiveIndex: 0,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      padding: EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.6),
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Selamat Datang',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Aplikasi SIDATA adalah penyedia layanan registrasi kendaraan secara online. Daftarkan kendaraan anda dan nikmati pelayanan kami.',
            style: TextStyle(fontSize: 18, color: Colors.white70),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
