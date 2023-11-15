import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Belanja',
      theme: ThemeData(
        primarySwatch: Colors.red, 
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
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            print('Tombol Back Ditekan');
          },
        ),
        title: Text('Godrej'), 
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print('Tombol Search Ditekan');
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              print('Tombol Keranjang Ditekan');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            padding: EdgeInsets.all(16.0),
            color: Colors.grey[200], 
            child: Row(
              children: [
                Container(
                  width: 80.0, 
                  height: 80.0, 
                  decoration: BoxDecoration(
                    color: Colors.blue, 
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  child: Icon(Icons.shop, color: Colors.white),
                ),
                SizedBox(width: 16.0), 
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
                    Row(
                      children: [
                        Icon(Icons.person),
                        SizedBox(width: 4.0),
                        Text('5.441 Pengikut'),
                      ],
                    ),
                    SizedBox(height: 4.0),
                    Row(
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {
                            print('Tombol Mengikuti Ditekan');
                          },
                          icon: Icon(Icons.person_add),
                          label: Text('Mengikuti'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green, 
                          ),
                        ),
                        SizedBox(width: 8.0),
                        IconButton(
                          icon: Icon(Icons.share),
                          onPressed: () {
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

                GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, // Jumlah kolom dalam grid
                    crossAxisSpacing: 8.0, // Spasi antar kolom
                    mainAxisSpacing: 8.0, // Spasi antar baris
                  ),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
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

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildTransparentBlock('Promosi'),
              buildTransparentBlock('Nama Produk'),
              buildTransparentBlock('Terlaris'),
            ],
          ),

          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(items[index]),
                  onTap: () {
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
