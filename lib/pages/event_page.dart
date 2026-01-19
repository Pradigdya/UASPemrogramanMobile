import 'package:flutter/material.dart';
import '../widgets/event_card.dart';
import 'detail_event.dart';

class EventPage extends StatelessWidget {
  const EventPage({super.key});

  // Data event hardcode dengan date dan time
  static List<Map<String, dynamic>> getEvents() {
    final now = DateTime.now();

    // Helper function untuk format tanggal dengan aman
    String formatDate(DateTime date) {
      return '${date.day}/${date.month}/${date.year}';
    }

    return [
      {
        'title': 'Seminar Teknologi Informasi',
        'organizer': 'HIMTI',
        'category': 'Seminar',
        'status': 'Upcoming',
        'description':
            'Seminar tentang perkembangan teknologi informasi terkini dengan pembicara dari industri. Acara ini akan membahas topik-topik seperti AI, Cloud Computing, dan Cybersecurity.',
        'image': 'assets/images/event1.jpg',
        // Event akan datang: 5 hari dari sekarang, jam 09:00
        'date': now.add(const Duration(days: 5)).copyWith(hour: 9, minute: 0),
        'dateString': formatDate(now.add(const Duration(days: 5))),
        'time': '09:00 WIB',
      },
      {
        'title': 'Lomba Programming Competition',
        'organizer': 'Fakultas Teknik',
        'category': 'Lomba',
        'status': 'Ongoing',
        'description':
            'Kompetisi programming tingkat nasional untuk mahasiswa seluruh Indonesia. Peserta akan mengerjakan berbagai soal algoritma dan struktur data.',
        'image': 'assets/images/event2.jpg',
        // Event sedang berlangsung: dimulai 2 hari lalu, jam 08:00
        'date': now
            .subtract(const Duration(days: 2))
            .copyWith(hour: 8, minute: 0),
        'dateString': formatDate(now.subtract(const Duration(days: 2))),
        'time': '08:00 WIB',
      },
      {
        'title': 'Rapat Koordinasi Organisasi',
        'organizer': 'BEM Kampus',
        'category': 'Organisasi',
        'status': 'Upcoming',
        'description':
            'Rapat koordinasi kegiatan organisasi mahasiswa untuk semester ini. Akan dibahas rencana kegiatan dan anggaran organisasi.',
        'image': 'assets/images/event3.jpg',
        // Event akan datang: 3 hari dari sekarang, jam 14:00
        'date': now.add(const Duration(days: 3)).copyWith(hour: 14, minute: 0),
        'dateString': formatDate(now.add(const Duration(days: 3))),
        'time': '14:00 WIB',
      },
      {
        'title': 'Hackathon 2024',
        'organizer': 'Fakultas Teknik',
        'category': 'Lomba',
        'status': 'Finished',
        'description':
            'Hackathon 24 jam untuk menciptakan solusi inovatif menggunakan teknologi. Tim terbaik akan mendapatkan hadiah menarik.',
        'image': 'assets/images/event4.jpg',
        // Event sudah selesai: 15 hari yang lalu, jam 08:00
        'date': now
            .subtract(const Duration(days: 15))
            .copyWith(hour: 8, minute: 0),
        'dateString': formatDate(now.subtract(const Duration(days: 15))),
        'time': '08:00 WIB',
      },
      {
        'title': 'Kegiatan Bakti Sosial',
        'organizer': 'BEM Kampus',
        'category': 'Organisasi',
        'status': 'Ongoing',
        'description':
            'Kegiatan bakti sosial ke panti asuhan dan panti jompo di sekitar kampus. Akan ada berbagai kegiatan seperti donasi dan kegiatan edukatif.',
        'image': 'assets/images/event5.jpg',
        // Event sedang berlangsung: dimulai 1 hari lalu, jam 07:00
        'date': now
            .subtract(const Duration(days: 1))
            .copyWith(hour: 7, minute: 0),
        'dateString': formatDate(now.subtract(const Duration(days: 1))),
        'time': '07:00 WIB',
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    final events = getEvents();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Events'),
        // Menggunakan theme global
      ),
      body: events.isEmpty
          ? const Center(child: Text('Tidak ada event'))
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: events.length,
              itemBuilder: (context, index) {
                final event = events[index];
                // Menggunakan EventCard reusable widget dengan Hero animation
                return EventCard(
                  event: event,
                  onTap: () {
                    // OnTap → Detail Event Page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailEventPage(event: event),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
