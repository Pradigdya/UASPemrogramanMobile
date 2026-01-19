import 'package:flutter/material.dart';
import '../widgets/summary_card.dart';
import 'event_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  // Data event hardcode (sama dengan di EventPage)
  static List<Map<String, dynamic>> getEvents() {
    return [
      {
        'title': 'Seminar Teknologi Informasi',
        'organizer': 'HIMTI',
        'category': 'Seminar',
        'status': 'Upcoming',
        'description':
            'Seminar tentang perkembangan teknologi informasi terkini dengan pembicara dari industri.',
        'image': 'assets/images/event1.jpg',
      },
      {
        'title': 'Lomba Programming Competition',
        'organizer': 'Fakultas Teknik',
        'category': 'Lomba',
        'status': 'Ongoing',
        'description':
            'Kompetisi programming tingkat nasional untuk mahasiswa seluruh Indonesia.',
        'image': 'assets/images/event2.jpg',
      },
      {
        'title': 'Rapat Koordinasi Organisasi',
        'organizer': 'BEM Kampus',
        'category': 'Organisasi',
        'status': 'Upcoming',
        'description':
            'Rapat koordinasi kegiatan organisasi mahasiswa untuk semester ini.',
        'image': 'assets/images/event1.jpg',
      },
      {
        'title': 'Workshop Flutter Development',
        'organizer': 'HIMTI',
        'category': 'Seminar',
        'status': 'Finished',
        'description':
            'Workshop pengembangan aplikasi mobile menggunakan Flutter framework.',
        'image': 'assets/images/event2.jpg',
      },
      {
        'title': 'Hackathon 2024',
        'organizer': 'Fakultas Teknik',
        'category': 'Lomba',
        'status': 'Finished',
        'description':
            'Hackathon 24 jam untuk menciptakan solusi inovatif menggunakan teknologi.',
        'image': 'assets/images/event1.jpg',
      },
      {
        'title': 'Kegiatan Bakti Sosial',
        'organizer': 'BEM Kampus',
        'category': 'Organisasi',
        'status': 'Ongoing',
        'description':
            'Kegiatan bakti sosial ke panti asuhan dan panti jompo di sekitar kampus.',
        'image': 'assets/images/event2.jpg',
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    // Mengambil data event
    final events = getEvents();

    // Menghitung jumlah event berdasarkan status
    final totalEvents = events.length;
    final upcomingEvents = events
        .where((e) => e['status'] == 'Upcoming')
        .length;
    final ongoingEvents = events.where((e) => e['status'] == 'Ongoing').length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('IT Campus Event'),
        // Menggunakan theme global
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Banner Image.asset
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // Gambar banner di belakang
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    child: Image.asset(
                      'assets/images/banner.jpg', // Ganti dengan nama file banner Anda
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        // Jika gambar tidak ditemukan, tampilkan placeholder
                        return Container(
                          color: Theme.of(
                            context,
                          ).colorScheme.primary.withOpacity(0.2),
                          child: Center(
                            child: Icon(
                              Icons.event_note,
                              size: 80,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  // Overlay gradient untuk teks lebih jelas
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Theme.of(
                            context,
                          ).colorScheme.primary.withOpacity(0.7),
                        ],
                      ),
                    ),
                  ),
                  // Text di atas gambar
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'CAMPUS EVENT &\nORGANIZATION APP',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              offset: Offset(2, 2),
                              blurRadius: 4,
                              color: Colors.black26,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  // Text perkenalan aplikasi
                  Text(
                    'Selamat Datang!',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Aplikasi ini menyediakan informasi lengkap tentang event kampus dan kegiatan organisasi mahasiswa. Dapatkan update terbaru tentang seminar, lomba, dan kegiatan organisasi di kampus Anda.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Menggunakan SummaryCard reusable widget
                  Row(
                    children: [
                      SummaryCard(
                        icon: Icons.event,
                        title: 'Total Event',
                        count: totalEvents,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(width: 12),
                      SummaryCard(
                        icon: Icons.upcoming,
                        title: 'Upcoming',
                        count: upcomingEvents,
                        color: Colors.blue,
                      ),
                      const SizedBox(width: 12),
                      SummaryCard(
                        icon: Icons.play_circle_outline,
                        title: 'Ongoing',
                        count: ongoingEvents,
                        color: Colors.green,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Card informasi tambahan
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.info_outline,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Informasi',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            'Gunakan menu Events untuk melihat detail semua event kampus dan kegiatan organisasi.',
                            style: TextStyle(fontSize: 14),
                          ),
                          const SizedBox(height: 12),
                          ElevatedButton.icon(
                            onPressed: () {
                              // Navigasi ke halaman Events
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const EventPage(),
                                ),
                              );
                            },
                            icon: const Icon(Icons.arrow_forward),
                            label: const Text('Lihat Events'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.indigo,
                              foregroundColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
