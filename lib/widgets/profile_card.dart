import 'package:flutter/material.dart';

// Reusable Widget untuk ProfileCard
// Widget ini digunakan untuk menampilkan informasi pembuat aplikasi
class ProfileCard extends StatelessWidget {
  final String name;
  final String nim;

  const ProfileCard({super.key, required this.name, required this.nim});

  @override

  Widget build(BuildContext context) {
    return Card(
      // Menggunakan Card theme dari global theme
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Foto profil (Image.asset)
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Theme.of(
                  context,
                ).colorScheme.primary.withOpacity(0.1),
                child: Image.asset(
                  'assets/images/profile.png',
                  width: 100,
                  height: 100,
                  errorBuilder: (context, error, stackTrace) {
                    // Jika gambar tidak ditemukan, tampilkan icon
                    return Icon(
                      Icons.person,
                      size: 60,
                      color: Theme.of(context).colorScheme.primary,
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Nama
            _buildInfoRow(
              context: context,
              icon: Icons.badge,
              label: 'Nama',
              value: name,
            ),
            const SizedBox(height: 12),
            // NIM
            _buildInfoRow(
              context: context,
              icon: Icons.numbers,
              label: 'NIM',
              value: nim,
            ),
          ],
        ),
      ),
    );
  }

  // Widget helper untuk menampilkan baris informasi
  Widget _buildInfoRow({
    required BuildContext context,
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        Icon(icon, color: Theme.of(context).colorScheme.primary, size: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
