# 📱 PANDUAN PRESENTASI PROJECT FLUTTER
## Campus Event & Organization App

---

## 🎯 **BAGIAN 1: PENDAHULUAN (2-3 menit)**

### **1.1 Judul Project**
> **"CAMPUS EVENT & ORGANIZATION APP"**
> 
> Aplikasi mobile untuk menampilkan informasi event kampus dan kegiatan organisasi mahasiswa

### **1.2 Tujuan Aplikasi**
- Membantu mahasiswa mendapatkan informasi event kampus
- Menampilkan detail event dengan lengkap
- Memudahkan tracking event berdasarkan kategori dan status

### **1.3 Teknologi yang Digunakan**
- **Framework**: Flutter (Dart)
- **Platform**: Android (bisa iOS, Web, Desktop)
- **Level**: Basic-Menengah
- **Tanpa API & Database** (menggunakan data hardcode)

---

## 🏗️ **BAGIAN 2: STRUKTUR PROJECT (3-4 menit)**

### **2.1 Struktur Folder**

```
finalproject/
├── lib/                    # Source code utama
│   ├── main.dart          # Entry point aplikasi
│   ├── pages/             # Halaman-halaman aplikasi
│   │   ├── dashboard_page.dart
│   │   ├── event_page.dart
│   │   ├── detail_event.dart
│   │   └── profile_page.dart
│   └── widgets/           # Reusable widgets
│       ├── event_card.dart
│       ├── summary_card.dart
│       └── profile_card.dart
├── assets/                # Gambar dan file statis
│   └── images/
├── pubspec.yaml           # Dependencies dan konfigurasi
└── test/                  # File testing
```

**Penjelasan ke Dosen:**
> "Project ini menggunakan struktur folder yang rapi dan terorganisir. Folder `lib/` berisi semua source code, `pages/` untuk halaman-halaman aplikasi, dan `widgets/` untuk komponen yang bisa digunakan berulang kali."

---

## 📄 **BAGIAN 3: PENJELASAN FILE PER FILE (5-7 menit)**

### **3.1 main.dart - Entry Point Aplikasi**

**Lokasi**: `lib/main.dart`

**Fungsi:**
- Titik masuk aplikasi
- Mengatur theme global (warna, style)
- Mengatur navigasi dengan BottomNavigationBar

**Konsep Penting:**
1. **MaterialApp**: Widget utama Flutter untuk Material Design
2. **ThemeData**: Pengaturan tema global (warna indigo, background abu-abu)
3. **StatefulWidget**: Widget yang bisa berubah state (untuk navigasi)

**Cara Jelaskan:**
> "File `main.dart` adalah pintu masuk aplikasi. Di sini kita set tema global seperti warna indigo untuk primary color, dan mengatur navigasi dengan BottomNavigationBar yang memiliki 3 menu: Dashboard, Events, dan Profile."

**Kode Penting:**
```dart
// Theme global - konsisten di semua halaman
theme: ThemeData(
  primarySwatch: Colors.indigo,
  scaffoldBackgroundColor: Colors.grey[100],
  cardTheme: CardThemeData(...),
)
```

---

### **3.2 dashboard_page.dart - Halaman Dashboard**

**Lokasi**: `lib/pages/dashboard_page.dart`

**Fungsi:**
- Menampilkan banner aplikasi
- Menampilkan ringkasan statistik event
- Menggunakan reusable widget `SummaryCard`

**Fitur:**
1. Banner dengan gradient overlay
2. 3 Summary Cards: Total Event, Upcoming, Ongoing
3. Button navigasi ke halaman Events

**Konsep Penting:**
- **StatelessWidget**: Widget yang tidak berubah (tidak ada interaksi)
- **ListView/Column**: Layout untuk menata widget
- **Reusable Widget**: Menggunakan `SummaryCard` untuk menghindari duplikasi kode

**Cara Jelaskan:**
> "Halaman Dashboard menampilkan ringkasan event. Kita menggunakan widget `SummaryCard` yang bisa digunakan berulang kali untuk menampilkan statistik. Ini adalah contoh reusable widget yang membuat kode lebih rapi dan mudah dirawat."

---

### **3.3 event_page.dart - Halaman Daftar Event**

**Lokasi**: `lib/pages/event_page.dart`

**Fungsi:**
- Menampilkan daftar semua event
- Menggunakan `ListView.builder` untuk list yang efisien
- Menggunakan reusable widget `EventCard`

**Fitur:**
1. ListView dengan scroll
2. EventCard dengan gambar, judul, organizer, status
3. Navigasi ke Detail Event saat diklik

**Konsep Penting:**
- **ListView.builder**: Efisien untuk list panjang (hanya render yang terlihat)
- **Hero Animation**: Animasi transisi gambar saat navigasi
- **Data Hardcode**: List event disimpan di dalam kode

**Cara Jelaskan:**
> "Halaman Events menampilkan semua event dalam bentuk list. Kita menggunakan `ListView.builder` yang efisien karena hanya me-render item yang terlihat di layar. Setiap event ditampilkan menggunakan `EventCard` yang merupakan reusable widget. Saat user klik event, akan ada animasi Hero yang smooth ke halaman detail."

**Data Event:**
```dart
// Data hardcode - 6 event dengan informasi lengkap
static List<Map<String, dynamic>> getEvents() {
  return [
    {
      'title': 'Seminar Teknologi Informasi',
      'organizer': 'HIMTI',
      'category': 'Seminar',
      'status': 'Upcoming',
      'date': DateTime(...),
      'time': '09:00 WIB',
      'image': 'assets/images/event1.jpg',
    },
    // ... event lainnya
  ];
}
```

---

### **3.4 detail_event.dart - Halaman Detail Event**

**Lokasi**: `lib/pages/detail_event.dart`

**Fungsi:**
- Menampilkan detail lengkap sebuah event
- Hero animation untuk gambar
- Toggle show/hide deskripsi menggunakan setState

**Fitur:**
1. Gambar event besar dengan Hero animation
2. Informasi lengkap: judul, organizer, kategori, status
3. Date & Time display
4. Toggle deskripsi (show/hide)

**Konsep Penting:**
- **StatefulWidget**: Widget yang bisa berubah (untuk toggle deskripsi)
- **setState()**: Method untuk update UI saat state berubah
- **Hero Widget**: Animasi transisi gambar

**Cara Jelaskan:**
> "Halaman Detail Event menampilkan informasi lengkap. Fitur penting di sini adalah toggle deskripsi yang menggunakan `setState()`. Saat user klik tombol expand, kita ubah state `_showDescription` dari false ke true, dan UI otomatis update menampilkan deskripsi. Ini adalah contoh penggunaan StatefulWidget dan setState."

**Kode Penting:**
```dart
// State untuk toggle
bool _showDescription = false;

// Method untuk toggle
onPressed: () {
  setState(() {
    _showDescription = !_showDescription;
  });
}
```

---

### **3.5 profile_page.dart - Halaman Profile**

**Lokasi**: `lib/pages/profile_page.dart`

**Fungsi:**
- Menampilkan informasi pembuat aplikasi
- Menggunakan reusable widget `ProfileCard`
- Menampilkan tujuan aplikasi

**Fitur:**
1. ProfileCard untuk setiap pembuat (2 orang)
2. Informasi: Nama, NIM
3. Card tujuan aplikasi

**Cara Jelaskan:**
> "Halaman Profile menggunakan `ProfileCard` yang reusable. Kita bisa membuat banyak ProfileCard dengan data berbeda tanpa menulis kode berulang. Ini menunjukkan konsep reusable widget yang penting dalam Flutter."

---

### **3.6 Reusable Widgets**

#### **3.6.1 event_card.dart**
- Widget untuk menampilkan card event
- Menerima parameter: event data dan onTap callback
- Menggunakan Hero animation

**Cara Jelaskan:**
> "EventCard adalah reusable widget. Artinya kita bisa menggunakannya berkali-kali dengan data berbeda. Ini membuat kode lebih rapi dan mudah dirawat. Jika kita perlu mengubah desain card, cukup edit di satu tempat."

#### **3.6.2 summary_card.dart**
- Widget untuk menampilkan statistik
- Menerima parameter: icon, title, count, color

#### **3.6.3 profile_card.dart**
- Widget untuk menampilkan profil
- Menerima parameter: name, nim

---

## 🎨 **BAGIAN 4: FITUR-FITUR APLIKASI (4-5 menit)**

### **4.1 Navigasi dengan BottomNavigationBar**

**Penjelasan:**
> "Aplikasi menggunakan BottomNavigationBar dengan 3 menu. Kita menggunakan StatefulWidget untuk mengatur index navigasi. Saat user klik menu, kita update state `_currentIndex` dan tampilkan halaman yang sesuai."

**Kode:**
```dart
int _currentIndex = 0;

void _onItemTapped(int index) {
  setState(() {
    _currentIndex = index;
  });
}
```

---

### **4.2 Theme Global**

**Penjelasan:**
> "Kita menggunakan ThemeData di MaterialApp untuk mengatur tema global. Semua warna, style card, dan AppBar menggunakan tema ini. Ini membuat desain konsisten di seluruh aplikasi."

**Keuntungan:**
- Konsistensi desain
- Mudah diubah (ubah di satu tempat, semua halaman ikut berubah)
- Mengikuti Material Design guidelines

---

### **4.3 Hero Animation**

**Penjelasan:**
> "Hero animation membuat transisi gambar dari EventCard ke DetailEventPage terlihat smooth. Kita menggunakan tag Hero yang sama di kedua tempat untuk membuat animasi ini bekerja."

**Kode:**
```dart
// Di EventCard
Hero(
  tag: event['title'],
  child: Image.asset(...),
)

// Di DetailEventPage
Hero(
  tag: widget.event['title'],  // Tag sama!
  child: Image.asset(...),
)
```

---

### **4.4 Reusable Widgets**

**Penjelasan:**
> "Kita membuat 3 reusable widgets: EventCard, SummaryCard, dan ProfileCard. Ini adalah best practice dalam Flutter untuk menghindari duplikasi kode dan membuat aplikasi lebih mudah dirawat."

**Keuntungan:**
- Kode lebih rapi
- Mudah dirawat (ubah di satu tempat)
- Konsistensi UI
- Reusable (bisa dipakai berkali-kali)

---

### **4.5 Date/Time Display**

**Penjelasan:**
> "Setiap event memiliki informasi tanggal dan waktu. Kita menampilkannya di EventCard dan DetailEventPage dengan format yang mudah dibaca."

---

### **4.6 Toggle Deskripsi dengan setState**

**Penjelasan:**
> "Di halaman Detail Event, kita bisa show/hide deskripsi dengan toggle. Ini menggunakan StatefulWidget dan setState(). Saat state berubah, UI otomatis update."

---

## 💻 **BAGIAN 5: KONSEP FLUTTER YANG DIGUNAKAN (3-4 menit)**

### **5.1 StatelessWidget vs StatefulWidget**

**StatelessWidget:**
- Widget yang tidak berubah
- Contoh: DashboardPage, EventPage, ProfilePage
- Tidak ada interaksi yang mengubah tampilan

**StatefulWidget:**
- Widget yang bisa berubah
- Contoh: MainNavigation (untuk navigasi), DetailEventPage (untuk toggle)
- Menggunakan setState() untuk update UI

**Cara Jelaskan:**
> "Kita menggunakan StatelessWidget untuk halaman yang statis seperti Dashboard dan Events. Untuk halaman yang ada interaksi seperti toggle deskripsi, kita gunakan StatefulWidget dengan setState() untuk update tampilan."

---

### **5.2 setState()**

**Penjelasan:**
> "setState() adalah method penting dalam StatefulWidget. Saat kita panggil setState(), Flutter akan rebuild widget dan update tampilan. Ini digunakan untuk toggle deskripsi dan navigasi."

---

### **5.3 ListView.builder**

**Penjelasan:**
> "ListView.builder lebih efisien daripada ListView biasa karena hanya me-render item yang terlihat di layar. Ini penting untuk performa jika list panjang."

---

### **5.4 Navigator.push**

**Penjelasan:**
> "Navigator.push digunakan untuk navigasi ke halaman baru. Saat user klik event card, kita push DetailEventPage ke navigation stack."

---

### **5.5 Material Design**

**Penjelasan:**
> "Aplikasi menggunakan Material Design dengan Card, Chip, Icon, dan komponen Material lainnya. Ini membuat UI konsisten dan familiar untuk user Android."

---

## 📊 **BAGIAN 6: DATA & LOGIKA (2-3 menit)**

### **6.1 Data Hardcode**

**Penjelasan:**
> "Karena project ini tanpa API dan database, kita menggunakan data hardcode. Data disimpan dalam List<Map<String, dynamic>> di method getEvents()."

**Struktur Data:**
```dart
{
  'title': 'Seminar Teknologi Informasi',
  'organizer': 'HIMTI',
  'category': 'Seminar',  // Seminar / Lomba / Organisasi
  'status': 'Upcoming',   // Upcoming / Ongoing / Finished
  'date': DateTime(...),
  'dateString': '23/1/2025',
  'time': '09:00 WIB',
  'description': '...',
  'image': 'assets/images/event1.jpg',
}
```

---

### **6.2 Kategori & Status**

**Kategori:**
- Seminar → Icon: Icons.school
- Lomba → Icon: Icons.emoji_events
- Organisasi → Icon: Icons.groups

**Status:**
- Upcoming → Warna: Biru
- Ongoing → Warna: Hijau
- Finished → Warna: Abu-abu

---

## 🎯 **BAGIAN 7: DEMO APLIKASI (3-4 menit)**

### **Langkah-langkah Demo:**

1. **Buka Aplikasi**
   - Tampilkan halaman Dashboard
   - Jelaskan banner dan summary cards

2. **Navigasi ke Events**
   - Klik menu Events di bottom navigation
   - Scroll list event
   - Jelaskan EventCard

3. **Buka Detail Event**
   - Klik salah satu event
   - Tunjukkan Hero animation
   - Toggle deskripsi (show/hide)
   - Jelaskan date/time display

4. **Navigasi ke Profile**
   - Klik menu Profile
   - Tunjukkan ProfileCard
   - Jelaskan informasi pembuat

---

## 📝 **BAGIAN 8: POIN-POIN PENTING UNTUK DOSEN (2-3 menit)**

### **8.1 Teknik yang Diterapkan:**

1. ✅ **Reusable Widget** - EventCard, SummaryCard, ProfileCard
2. ✅ **ThemeData Global** - Konsistensi desain
3. ✅ **Hero Animation** - Transisi yang smooth
4. ✅ **StatefulWidget & setState** - Interaksi user
5. ✅ **ListView.builder** - Performa optimal
6. ✅ **Navigator** - Navigasi antar halaman
7. ✅ **Material Design** - UI yang konsisten

### **8.2 Best Practices:**

- ✅ Kode terorganisir dengan struktur folder yang rapi
- ✅ Reusable widgets untuk menghindari duplikasi
- ✅ Theme global untuk konsistensi
- ✅ Komentar kode untuk dokumentasi
- ✅ Naming convention yang jelas

### **8.3 Level Kompleksitas:**

- ✅ Basic: StatelessWidget, ListView, Card
- ✅ Menengah: StatefulWidget, setState, Hero Animation, Reusable Widgets
- ✅ Tanpa API/Database: Sesuai requirement

---

## ❓ **BAGIAN 9: ANTISIPASI PERTANYAAN DOSEN**

### **Q: Kenapa tidak pakai API?**
**A:** "Sesuai requirement project, kita tidak menggunakan API dan database. Data disimpan hardcode dalam List. Untuk production, bisa ditambahkan API integration."

### **Q: Bagaimana cara menambah event baru?**
**A:** "Tambah data baru di method getEvents() di event_page.dart. Untuk production, bisa diintegrasikan dengan database atau API."

### **Q: Apakah bisa di-deploy ke Play Store?**
**A:** "Bisa, dengan menjalankan `flutter build apk` atau `flutter build appbundle`. Tapi perlu menambahkan API/database untuk data real-time."

### **Q: Bagaimana performa aplikasi?**
**A:** "Aplikasi menggunakan ListView.builder yang efisien, hanya render item yang terlihat. Hero animation juga dioptimalkan untuk performa."

### **Q: Apakah ada error handling?**
**A:** "Ada, untuk gambar yang tidak ditemukan kita gunakan errorBuilder yang menampilkan placeholder icon."

---

## 📋 **CHECKLIST SEBELUM PRESENTASI**

- [ ] Aplikasi sudah di-build dan bisa dijalankan
- [ ] Semua fitur berfungsi dengan baik
- [ ] Gambar assets sudah ada (atau siap dengan placeholder)
- [ ] Paham alur setiap fitur
- [ ] Siap menjelaskan setiap file
- [ ] Siap demo aplikasi
- [ ] Siap jawab pertanyaan dosen

---

## 🎤 **SCRIPT PRESENTASI SINGKAT (5 menit)**

### **Opening (30 detik)**
> "Selamat pagi/siang Pak/Bu. Saya akan mempresentasikan final project Pemrograman Mobile dengan judul 'Campus Event & Organization App'."

### **Penjelasan Aplikasi (1 menit)**
> "Aplikasi ini digunakan untuk menampilkan informasi event kampus dan kegiatan organisasi. Ada 3 halaman utama: Dashboard untuk ringkasan, Events untuk daftar event, dan Profile untuk informasi pembuat."

### **Struktur Project (1 menit)**
> "Project menggunakan struktur folder yang rapi. Folder lib/pages untuk halaman, lib/widgets untuk reusable widgets. Kita menggunakan ThemeData global untuk konsistensi desain."

### **Fitur Utama (1.5 menit)**
> "Fitur utama: navigasi dengan BottomNavigationBar, reusable widgets untuk kode yang rapi, Hero animation untuk transisi smooth, dan toggle deskripsi menggunakan setState."

### **Demo (1 menit)**
> "Sekarang saya akan demo aplikasi. [Jalankan demo sesuai bagian 7]"

### **Closing (30 detik)**
> "Demikian presentasi saya. Aplikasi ini menggunakan teknik basic-menengah Flutter sesuai requirement, tanpa API dan database. Terima kasih."

---

## 📚 **REFERENSI TAMBAHAN**

Jika dosen tanya lebih detail tentang:
- **Flutter**: https://flutter.dev
- **Material Design**: https://material.io
- **Dart Language**: https://dart.dev

---

**SELAMAT PRESENTASI! 🎉**
