import 'package:flutter/material.dart';

// Reusable Widget untuk SummaryCard
// Widget ini digunakan untuk menampilkan ringkasan statistik di Dashboard
class SummaryCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final int count;
  final Color color;

  const SummaryCard({
    super.key,
    required this.icon,
    required this.title,
    required this.count,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        // Menggunakan Card theme dari global theme
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Icon(icon, size: 40, color: color),
              const SizedBox(height: 8),
              Text(
                '$count',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
