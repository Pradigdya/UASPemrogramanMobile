# 📖 PENJELASAN KODE DETAIL UNTUK PRESENTASI

## 🎯 Cara Menggunakan Dokumen Ini

Dokumen ini berisi penjelasan detail setiap bagian kode penting. Gunakan untuk:
1. Memahami setiap baris kode
2. Menjelaskan ke dosen dengan percaya diri
3. Menjawab pertanyaan teknis

---

## 📄 **FILE 1: main.dart**

### **Import Statements**
```dart
import 'package:flutter/material.dart';
import 'pages/dashboard_page.dart';
import 'pages/event_page.dart';
import 'pages/profile_page.dart';
```
**Penjelasan:** Import library Flutter dan halaman-halaman aplikasi.

---

### **MyApp Class (StatelessWidget)**
```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Campus Event & Organization App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(...),
      home: const MainNavigation(),
    );
  }
}
```

**Penjelasan:**
- `StatelessWidget`: Widget yang tidak berubah
- `MaterialApp`: Widget utama untuk Material Design
- `theme`: Theme global untuk seluruh aplikasi
- `home`: Halaman pertama yang ditampilkan

**Cara Jelaskan:**
> "MyApp adalah widget utama aplikasi. Di sini kita set tema global dan menentukan halaman pertama yang akan ditampilkan, yaitu MainNavigation."

---

### **ThemeData Global**
```dart
theme: ThemeData(
  primarySwatch: Colors.indigo,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.indigo,
    brightness: Brightness.light,
  ),
  scaffoldBackgroundColor: Colors.grey[100],
  cardTheme: CardThemeData(
    elevation: 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.indigo,
    foregroundColor: Colors.white,
    elevation: 0,
  ),
)
```

**Penjelasan:**
- `primarySwatch`: Warna utama (indigo)
- `scaffoldBackgroundColor`: Background abu-abu terang
- `cardTheme`: Style untuk semua Card (elevation, border radius)
- `appBarTheme`: Style untuk semua AppBar

**Cara Jelaskan:**
> "ThemeData ini mengatur tema global. Semua Card akan memiliki border radius 12 dan elevation 2. Semua AppBar akan berwarna indigo. Ini membuat desain konsisten di seluruh aplikasi."

---

### **MainNavigation (StatefulWidget)**
```dart
class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}
```

**Penjelasan:**
- `StatefulWidget`: Widget yang bisa berubah state
- Diperlukan untuk mengatur index navigasi

---

### **_MainNavigationState**
```dart
class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const DashboardPage(),
    const EventPage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
```

**Penjelasan:**
- `_currentIndex`: Menyimpan index menu yang aktif (0=Dashboard, 1=Events, 2=Profile)
- `_pages`: List halaman yang akan ditampilkan
- `_onItemTapped`: Method yang dipanggil saat user klik menu
- `setState()`: Update state dan rebuild widget

**Cara Jelaskan:**
> "MainNavigation menggunakan StatefulWidget karena kita perlu menyimpan state index navigasi. Saat user klik menu, kita panggil setState() untuk update _currentIndex, dan Flutter otomatis rebuild untuk menampilkan halaman yang sesuai."

---

### **BottomNavigationBar**
```dart
bottomNavigationBar: BottomNavigationBar(
  currentIndex: _currentIndex,
  onTap: _onItemTapped,
  items: const [
    BottomNavigationBarItem(
      icon: Icon(Icons.dashboard),
      label: 'Dashboard',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.event),
      label: 'Events',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Profile',
    ),
  ],
)
```

**Penjelasan:**
- `currentIndex`: Index menu yang aktif
- `onTap`: Callback saat menu diklik
- `items`: List menu items

---

## 📄 **FILE 2: event_page.dart**

### **getEvents() Method**
```dart
static List<Map<String, dynamic>> getEvents() {
  final now = DateTime.now();
  
  String formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
  
  return [
    {
      'title': 'Seminar Teknologi Informasi',
      'organizer': 'HIMTI',
      'category': 'Seminar',
      'status': 'Upcoming',
      'description': '...',
      'image': 'assets/images/event1.jpg',
      'date': now.add(const Duration(days: 5)).copyWith(hour: 9, minute: 0),
      'dateString': formatDate(now.add(const Duration(days: 5))),
      'time': '09:00 WIB',
    },
    // ... event lainnya
  ];
}
```

**Penjelasan:**
- `static`: Method bisa dipanggil tanpa membuat instance class
- `List<Map<String, dynamic>>`: List yang berisi Map dengan key string dan value dynamic
- Data hardcode: 6 event dengan informasi lengkap
- `DateTime.now()`: Waktu sekarang, digunakan untuk menghitung tanggal event

**Cara Jelaskan:**
> "Method getEvents() mengembalikan List berisi 6 event. Setiap event adalah Map dengan key seperti 'title', 'organizer', 'category', dll. Kita menggunakan DateTime.now() untuk menghitung tanggal event relatif terhadap hari ini."

---

### **ListView.builder**
```dart
ListView.builder(
  padding: const EdgeInsets.all(16.0),
  itemCount: events.length,
  itemBuilder: (context, index) {
    final event = events[index];
    return EventCard(
      event: event,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailEventPage(event: event),
          ),
        );
      },
    );
  },
)
```

**Penjelasan:**
- `ListView.builder`: Efisien untuk list panjang
- `itemCount`: Jumlah item dalam list
- `itemBuilder`: Function yang membuat widget untuk setiap item
- `Navigator.push`: Navigasi ke halaman baru

**Cara Jelaskan:**
> "ListView.builder lebih efisien karena hanya me-render item yang terlihat. Saat user scroll, item baru akan di-render. Saat user klik EventCard, kita gunakan Navigator.push untuk navigasi ke DetailEventPage."

---

## 📄 **FILE 3: widgets/event_card.dart**

### **EventCard Class**
```dart
class EventCard extends StatelessWidget {
  final Map<String, dynamic> event;
  final VoidCallback onTap;

  const EventCard({
    super.key,
    required this.event,
    required this.onTap,
  });
```

**Penjelasan:**
- `StatelessWidget`: Widget yang tidak berubah
- `final`: Immutable (tidak bisa diubah setelah dibuat)
- `required`: Parameter wajib
- `VoidCallback`: Function tanpa parameter dan return value

**Cara Jelaskan:**
> "EventCard adalah reusable widget. Menerima parameter event (data) dan onTap (callback saat diklik). Dengan cara ini, kita bisa menggunakan EventCard berkali-kali dengan data berbeda."

---

### **Hero Animation**
```dart
Hero(
  tag: event['title'],
  child: ClipRRect(
    borderRadius: const BorderRadius.only(
      topLeft: Radius.circular(12),
      topRight: Radius.circular(12),
    ),
    child: Image.asset(
      event['image'],
      height: 180,
      width: double.infinity,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          height: 180,
          color: Colors.indigo.withOpacity(0.1),
          child: const Center(
            child: Icon(Icons.image, size: 60),
          ),
        );
      },
    ),
  ),
)
```

**Penjelasan:**
- `Hero`: Widget untuk animasi transisi
- `tag`: Identifier unik untuk Hero (harus sama di source dan destination)
- `ClipRRect`: Clip widget dengan border radius
- `errorBuilder`: Callback jika gambar tidak ditemukan

**Cara Jelaskan:**
> "Hero widget membuat animasi transisi gambar. Tag harus sama di EventCard dan DetailEventPage. Jika gambar tidak ditemukan, errorBuilder menampilkan placeholder icon."

---

### **getStatusColor() Method**
```dart
Color getStatusColor(String status) {
  switch (status) {
    case 'Upcoming':
      return Colors.blue;
    case 'Ongoing':
      return Colors.green;
    case 'Finished':
      return Colors.grey;
    default:
      return Colors.grey;
  }
}
```

**Penjelasan:**
- Method helper untuk mendapatkan warna berdasarkan status
- Menggunakan switch case

---

## 📄 **FILE 4: detail_event.dart**

### **StatefulWidget untuk Toggle**
```dart
class DetailEventPage extends StatefulWidget {
  final Map<String, dynamic> event;

  const DetailEventPage({super.key, required this.event});

  @override
  State<DetailEventPage> createState() => _DetailEventPageState();
}

class _DetailEventPageState extends State<DetailEventPage> {
  bool _showDescription = false;
```

**Penjelasan:**
- `StatefulWidget`: Diperlukan karena ada state yang berubah
- `_showDescription`: State untuk toggle deskripsi
- `widget.event`: Mengakses property dari StatefulWidget

---

### **setState() untuk Toggle**
```dart
IconButton(
  icon: Icon(
    _showDescription ? Icons.expand_less : Icons.expand_more,
    color: Theme.of(context).colorScheme.primary,
  ),
  onPressed: () {
    setState(() {
      _showDescription = !_showDescription;
    });
  },
)
```

**Penjelasan:**
- `setState()`: Method untuk update state dan rebuild widget
- `!_showDescription`: Toggle boolean (true jadi false, false jadi true)
- Conditional rendering: Icon berubah berdasarkan state

**Cara Jelaskan:**
> "Saat user klik IconButton, kita panggil setState() untuk toggle _showDescription. Flutter akan rebuild widget dan menampilkan/menyembunyikan deskripsi sesuai state baru."

---

### **Conditional Rendering**
```dart
if (_showDescription) ...[
  const SizedBox(height: 8),
  Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.grey[100],
      borderRadius: BorderRadius.circular(8),
    ),
    child: Text(
      widget.event['description'],
      style: const TextStyle(fontSize: 14, height: 1.6),
    ),
  ),
],
```

**Penjelasan:**
- `if (_showDescription)`: Conditional rendering
- `...[ ]`: Spread operator untuk menambahkan multiple widgets
- Widget hanya ditampilkan jika kondisi true

---

## 📄 **FILE 5: widgets/summary_card.dart**

### **Reusable SummaryCard**
```dart
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
```

**Penjelasan:**
- `Expanded`: Widget yang mengambil sisa ruang di Row
- Parameter: icon, title, count, color
- Bisa digunakan berkali-kali dengan data berbeda

**Cara Jelaskan:**
> "SummaryCard adalah reusable widget. Kita bisa membuat 3 SummaryCard dengan parameter berbeda untuk menampilkan Total Event, Upcoming, dan Ongoing. Ini menghindari duplikasi kode."

---

## 🎯 **KONSEP PENTING YANG PERLU DIINGAT**

### **1. StatelessWidget vs StatefulWidget**
- **StatelessWidget**: Tidak berubah, tidak ada state
- **StatefulWidget**: Bisa berubah, ada state, gunakan setState()

### **2. setState()**
- Hanya bisa dipanggil di StatefulWidget
- Update state dan rebuild widget
- Penting untuk interaksi user

### **3. Navigator**
- `Navigator.push`: Ke halaman baru
- `Navigator.pop`: Kembali ke halaman sebelumnya

### **4. Reusable Widgets**
- Buat widget yang bisa digunakan berkali-kali
- Parameter untuk customisasi
- Menghindari duplikasi kode

### **5. ThemeData**
- Set di MaterialApp
- Konsisten di seluruh aplikasi
- Mudah diubah

---

**SELAMAT BELAJAR! 📚**
