import 'package:flutter/material.dart';
import 'package:sidata/db/dabes.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final String userName = "John Doe";
  final String email = "john.doe@example.com";
  final String phone = "08123456789";

  // Data kendaraan dari database
  Map<String, dynamic>? vehicleData;

  @override
  void initState() {
    super.initState();
    _loadVehicleData();
  }

  Future<void> _loadVehicleData() async {
    final db = await DatabaseInisiasi().database;

    // Ambil data pertama dari tabel kendaraan (bisa disesuaikan dengan query spesifik)
    final List<Map<String, dynamic>> result =
        await db.query(DatabaseInisiasi().tableKendaraan, limit: 1);

    if (result.isNotEmpty) {
      setState(() {
        vehicleData = result.first;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.6),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.person, size: 100, color: Colors.white70),
          SizedBox(height: 16),
          Text(
            userName,
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 8),
          Text(email, style: TextStyle(fontSize: 18, color: Colors.white70)),
          SizedBox(height: 4),
          Text(phone, style: TextStyle(fontSize: 18, color: Colors.white70)),

          Divider(height: 30, color: Colors.white54),

          vehicleData != null
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InfoItem(label: "Nama Kendaraan", value: vehicleData![DatabaseInisiasi().columnMerkKendaraan]),
                    InfoItem(label: "Nomor Polisi", value: vehicleData![DatabaseInisiasi().columnNomorPolisi]),
                    InfoItem(label: "Jenis Kendaraan", value: vehicleData![DatabaseInisiasi().columnJenisKendaraan]),
                    InfoItem(label: "Nomor Registrasi", value: vehicleData![DatabaseInisiasi().columnNomorRegistrasi]),
                    InfoItem(label: "Surat-Surat", value: vehicleData![DatabaseInisiasi().columnSuratSurat]),
                  ],
                )
              : Text("Memuat data kendaraan...", style: TextStyle(color: Colors.white70)),

          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Fungsi Edit Profil belum tersedia")),
              );
            },
            child: Text("Edit Profil"),
          ),
        ],
      ),
    );
  }
}

class InfoItem extends StatelessWidget {
  final String label;
  final String value;

  const InfoItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: Colors.white70, fontSize: 16)),
          Text(value, style: TextStyle(color: Colors.white, fontSize: 16)),
        ],
      ),
    );
  }
}
