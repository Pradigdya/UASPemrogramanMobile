import 'package:flutter/material.dart';
import '../widgets/profile_card.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        // Menggunakan theme global
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Menggunakan ProfileCard reusable widget untuk pembuat 1
            ProfileCard(name: 'Pradigdya Rafly', nim: '2313010631'),
            const SizedBox(height: 20),
            // Menggunakan ProfileCard reusable widget untuk pembuat 2
            ProfileCard(name: 'Mikhael Dava', nim: '2313010666'),
            const SizedBox(height: 20),
            // Card tujuan aplikasi
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.info,
                          color: Theme.of(context).colorScheme.primary,
                          size: 28,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'Tujuan Aplikasi',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Campus Event & Organization App adalah aplikasi yang dirancang untuk membantu mahasiswa dalam mendapatkan informasi lengkap tentang event kampus dan kegiatan organisasi mahasiswa.',
                      style: TextStyle(
                        fontSize: 14,
                        height: 1.6,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Fitur utama:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildFeatureItem(
                      'Dashboard untuk melihat ringkasan event',
                    ),
                    _buildFeatureItem(
                      'Daftar lengkap event kampus dan organisasi',
                    ),
                    _buildFeatureItem('Detail event dengan informasi lengkap'),
                    _buildFeatureItem(
                      'Kategori event: Seminar, Lomba, dan Organisasi',
                    ),
                    _buildFeatureItem(
                      'Hero animation untuk transisi yang smooth',
                    ),
                    _buildFeatureItem(
                      'Reusable widgets untuk kode yang lebih rapi',
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Aplikasi ini dibuat menggunakan Flutter dengan Material Design untuk memberikan pengalaman pengguna yang baik dan intuitif. Cocok untuk presentasi dosen dan showcase project.',
                      style: TextStyle(
                        fontSize: 14,
                        height: 1.6,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Card informasi tambahan
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Icon(
                      Icons.school,
                      size: 48,
                      color: Theme.of(
                        context,
                      ).colorScheme.primary.withOpacity(0.7),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Final Project',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Pemrograman Mobile',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Semester 5',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget helper untuk menampilkan item fitur
  Widget _buildFeatureItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check_circle, size: 18, color: Colors.green),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 14, height: 1.5),
            ),
          ),
        ],
      ),
    );
  }
}
