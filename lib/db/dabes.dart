import 'dart:async';
import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseInisiasi {
  static final DatabaseInisiasi _instance = DatabaseInisiasi._internal();
  factory DatabaseInisiasi() => _instance;
  DatabaseInisiasi._internal();

  static Database? _database;

  final String _databaseName = "dabes_kendaraan.db";
  final int _databaseVersion = 1;

  // Nama tabel dan kolom
  final String tableKendaraan = 'kendaraan';
  final String columnId = 'id';
  final String columnNamaPemilik = 'Nama_Pemilik';
  final String columnNomorPolisi = 'Nomor_Polisi';
  final String columnJenisKendaraan = 'Jenis_Kendaraan';
  final String columnMerkKendaraan = 'Merk_Kendaraan';
  final String columnNomorRegistrasi = 'Nomor_Registrasi';
  final String columnSuratSurat = 'Surat_Surat';

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableKendaraan (
        $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnNamaPemilik TEXT NOT NULL,
        $columnNomorPolisi TEXT NOT NULL,
        $columnJenisKendaraan TEXT NOT NULL,
        $columnMerkKendaraan TEXT NOT NULL,
        $columnNomorRegistrasi TEXT NOT NULL,
        $columnSuratSurat TEXT NOT NULL
      )
    ''');
  }
 Future<int> insert(Map<String, dynamic> row) async {
  final db = await database;
  return await db.insert(tableKendaraan, row);
}
Future<List<Map<String, dynamic>>> selectAll() async {
  final db = await database;
  return await db.query(tableKendaraan);
}
}


