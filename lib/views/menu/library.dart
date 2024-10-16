import 'package:flutter/material.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Library'),
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.orange, Colors.deepOrangeAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.orange],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.8,
          ),
          itemCount: bookList.length, // Jumlah buku
          itemBuilder: (context, index) {
            return _buildBookItem(bookList[index]['title']!, bookList[index]['imageUrl']!);
          },
        ),
      ),
    );
  }

  Widget _buildBookItem(String title, String imageUrl) {
    return GestureDetector(
      onTap: () {
        // TODO: Implement book details
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 8,
        shadowColor: Colors.orange.withOpacity(0.4),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Bagian gambar buku
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                    image: DecorationImage(
                      image: NetworkImage(imageUrl), // Gambar buku dari internet
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              // Bagian informasi buku
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.orange,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Author Name', // Ganti dengan nama penulis asli jika ada
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Daftar buku dengan gambar yang diambil dari internet
final List<Map<String, String>> bookList = [
  {
    'title': 'Clean Code',
    'imageUrl': 'https://m.media-amazon.com/images/I/41xShlnTZTL._SX258_BO1,204,203,200_.jpg',
  },
  {
    'title': 'The Pragmatic Programmer',
    'imageUrl': 'https://m.media-amazon.com/images/I/518FqJvR9aL._SX218_BO1,204,203,200_QL40_FMwebp_.jpg',
  },
  {
    'title': 'You Don\'t Know JS',
    'imageUrl': 'https://m.media-amazon.com/images/I/51oXKWrcYYL._SX331_BO1,204,203,200_.jpg',
  },
  {
    'title': 'Refactoring',
    'imageUrl': 'https://m.media-amazon.com/images/I/41xShlnTZTL._SX258_BO1,204,203,200_.jpg',
  },
  {
    'title': 'Design Patterns',
    'imageUrl': 'https://m.media-amazon.com/images/I/51kM9-BFGPL._SX258_BO1,204,203,200_.jpg',
  },
  {
    'title': 'Introduction to Algorithms',
    'imageUrl': 'https://m.media-amazon.com/images/I/41SnYXaFrFL._SX258_BO1,204,203,200_.jpg',
  },
  {
    'title': 'Eloquent JavaScript',
    'imageUrl': 'https://m.media-amazon.com/images/I/51N-4eOslTL._SX377_BO1,204,203,200_.jpg',
  },
  {
    'title': 'Cracking the Coding Interview',
    'imageUrl': 'https://m.media-amazon.com/images/I/61tseOQ8VCL.jpg',
  },
  {
    'title': 'Code Complete',
    'imageUrl': 'https://m.media-amazon.com/images/I/41HXiIoxM2L._SX396_BO1,204,203,200_.jpg',
  },
  {
    'title': 'The Art of Computer Programming',
    'imageUrl': 'https://m.media-amazon.com/images/I/41xTHRkeLpL._SX331_BO1,204,203,200_.jpg',
  },
];
