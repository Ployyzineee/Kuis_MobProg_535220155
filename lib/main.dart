import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Belanja',
      theme: ThemeData(
        primarySwatch: Colors.red, // Warna utama AppBar
      ),
      home: ShoppingApp(),
    );
  }
}

class ShoppingApp extends StatefulWidget {
  @override
  _ShoppingAppState createState() => _ShoppingAppState();
}

class _ShoppingAppState extends State<ShoppingApp> {
  List<String> items = ['Produk A', 'Produk B', 'Produk C'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Tombol back dan judul AppBar
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Tambahkan aksi saat tombol back ditekan
            print('Tombol Back Ditekan');
          },
        ),
        title: Text('Godrej'), // Judul AppBar
        actions: [
          // Ikon Search dan Keranjang
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Tambahkan aksi saat tombol search ditekan
              print('Tombol Search Ditekan');
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Tambahkan aksi saat tombol keranjang ditekan
              print('Tombol Keranjang Ditekan');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Blok persegi panjang di bawah AppBar
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            padding: EdgeInsets.all(16.0),
            color: Colors.grey[200], // Warna latar belakang blok
            child: Row(
              children: [
                // Logo di sebelah kanan
                Container(
                  width: 80.0, // Lebar logo
                  height: 80.0, // Tinggi logo
                  decoration: BoxDecoration(
                    color: Colors.blue, // Warna latar belakang logo
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  // Ganti dengan logo yang sesuai
                  child: Icon(Icons.shop, color: Colors.white),
                ),
                SizedBox(width: 16.0), // Spasi antara logo dan teks
                // Nama "Godrej"
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Godrej',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    // Pengikut dan ikon orang di sebelah kiri
                    Row(
                      children: [
                        Icon(Icons.person),
                        SizedBox(width: 4.0),
                        Text('5.441 Pengikut'),
                      ],
                    ),
                    SizedBox(height: 4.0),
                    // Tombol Mengikuti dan ikon share
                    Row(
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {
                            // Tambahkan aksi saat tombol Mengikuti ditekan
                            print('Tombol Mengikuti Ditekan');
                          },
                          icon: Icon(Icons.person_add),
                          label: Text('Mengikuti'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green, // Warna tombol Mengikuti
                          ),
                        ),
                        SizedBox(width: 8.0),
                        IconButton(
                          icon: Icon(Icons.share),
                          onPressed: () {
                            // Tambahkan aksi saat ikon share ditekan
                            print('Ikon Share Ditekan');
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Judul Kategori
          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Belanja berdasarkan kategori',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(height: 8.0),

                // 4 Grid Kategori
                GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, // Jumlah kolom dalam grid
                    crossAxisSpacing: 8.0, // Spasi antar kolom
                    mainAxisSpacing: 8.0, // Spasi antar baris
                  ),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    // Ganti dengan widget atau kode sesuai kebutuhan Anda
                    return GestureDetector(
                      onTap: () {
                        // Tambahkan aksi saat kategori diklik
                        print('Kategori $index diklik');
                      },
                      child: Container(
                        color: Colors.grey[300],
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.category, size: 40.0),
                            SizedBox(height: 8.0),
                            Text('Kategori $index'),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),

          // Blok Transparan "Promosi", "Nama Produk", dan "Terlaris"
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildTransparentBlock('Promosi'),
              buildTransparentBlock('Nama Produk'),
              buildTransparentBlock('Terlaris'),
            ],
          ),

          // Daftar Produk
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(items[index]),
                  onTap: () {
                    // Implementasi tindakan ketika item diklik
                    showItemDetails(context, items[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTransparentBlock(String title) {
    return GestureDetector(
      onTap: () {
        // Tambahkan aksi saat blok diklik
        print('Blok $title diklik');
      },
      child: Container(
        color: Colors.grey[200],
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(Icons.arrow_forward),
          ],
        ),
      ),
    );
  }

  void showItemDetails(BuildContext context, String itemName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Detail Produk'),
          content: Text('Detail untuk $itemName'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Tutup'),
            ),
          ],
        );
      },
    );
  }
}
