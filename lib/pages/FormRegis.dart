import 'package:flutter/material.dart';

class RegistrasiPage extends StatefulWidget {
  @override
  _RegistrasiPageState createState() => _RegistrasiPageState();
}
Widget _buildInputField({
  required TextEditingController controller,
  required String label,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
      validator: (value) =>
          value == null || value.isEmpty ? 'Wajib diisi' : null,
    ),
  );
}
class _RegistrasiPageState extends State<RegistrasiPage> {
  final _formKey = GlobalKey<FormState>();
  final _namaPemilikController = TextEditingController();
  final _nomorPolisiController = TextEditingController();
  final _jenisKendaraanController = TextEditingController();
  final _MerkKendaraanController = TextEditingController();
  final _NomorRegistrasiController = TextEditingController();
  final _suratsuratController = TextEditingController();

  @override
  void dispose() {
    _namaPemilikController.dispose();
    _nomorPolisiController.dispose();
    _jenisKendaraanController.dispose();
    super.dispose();
  }
@override
Widget build(BuildContext context) {
  return SingleChildScrollView(
    child: Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 500), // Batas lebar maksimal
        child: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.95),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Text(
                  'Form Registrasi Kendaraan',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                _buildInputField(
                    controller: _namaPemilikController, label: 'Nama Pemilik'),
                _buildInputField(
                    controller: _nomorPolisiController, label: 'Nomor Polisi'),
                _buildInputField(
                    controller: _jenisKendaraanController, label: 'Jenis Kendaraan'),
                _buildInputField(
                    controller: _MerkKendaraanController, label: 'Merk Kendaraan'),
                _buildInputField(
                    controller: _NomorRegistrasiController, label: 'Nomor Registrasi'),
                _buildInputField(
                    controller: _suratsuratController, label: 'SURAT SURAT'),
                SizedBox(height: 24),
                ElevatedButton.icon(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Data berhasil dikirim!')),
                      );
                    }
                  },
                  icon: Icon(Icons.send),
                  label: Text('Kirim'),
                  style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    backgroundColor: Colors.blueGrey[800],
                    textStyle: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}}