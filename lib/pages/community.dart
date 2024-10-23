import 'package:flutter/material.dart';

class CommunityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Menghilangkan ikon back
        backgroundColor: Colors.white,
        title: Text(
          'Community',
          style: TextStyle(color: Colors.black), // Warna teks AppBar
        ),
      ),
      body: Container(
        color: Colors.white, // Mengubah background menjadi putih
        child: ListView(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.teal, // Avatar bergaya WhatsApp
                child: Icon(Icons.group, color: Colors.white),
              ),
              title: Text('Add New Community'),
              trailing: Icon(Icons.add),
              onTap: () {
                // Buat komunitas baru
              },
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/smkn4.jpeg'), // Gambar grup
              ),
              title: Text('Pusat Informasi SMKN4'),
              subtitle: Text('Rachman Omen: Mohon u...'),
              trailing: Text('03/10/24'),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/php.png'), // Gambar grup
              ),
              title: Text('PHP ESPORT'),
              subtitle: Text('hedar mewing : kumpul di...'),
              trailing: Text('21/10/24'),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/pplg3.png'), // Gambar grup
              ),
              title: Text('XI PPLG 3'),
              subtitle: Text('risya : sini udah ada guru'),
              trailing: Text('15/10/24'),
            ),
            // Tambahkan lebih banyak ListTile untuk komunitas lainnya
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Tindakan untuk membuat komunitas baru
        },
        backgroundColor: Colors.teal, // Warna tombol tetap sama
        child: Icon(Icons.group_add),
      ),
    );
  }
}
