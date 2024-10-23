import 'package:flutter/material.dart';

class BubbleChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage:
                  AssetImage('assets/lydia.jpeg'), // Gambar profil Lydia
              radius: 18,
            ),
            SizedBox(width: 10),
            Text('Lydia'),
          ],
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.call),
            onPressed: () {
              // Aksi ketika tombol telepon ditekan
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              // Aksi ketika tombol titik tiga ditekan
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/walpaper.webp'), // Ganti dengan gambar latar belakang
            fit: BoxFit.cover, // Mengatur gambar agar memenuhi layar
          ),
        ),
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  _buildReceivedMessage('tadi berangkat gimana?', '08:45'),
                  _buildSentMessage(
                      context, 'aman kok, agak macet dikit kamu gmn?', '08:47'),
                  _buildReceivedMessage('biasa jakarta macet banget!', '08:49'),
                  _buildSentMessage(
                      context, 'namanya juga ibu kota pasti macet', '08:50'),
                  _buildSentMessage(context, 'malem mau jalan ga?', '08:50'),
                  _buildReceivedMessage('boleh, mau kemana?', '08:51'),
                  _buildSentMessage(context, 'kamu maunya kemana?', '08:51'),
                  _buildReceivedMessage(
                      'restoran yang kemaren viral mau?', '08:52'),
                  _buildReceivedMessage('tapi disana rame sih', '08:52'),
                  _buildSentMessage(context,
                      'bebas seterah kamu aja rame jg gapapa', '08:55'),
                ],
              ),
            ),
            _buildMessageInput(),
          ],
        ),
      ),
    );
  }

  // Bubble untuk pesan yang diterima (warna putih)
  Widget _buildReceivedMessage(String message, String time) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 8), // Mengurangi jarak antara avatar dan bubble
        Flexible(
          child: Container(
            margin:
                EdgeInsets.only(bottom: 5), // Mengurangi margin antar bubble
            padding: EdgeInsets.symmetric(
                vertical: 8, horizontal: 12), // Mengurangi padding dalam bubble
            decoration: BoxDecoration(
              color: Colors.white, // Warna bubble diterima putih
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(message,
                    style: TextStyle(fontSize: 14)), // Ukuran font lebih kecil
                SizedBox(
                    height: 3), // Mengurangi jarak antara teks pesan dan waktu
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    time,
                    style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey[600]), // Ukuran waktu lebih kecil
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Bubble untuk pesan yang dikirim (warna hijau muda #D9FDD3)
  Widget _buildSentMessage(BuildContext context, String message, String time) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width *
              0.75, // Batas maksimal lebar bubble
        ),
        margin: EdgeInsets.only(bottom: 5), // Mengurangi margin antar bubble
        padding: EdgeInsets.symmetric(
            vertical: 8, horizontal: 12), // Mengurangi padding dalam bubble
        decoration: BoxDecoration(
          color: Color(0xFFD9FDD3), // Warna bubble terkirim hijau muda
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
            bottomLeft: Radius.circular(15),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(message,
                style: TextStyle(fontSize: 14)), // Ukuran font lebih kecil
            SizedBox(height: 3), // Mengurangi jarak antara teks pesan dan waktu
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                time,
                style: TextStyle(
                    fontSize: 10,
                    color: Colors.grey[600]), // Ukuran waktu lebih kecil
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Input pesan di bawah dengan ikon tautan, kamera, mic, dan tombol kirim
  Widget _buildMessageInput() {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.attach_file, color: Colors.grey[700]), // Ikon tautan
          onPressed: () {
            // Aksi untuk menambahkan tautan
          },
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Type a message...',
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        IconButton(
          icon: Icon(Icons.camera_alt, color: Colors.grey[700]), // Ikon kamera
          onPressed: () {
            // Aksi untuk membuka kamera
          },
        ),
        IconButton(
          icon: Icon(Icons.mic, color: Colors.grey[700]), // Ikon mic
          onPressed: () {
            // Aksi untuk merekam suara
          },
        ),
        IconButton(
          icon: Icon(Icons.send, color: Colors.green), // Ikon kirim pesan
          onPressed: () {
            // Aksi ketika tombol kirim ditekan
          },
        ),
      ],
    );
  }
}
