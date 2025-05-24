import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String userName = "John Doe";
  final String email = "john.doe@example.com";
  final String phone = "08123456789";

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
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8),
          Text(
            email,
            style: TextStyle(fontSize: 18, color: Colors.white70),
          ),
          SizedBox(height: 4),
          Text(
            phone,
            style: TextStyle(fontSize: 18, color: Colors.white70),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Misal fungsi logout atau edit profil bisa ditaruh di sini
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Fungsi Edit Profil belum tersedia")),
              );
            },
            child: Text("Edit Profil"),
          )
        ],
      ),
    );
  }
}
