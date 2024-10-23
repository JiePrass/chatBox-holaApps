import 'package:flutter/material.dart';
import '../pages/bubble.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  String _filter = 'Semua'; // Filter default

  // Contoh data chat
  List<Map<String, String>> chatData = [
    {
      'name': 'Ziva Magnolya',
      'profile': 'assets/ziva.jpeg',
      'message': 'Apakah kamu sudah siap?',
      'time': '09:30',
      'status': 'unread'
    },
    {
      'name': 'Nadine Abbygail',
      'profile': 'assets/nadine.jpeg',
      'message': 'Bagaimana dengan tugas kita?',
      'time': '09:15',
      'status': 'unread'
    },
    {
      'name': 'Limbad',
      'profile': 'assets/limbad.jpeg',
      'message': 'bruh grr grrr',
      'time': '08:50',
      'status': 'unread'
    },
    {
      'name': 'Pak AP',
      'profile': 'assets/pakap.jpeg',
      'message': 'mau join?',
      'time': '08:40',
      'status': 'unread'
    },
    {
      'name': 'Kramm',
      'profile': 'assets/kramm.jpeg',
      'message': 'info spar brok!',
      'time': '08:10',
      'status': 'read'
    },
    {
      'name': 'Adele Laurie',
      'profile': 'assets/adele.jpeg',
      'message': 'Terima kasih atas bantuannya!',
      'time': 'Kemarin',
      'status': 'read'
    },
    {
      'name': 'Evos WORLD',
      'profile': 'assets/evos.jpeg',
      'message': 'Oura: Spar kapan bro?',
      'time': 'Kemarin',
      'status': 'read'
    },
    {
      'name': 'Mark Zuckerberg',
      'profile': 'assets/mark.jpeg',
      'message': 'revisi ya',
      'time': 'Kemarin',
      'status': 'read'
    },
    {
      'name': 'Koh Garry Ongko',
      'profile': 'assets/ziva.jpeg',
      'message': 'gaji naik ya koh',
      'time': 'Kemarin',
      'status': 'read'
    },
    {
      'name': 'Donald Trump',
      'profile': 'assets/ziva.jpeg',
      'message': 'nongki kapan nih',
      'time': '21/10/2024',
      'status': 'read'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Menghilangkan ikon panah
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start, // Rata kiri
          children: [
            // Tombol filter
            _buildFilterButton('Semua'),
            _buildFilterButton('Belum Dibaca'),
            _buildFilterButton('Favorit'),
          ],
        ),
      ),
      body: ListView(
        children: _buildChatList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BubbleChatPage()),
          );
        },

        backgroundColor: Colors.green, // Warna tombol yang mirip WhatsApp
        child: Icon(Icons.chat, color: Colors.white), // Ikon chat di tombol
      ),
      backgroundColor: Colors.white, // Warna latar belakang Scaffold
    );
  }

  // Fungsi untuk membuat tombol filter
  Widget _buildFilterButton(String label) {
    // Cek apakah tombol saat ini aktif
    bool isActive = _filter == label;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.0), // Spasi antar tombol
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isActive
              ? Colors.green[100]
              : Colors.grey[200], // Warna latar belakang
          foregroundColor: Colors.black, // Warna teks
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24), // Sudut tombol
          ),
        ),
        child: Text(label), // Teks tombol
        onPressed: () {
          setState(() {
            _filter = label; // Mengubah filter menjadi label yang dipilih
          });
        },
      ),
    );
  }

  List<Widget> _buildChatList() {
    // Menyaring chat berdasarkan filter yang dipilih
    List<Map<String, String>> filteredChats = chatData;

    if (_filter == 'Belum Dibaca') {
      filteredChats =
          chatData.where((chat) => chat['status'] == 'unread').toList();
    }

    return filteredChats.map((chat) {
      return ChatItem(
        profileImage: chat['profile']!,
        name: chat['name']!,
        message: chat['message']!,
        time: chat['time']!,
      );
    }).toList();
  }
}

class ChatItem extends StatelessWidget {
  final String profileImage;
  final String name;
  final String message;
  final String time;

  ChatItem({
    required this.profileImage,
    required this.name,
    required this.message,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(profileImage), // Gambar profil
        radius: 24,
      ),
      title: Text(
        name,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black, // Warna teks nama
        ),
      ),
      subtitle: Text(
        message,
        style: TextStyle(
          color: Colors.black87, // Warna teks pesan
        ),
      ),
      trailing: Text(
        time,
        style: TextStyle(color: Colors.grey), // Warna teks waktu
      ),
    );
  }
}
