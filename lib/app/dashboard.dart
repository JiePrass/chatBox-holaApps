import 'package:flutter/material.dart';
import '../pages/chat.dart';
import '../pages/update.dart';
import '../pages/community.dart';
import '../pages/calls.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    ChatPage(),
    UpdatePage(),
    CommunityPage(),
    CallsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.0), // Tinggi AppBar
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), // Warna bayangan
                spreadRadius: 2, // Jarak spread bayangan
                blurRadius: 5, // Blur radius bayangan
                offset: Offset(0, 1), // Posisi bayangan
              ),
            ],
          ),
          child: AppBar(
            title: Text(
              'HolaApps',
              style: TextStyle(
                color: Colors.green[800],
                fontWeight: FontWeight.w500,
              ),
              // Ubah warna judul
            ), // Remove elevation for a flat look
            automaticallyImplyLeading: false,
            backgroundColor:
                Colors.transparent, // Buat background AppBar transparan
            elevation: 0, // Matikan elevation asli
            actions: [
              IconButton(
                icon: Icon(Icons.camera_alt_outlined), // Ikon kamera
                onPressed: () {
                  // Aksi untuk tombol kamera
                  print("Camera pressed");
                },
              ),
              IconButton(
                icon: Icon(Icons.search), // Ikon pencarian
                onPressed: () {
                  // Aksi untuk tombol pencarian
                  print("Search pressed");
                },
              ),
              IconButton(
                icon: Icon(Icons.more_vert), // Ikon titik tiga
                onPressed: () {
                  // Aksi untuk lebih banyak opsi
                  print("More options pressed");
                },
              ),
            ],
          ),
        ),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.green[800],
        unselectedItemColor: Colors.green[400],
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        items: [
          _buildNavigationBarItem(0, Icons.chat_outlined, Icons.chat, 'Chat'),
          _buildNavigationBarItem(
              1, Icons.update_outlined, Icons.update, 'Update'),
          _buildNavigationBarItem(
              2, Icons.group_outlined, Icons.group, 'Community'),
          _buildNavigationBarItem(3, Icons.call_outlined, Icons.call, 'Calls'),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildNavigationBarItem(
      int index, IconData unselectedIcon, IconData selectedIcon, String label) {
    return BottomNavigationBarItem(
      icon: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            width: _currentIndex == index ? 50.0 : 0.0,
            height: 30.0,
            decoration: BoxDecoration(
              color: _currentIndex == index
                  ? Colors.green[100]
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          Icon(
            _currentIndex == index ? selectedIcon : unselectedIcon,
            color:
                _currentIndex == index ? Colors.green[800] : Colors.green[400],
          ),
        ],
      ),
      label: label,
    );
  }
}
