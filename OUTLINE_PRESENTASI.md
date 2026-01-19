# 📋 OUTLINE PRESENTASI - QUICK REFERENCE

## ⏱️ **TIMELINE: 10-15 MENIT**

---

## 🎯 **1. OPENING (1 menit)**

**Ucapkan:**
> "Selamat pagi/siang Pak/Bu. Saya [Nama], NIM [NIM]. Saya akan mempresentasikan final project Pemrograman Mobile dengan judul **'Campus Event & Organization App'**."

**Tampilkan:**
- Judul aplikasi
- Screenshot aplikasi (jika ada)

---

## 📱 **2. PENJELASAN APLIKASI (2 menit)**

### **A. Tujuan Aplikasi**
> "Aplikasi ini digunakan untuk menampilkan informasi event kampus dan kegiatan organisasi mahasiswa. User bisa melihat daftar event, detail event, dan informasi pembuat aplikasi."

### **B. Fitur Utama**
1. **Dashboard** - Ringkasan statistik event
2. **Events** - Daftar semua event dengan kategori dan status
3. **Profile** - Informasi pembuat aplikasi

### **C. Teknologi**
- Framework: Flutter (Dart)
- Platform: Android
- Level: Basic-Menengah
- Tanpa API & Database (data hardcode)

---

## 🏗️ **3. STRUKTUR PROJECT (2 menit)**

**Tampilkan struktur folder:**
```
lib/
├── main.dart          → Entry point, theme, navigasi
├── pages/             → 4 halaman aplikasi
│   ├── dashboard_page.dart
│   ├── event_page.dart
│   ├── detail_event.dart
│   └── profile_page.dart
└── widgets/           → 3 reusable widgets
    ├── event_card.dart
    ├── summary_card.dart
    └── profile_card.dart
```

**Jelaskan:**
> "Project menggunakan struktur folder yang rapi. Folder `pages/` untuk halaman, `widgets/` untuk komponen yang bisa digunakan berulang kali."

---

## 💻 **4. PENJELASAN KODE (4-5 menit)**

### **A. main.dart - Entry Point**

**Jelaskan:**
1. **MaterialApp**: Widget utama Flutter
2. **ThemeData**: Tema global (warna indigo, background abu-abu)
3. **StatefulWidget**: Untuk navigasi yang bisa berubah
4. **BottomNavigationBar**: 3 menu (Dashboard, Events, Profile)

**Kode Penting:**
```dart
// Theme global
theme: ThemeData(
  primarySwatch: Colors.indigo,
  scaffoldBackgroundColor: Colors.grey[100],
)

// Navigasi dengan setState
void _onItemTapped(int index) {
  setState(() {
    _currentIndex = index;
  });
}
```

---

### **B. event_page.dart - Daftar Event**

**Jelaskan:**
1. **Data Hardcode**: List 6 event dalam method `getEvents()`
2. **ListView.builder**: Efisien untuk list panjang
3. **EventCard**: Reusable widget untuk menampilkan event
4. **Navigator.push**: Navigasi ke Detail Event

**Kode Penting:**
```dart
// Data hardcode
static List<Map<String, dynamic>> getEvents() {
  return [
    {
      'title': 'Seminar Teknologi Informasi',
      'organizer': 'HIMTI',
      'category': 'Seminar',
      'status': 'Upcoming',
      // ...
    },
  ];
}

// ListView.builder
ListView.builder(
  itemCount: events.length,
  itemBuilder: (context, index) {
    return EventCard(event: events[index], ...);
  },
)
```

---

### **C. widgets/event_card.dart - Reusable Widget**

**Jelaskan:**
1. **Reusable Widget**: Bisa digunakan berkali-kali
2. **Hero Animation**: Transisi gambar yang smooth
3. **Parameter**: Menerima event data dan onTap callback

**Kode Penting:**
```dart
class EventCard extends StatelessWidget {
  final Map<String, dynamic> event;
  final VoidCallback onTap;
  
  // Hero animation
  Hero(
    tag: event['title'],
    child: Image.asset(event['image']),
  )
}
```

**Cara Jelaskan:**
> "EventCard adalah reusable widget. Kita bisa menggunakannya berkali-kali dengan data berbeda. Hero animation membuat transisi gambar terlihat smooth saat navigasi."

---

### **D. detail_event.dart - Detail Event**

**Jelaskan:**
1. **StatefulWidget**: Untuk toggle deskripsi
2. **setState()**: Update UI saat state berubah
3. **Conditional Rendering**: Tampilkan/sembunyikan deskripsi

**Kode Penting:**
```dart
// State
bool _showDescription = false;

// Toggle dengan setState
onPressed: () {
  setState(() {
    _showDescription = !_showDescription;
  });
}

// Conditional rendering
if (_showDescription) ...[
  Text(widget.event['description']),
]
```

**Cara Jelaskan:**
> "Di halaman Detail Event, kita bisa toggle deskripsi. Menggunakan StatefulWidget dan setState(). Saat user klik tombol, state berubah dan UI otomatis update."

---

### **E. widgets/summary_card.dart - Reusable Widget**

**Jelaskan:**
1. **Reusable**: Digunakan 3 kali di Dashboard
2. **Parameter**: icon, title, count, color
3. **Konsistensi**: Semua summary card memiliki style yang sama

**Cara Jelaskan:**
> "SummaryCard digunakan 3 kali di Dashboard untuk menampilkan Total Event, Upcoming, dan Ongoing. Ini menghindari duplikasi kode dan membuat desain konsisten."

---

## 🎨 **5. FITUR & TEKNIK (2-3 menit)**

### **A. Reusable Widgets**
- ✅ EventCard
- ✅ SummaryCard
- ✅ ProfileCard

**Keuntungan:**
- Kode lebih rapi
- Mudah dirawat
- Konsistensi UI

---

### **B. ThemeData Global**
- Warna indigo untuk primary
- Background abu-abu terang
- Card dengan border radius 12
- Konsisten di semua halaman

---

### **C. Hero Animation**
- Transisi gambar yang smooth
- Tag Hero harus sama di source dan destination
- Meningkatkan user experience

---

### **D. StatefulWidget & setState**
- Untuk interaksi user (toggle, navigasi)
- setState() untuk update UI
- Contoh: Toggle deskripsi, navigasi

---

## 🎬 **6. DEMO APLIKASI (2-3 menit)**

### **Langkah Demo:**

1. **Buka Aplikasi**
   - Tampilkan Dashboard
   - Jelaskan summary cards

2. **Klik Menu Events**
   - Scroll list event
   - Jelaskan EventCard

3. **Klik Event**
   - Tunjukkan Hero animation
   - Toggle deskripsi (show/hide)
   - Jelaskan date/time

4. **Klik Menu Profile**
   - Tunjukkan ProfileCard
   - Jelaskan informasi pembuat

---

## ❓ **7. ANTISIPASI PERTANYAAN (1-2 menit)**

### **Q: Kenapa tidak pakai API?**
**A:** "Sesuai requirement project, kita tidak menggunakan API dan database. Data disimpan hardcode. Untuk production, bisa ditambahkan API integration."

### **Q: Bagaimana menambah event baru?**
**A:** "Tambah data baru di method getEvents() di event_page.dart. Untuk production, bisa diintegrasikan dengan database."

### **Q: Apakah bisa di-deploy?**
**A:** "Bisa, dengan `flutter build apk`. Tapi perlu menambahkan API/database untuk data real-time."

### **Q: Bagaimana performa?**
**A:** "Menggunakan ListView.builder yang efisien, hanya render item yang terlihat. Hero animation juga dioptimalkan."

---

## 🎯 **8. CLOSING (1 menit)**

**Ucapkan:**
> "Demikian presentasi saya. Aplikasi ini menggunakan teknik basic-menengah Flutter sesuai requirement:
> - ✅ Reusable Widgets
> - ✅ ThemeData Global
> - ✅ Hero Animation
> - ✅ StatefulWidget & setState
> - ✅ Tanpa API & Database
> 
> Terima kasih atas perhatiannya. Saya siap menerima pertanyaan."

---

## 📝 **CHECKLIST SEBELUM PRESENTASI**

- [ ] Aplikasi sudah di-build dan bisa dijalankan
- [ ] Semua fitur berfungsi dengan baik
- [ ] Gambar assets sudah ada (atau siap dengan placeholder)
- [ ] Paham alur setiap fitur
- [ ] Paham setiap file dan fungsinya
- [ ] Siap demo aplikasi
- [ ] Siap jawab pertanyaan dosen
- [ ] Baca PANDUAN_PRESENTASI.md untuk detail
- [ ] Baca PENJELASAN_KODE_DETAIL.md untuk penjelasan kode

---

## 🎤 **TIPS PRESENTASI**

1. **Percaya Diri**: Anda sudah membuat aplikasi yang lengkap
2. **Jelaskan dengan Sederhana**: Gunakan bahasa yang mudah dipahami
3. **Demo dengan Tenang**: Jangan terburu-buru saat demo
4. **Jawab dengan Jujur**: Jika tidak tahu, katakan akan belajar lebih lanjut
5. **Highlight Teknik**: Tekankan reusable widgets, theme global, hero animation

---

## 📚 **FILE REFERENSI**

1. **PANDUAN_PRESENTASI.md** - Panduan lengkap presentasi
2. **PENJELASAN_KODE_DETAIL.md** - Penjelasan detail setiap kode
3. **OUTLINE_PRESENTASI.md** - File ini (quick reference)

---

**SELAMAT PRESENTASI! 🎉**

**Ingat:**
- Tenang dan percaya diri
- Jelaskan dengan sederhana
- Highlight teknik yang digunakan
- Demo dengan baik
- Siap jawab pertanyaan
