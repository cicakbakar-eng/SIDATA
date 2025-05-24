import 'package:flutter/material.dart';
import 'package:sidata/db/dabes.dart';

class ListKendaraan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Kendaraan'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: DatabaseInisiasi().selectAll(),  
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Terjadi kesalahan: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Tidak ada kendaraan yang terdaftar.'));
          } else {
            final kendaraanList = snapshot.data!;
            return ListView.builder(
              itemCount: kendaraanList.length,
              itemBuilder: (context, index) {
                final kendaraan = kendaraanList[index];
                return ListTile(
                  title: Text(kendaraan['Nama_Pemilik']),
                  subtitle: Text('Nomor Polisi: ${kendaraan['Nomor_Polisi']}'),
                  trailing: Text(kendaraan['Nomor_Registrasi']),
                  onTap: () {
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
