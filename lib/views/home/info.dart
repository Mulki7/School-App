import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  List<dynamic> infoList = [];
  final TextEditingController _judulController = TextEditingController();
  final TextEditingController _isiController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchInfo();
  }

  Future<void> fetchInfo() async {
    final response = await http.get(Uri.parse('https://hayy.my.id/api-mulki/info.php'));
    if (response.statusCode == 200) {
      setState(() {
        infoList = json.decode(response.body);
      });
    } else {
      throw Exception('Gagal memuat data informasi');
    }
  }

  Future<void> addInfo() async {
    final response = await http.post(
      Uri.parse('https://hayy.my.id/api-mulki/info.php'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'judul_info': _judulController.text,
        'isi_info': _isiController.text,
        'tgl_post_info': DateTime.now().toIso8601String(),
      }),
    );

    if (response.statusCode == 200) {
      fetchInfo();
      _judulController.clear();
      _isiController.clear();
    } else {
      throw Exception('Gagal menambahkan informasi');
    }
  }

  Future<void> editInfo(String id) async {
    final response = await http.put(
      Uri.parse('https://hayy.my.id/api-mulki/info.php'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'kd_info': id,
        'judul_info': _judulController.text,
        'isi_info': _isiController.text,
        'tgl_post_info': DateTime.now().toIso8601String(),
      }),
    );

    if (response.statusCode == 200) {
      fetchInfo();
      _judulController.clear();
      _isiController.clear();
    } else {
      throw Exception('Gagal mengedit informasi');
    }
  }

  Future<void> deleteInfo(String id) async {
    final response = await http.delete(
      Uri.parse('https://hayy.my.id/api-mulki/info.php?kd_info=$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      fetchInfo();
    } else {
      throw Exception('Gagal menghapus informasi');
    }
  }

  void _showAddInfoDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Tambah Informasi Baru'),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextField(
                  controller: _judulController,
                  decoration: const InputDecoration(hintText: "Judul Informasi"),
                ),
                TextField(
                  controller: _isiController,
                  decoration: const InputDecoration(hintText: "Isi Informasi"),
                  maxLines: 3,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Batal'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Tambah'),
              onPressed: () {
                addInfo();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showEditInfoDialog(String id, String judul, String isi) {
    _judulController.text = judul;
    _isiController.text = isi;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Informasi'),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextField(
                  controller: _judulController,
                  decoration: const InputDecoration(hintText: "Judul Informasi"),
                ),
                TextField(
                  controller: _isiController,
                  decoration: const InputDecoration(hintText: "Isi Informasi"),
                  maxLines: 3,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Batal'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Simpan'),
              onPressed: () {
                editInfo(id);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showDeleteConfirmationDialog(String id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Konfirmasi Hapus'),
          content: const Text('Apakah Anda yakin ingin menghapus informasi ini?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Batal'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Hapus'),
              onPressed: () {
                deleteInfo(id);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100],
      body: infoList.isEmpty
          ? const Center(child: CircularProgressIndicator(color: Colors.orange))
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: infoList.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.only(bottom: 16),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    title: Text(
                      infoList[index]['judul_info'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.orange[800],
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        Text(
                          'Diposting pada: ${infoList[index]['tgl_post_info']}',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          infoList[index]['isi_info'],
                          style: const TextStyle(fontSize: 14),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.orange),
                          onPressed: () {
                            _showEditInfoDialog(
                              infoList[index]['kd_info'],
                              infoList[index]['judul_info'],
                              infoList[index]['isi_info'],
                            );
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            _showDeleteConfirmationDialog(infoList[index]['kd_info']);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddInfoDialog,
        backgroundColor: Colors.orange,
        child: Icon(Icons.add),
      ),
    );
  }
}
