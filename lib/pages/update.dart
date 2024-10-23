import 'package:flutter/material.dart';

class UpdatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Menghilangkan ikon back
        backgroundColor: Colors.white,
        title: Text(
          'Status',
          style: TextStyle(color: Colors.black), // Warna teks AppBar
        ),
      ),
      body: ListView(
        children: [
          _buildMyStatusSection(),
          Divider(), // Garis pemisah
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Recent updates',
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _buildStatusListItem('Ziva Magnolya', '09:30', 'assets/ziva.jpeg'),
          _buildStatusListItem(
              'Nadine Abbygail', '09:15', 'assets/nadine.jpeg'),
          _buildStatusListItem('Pak AP', '08:40', 'assets/pakap.jpeg'),

          _buildStatusListItem(
              'Mark Zuckerberg', 'Kemarin', 'assets/mark.jpeg'),
          Divider(), // Garis pemisah
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Viewed updates',
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _buildStatusListItem('Limbad', 'Kemarin', 'assets/limbad.jpeg'),
          _buildStatusListItem(
              'Donald Trump', '21/10/2024', 'assets/donald.jpeg'),
          _buildStatusListItem('Kramm', '08:10', 'assets/kramm.jpeg'),
          _buildStatusListItem('Adele Laurie', 'Kemarin', 'assets/adele.jpeg'),
          _buildStatusListItem('Evos WORLD', 'Kemarin', 'assets/evos.jpg'),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'editStatus',
            onPressed: () {
              print("Edit status pressed");
            },
            backgroundColor: Colors.grey[200], // Warna latar tombol edit
            child: Icon(Icons.edit, color: Colors.blueGrey), // Ikon edit
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            heroTag: 'cameraStatus',
            onPressed: () {
              print("Add status pressed");
            },
            backgroundColor: Colors.green, // Warna tombol tambah status
            child: Icon(Icons.camera_alt, color: Colors.white), // Ikon kamera
          ),
        ],
      ),
    );
  }

  // Widget untuk menampilkan bagian "My Status"
  Widget _buildMyStatusSection() {
    return ListTile(
      leading: Stack(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/renji.jpg'), // Gambar profil
            radius: 28,
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: CircleAvatar(
              radius: 10,
              backgroundColor: Colors.green,
              child:
                  Icon(Icons.add, size: 15, color: Colors.white), // Ikon tambah
            ),
          ),
        ],
      ),
      title: Text(
        'My Status',
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      ),
      subtitle: Text('Tap to add status update'),
      onTap: () {
        print("My Status tapped");
      },
    );
  }

  // Widget untuk membuat item status di daftar
  Widget _buildStatusListItem(String name, String time, String image) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(image), // Gambar profil status
        radius: 28,
      ),
      title: Text(
        name,
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      ),
      subtitle: Text(time),
      onTap: () {
        print("$name's status tapped");
      },
    );
  }
}
