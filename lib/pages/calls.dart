import 'package:flutter/material.dart';

class CallsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Mengatur latar belakang menjadi putih
      body: ListView(
        children: [
          // Bagian Favorit
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 0, 0),
          ),
          // Daftar Favorit
          _buildAddFavoriteTile(), // Tombol untuk menambah favorite
          _buildFavoriteListItem('Lydia', 'assets/lydia.jpeg'),
          // Bagian Terbaru
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 0, 0),
            child: Text(
              'Terbaru',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          // Daftar Panggilan Terbaru
          _buildCallListItem('Ziva Magnolya', '12:30 PM', 'Outgoing',
              'assets/ziva.jpeg', DateTime.now()),
          _buildCallListItem(
              'Nadine Abbygail',
              '11:32 AM',
              'Missed',
              'assets/nadine.jpeg',
              DateTime.now().subtract(Duration(minutes: 58))),
          _buildCallListItem(
              'Gebian',
              '10:15 AM',
              'Incoming',
              'assets/gebian.jpeg',
              DateTime.now().subtract(Duration(hours: 1, minutes: 15))),
          _buildCallListItem('Pak AP', '09:45 AM', 'Outgoing',
              'assets/pakap.jpeg', DateTime.now().subtract(Duration(hours: 2))),
          _buildCallListItem('Lydia', '08:15 AM', 'Missed', 'assets/lydia.jpeg',
              DateTime.now().subtract(Duration(hours: 3))),
          _buildCallListItem('Kramm', '07:30 AM', 'Incoming',
              'assets/kramm.jpeg', DateTime.now().subtract(Duration(hours: 4))),
          _buildCallListItem('Eve Adams', '06:00 AM', 'Outgoing',
              'assets/eve.jpg', DateTime.now().subtract(Duration(hours: 5))),
          _buildCallListItem('Frank Castle', '05:20 AM', 'Incoming',
              'assets/frank.jpg', DateTime.now().subtract(Duration(hours: 6))),
          _buildCallListItem('Grace Lee', '04:15 AM', 'Missed',
              'assets/grace.jpg', DateTime.now().subtract(Duration(hours: 7))),
          _buildCallListItem('Hannah Baker', '03:30 AM', 'Outgoing',
              'assets/hannah.jpg', DateTime.now().subtract(Duration(hours: 8))),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Aksi ketika tombol tambah panggilan di-klik
          print("Make a call pressed");
        },
        backgroundColor: Colors.green, // Warna tombol yang mirip WhatsApp
        child: Icon(Icons.call, color: Colors.white), // Ikon panggilan
      ),
    );
  }

  // Widget untuk membuat item favorit di daftar
  Widget _buildFavoriteListItem(String name, String image) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(image), // Gambar kontak
        radius: 28, // Radius untuk gambar
      ),
      title: Text(
        name,
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      ),
      trailing: Icon(Icons.phone, color: Colors.green), // Ikon telepon
      onTap: () {
        print("$name's favorite tapped");
      },
    );
  }

  // Widget untuk menambah favorite
  Widget _buildAddFavoriteTile() {
    return Container(
      height: 60, // Sesuaikan dengan tinggi item favorit
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.teal, // Avatar bergaya WhatsApp
          radius: 28, // Radius untuk ikon
          child: Icon(Icons.favorite,
              color: Colors.white,
              size: 28), // Ikon favorit dengan ukuran yang lebih besar
        ),
        title: Text('Add New Favorite'),
        trailing: Icon(Icons.add),
        onTap: () {
          // Logika untuk menambah favorite baru
          print("Add New Favorite tapped");
        },
      ),
    );
  }

  // Widget untuk membuat item panggilan di daftar
  Widget _buildCallListItem(String name, String time, String status,
      String image, DateTime callDateTime) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(image), // Gambar kontak
          radius: 28,
        ),
        title: Text(
          name,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _formatCallTime(callDateTime, time),
            Text(
              status,
              style: TextStyle(
                color: status == 'Missed'
                    ? Colors.red
                    : Colors.green, // Warna status
              ),
            ),
          ],
        ),
        trailing: Icon(Icons.phone, color: Colors.green), // Ikon telepon
        onTap: () {
          print("$name's call tapped");
        },
      ),
    );
  }

  // Fungsi untuk memformat waktu panggilan dengan keterangan hari atau tanggal
  Widget _formatCallTime(DateTime callDateTime, String time) {
    String formattedTime;
    String dayOrDate;

    if (callDateTime.isToday()) {
      dayOrDate = 'Hari ini';
    } else if (callDateTime.isYesterday()) {
      dayOrDate = 'Kemarin';
    } else {
      dayOrDate = '${callDateTime.day} ${_getMonthName(callDateTime.month)}';
    }

    formattedTime = '$dayOrDate $time';
    return Text(formattedTime);
  }

  // Fungsi untuk mendapatkan nama bulan berdasarkan nomor bulan
  String _getMonthName(int month) {
    const List<String> monthNames = [
      '',
      'Januari',
      'Februari',
      'Maret',
      'April',
      'Mei',
      'Juni',
      'Juli',
      'Agustus',
      'September',
      'Oktober',
      'November',
      'Desember',
    ];
    return monthNames[month];
  }
}

// Ekstensi untuk DateTime untuk mengecek apakah hari ini atau kemarin
extension DateTimeExtensions on DateTime {
  bool isToday() {
    final now = DateTime.now();
    return this.year == now.year &&
        this.month == now.month &&
        this.day == now.day;
  }

  bool isYesterday() {
    final yesterday = DateTime.now().subtract(Duration(days: 1));
    return this.year == yesterday.year &&
        this.month == yesterday.month &&
        this.day == yesterday.day;
  }
}
