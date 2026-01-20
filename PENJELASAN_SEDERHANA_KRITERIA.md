# 📚 PENJELASAN SEDERHANA KRITERIA PENILAIAN
## Untuk Presentasi ke Dosen

---

## 🎯 **3. LOGIKA & STATE (20%)**

### **✅ Status: SANGAT SESUAI**

### **Penjelasan Sederhana:**

#### **A. Apa itu State?**
**State** = Data yang bisa berubah dan mempengaruhi tampilan aplikasi.

**Contoh di aplikasi kita:**
1. **State untuk Navigasi** → Menyimpan menu mana yang aktif (Dashboard/Events/Profile)
2. **State untuk Toggle** → Menyimpan apakah deskripsi ditampilkan atau tidak

---

#### **B. Di Mana State Digunakan?**

##### **1. State untuk Navigasi (di `lib/main.dart`)**

**Kode:**
```dart
class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;  // ← INI STATE: Menyimpan menu yang aktif (0=Dashboard, 1=Events, 2=Profile)
  
  void _onItemTapped(int index) {
    setState(() {  // ← INI SETSTATE: Update state dan refresh tampilan
      _currentIndex = index;  // Ubah state menjadi menu yang diklik
    });
  }
}
```

**Cara Menjelaskan:**
> "Pak/Bu, di file `main.dart` kita punya **state** bernama `_currentIndex` yang menyimpan angka 0, 1, atau 2. Angka ini menentukan menu mana yang aktif. Saat user klik menu Events, kita panggil `setState()` untuk mengubah `_currentIndex` menjadi 1, dan Flutter otomatis menampilkan halaman Events."

**Alur Kerja:**
1. User klik menu "Events" → `_onItemTapped(1)` dipanggil
2. Di dalam `setState()`, kita ubah `_currentIndex = 1`
3. Flutter rebuild widget → Tampilkan `_pages[1]` yaitu EventPage

---

##### **2. State untuk Toggle Deskripsi (di `lib/pages/detail_event.dart`)**

**Kode:**
```dart
class _DetailEventPageState extends State<DetailEventPage> {
  bool _showDescription = false;  // ← INI STATE: false = sembunyi, true = tampilkan
  
  // Saat user klik tombol expand/collapse
  IconButton(
    onPressed: () {
      setState(() {  // ← INI SETSTATE: Update state
        _showDescription = !_showDescription;  // Ubah dari false ke true, atau sebaliknya
      });
    },
  )
  
  // Conditional rendering berdasarkan state
  if (_showDescription) ...[  // ← INI LOGIKA: Jika true, tampilkan deskripsi
    Text(widget.event['description']),
  ],
}
```

**Cara Menjelaskan:**
> "Pak/Bu, di halaman Detail Event, kita punya **state** bernama `_showDescription` yang berisi true atau false. Awalnya false (deskripsi disembunyikan). Saat user klik tombol expand, kita panggil `setState()` untuk mengubah menjadi true, dan Flutter otomatis menampilkan deskripsi. Ini contoh penggunaan **conditional logic** dengan `if` statement."

**Alur Kerja:**
1. Awal: `_showDescription = false` → Deskripsi tidak ditampilkan
2. User klik tombol expand → `setState()` dipanggil
3. `_showDescription` berubah menjadi `true`
4. Flutter rebuild → Karena `if (_showDescription)` true, deskripsi ditampilkan

---

#### **C. Conditional Logic (Logika Bersyarat)**

##### **1. Conditional Rendering dengan `if`**

**Kode:**
```dart
// lib/pages/detail_event.dart
if (_showDescription) ...[  // ← Jika state true, tampilkan widget ini
  const SizedBox(height: 8),
  Container(
    child: Text(widget.event['description']),
  ),
]
```

**Penjelasan:**
> "Kita menggunakan `if` statement untuk menampilkan widget hanya jika kondisi terpenuhi. Jika `_showDescription` true, maka widget deskripsi ditampilkan. Jika false, widget tidak ditampilkan."

---

##### **2. Switch Case untuk Kategori dan Status**

**Kode:**
```dart
// lib/widgets/event_card.dart
IconData getCategoryIcon(String category) {
  switch (category) {  // ← INI LOGIKA: Pilih icon berdasarkan kategori
    case 'Seminar':
      return Icons.school;  // ← Jika kategori "Seminar", pakai icon school
    case 'Lomba':
      return Icons.emoji_events;  // ← Jika kategori "Lomba", pakai icon emoji_events
    case 'Organisasi':
      return Icons.groups;  // ← Jika kategori "Organisasi", pakai icon groups
    default:
      return Icons.category;  // ← Jika tidak ada yang cocok, pakai icon category
  }
}
```

**Cara Menjelaskan:**
> "Pak/Bu, kita menggunakan **switch case** untuk memilih icon berdasarkan kategori event. Jika kategori adalah 'Seminar', kita pakai icon `Icons.school`. Jika 'Lomba', pakai `Icons.emoji_events`. Ini contoh **conditional logic** untuk menentukan tampilan berdasarkan data."

---

##### **3. Ternary Operator**

**Kode:**
```dart
// lib/pages/detail_event.dart
Icon(
  _showDescription ? Icons.expand_less : Icons.expand_more,  // ← Jika true pakai expand_less, jika false pakai expand_more
)
```

**Penjelasan:**
> "Kita menggunakan **ternary operator** untuk memilih icon berdasarkan state. Jika `_showDescription` true, tampilkan icon `expand_less` (panah atas). Jika false, tampilkan icon `expand_more` (panah bawah)."

---

#### **D. Data Processing (Pengolahan Data)**

##### **1. Filter Data Berdasarkan Status**

**Kode:**
```dart
// lib/pages/dashboard_page.dart
final events = getEvents();  // Ambil semua event

// Filter: Ambil hanya event dengan status "Upcoming"
final upcomingEvents = events.where((e) => e['status'] == 'Upcoming').length;
// ↑ INI LOGIKA: Filter data menggunakan where() dan kondisi

// Filter: Ambil hanya event dengan status "Ongoing"
final ongoingEvents = events.where((e) => e['status'] == 'Ongoing').length;
```

**Cara Menjelaskan:**
> "Pak/Bu, di Dashboard kita perlu menghitung berapa event yang statusnya 'Upcoming' dan 'Ongoing'. Kita menggunakan method `where()` untuk **filter data**. Method ini mengambil hanya event yang memenuhi kondisi tertentu. Setelah itu kita hitung jumlahnya dengan `.length`."

**Alur Kerja:**
1. Ambil semua event dari `getEvents()`
2. Filter dengan `where()` → Hanya ambil yang statusnya "Upcoming"
3. Hitung jumlahnya dengan `.length`
4. Tampilkan di SummaryCard

---

##### **2. Count Data untuk Statistik**

**Kode:**
```dart
// lib/pages/dashboard_page.dart
final totalEvents = events.length;  // ← Hitung total semua event
final upcomingEvents = events.where((e) => e['status'] == 'Upcoming').length;  // ← Hitung event Upcoming
final ongoingEvents = events.where((e) => e['status'] == 'Ongoing').length;  // ← Hitung event Ongoing
```

**Penjelasan:**
> "Kita melakukan **data processing** untuk menghitung statistik. `events.length` menghitung total event. `events.where(...).length` menghitung event yang memenuhi kondisi tertentu. Hasilnya ditampilkan di SummaryCard."

---

#### **E. Event Handling (Penanganan Event)**

##### **1. onTap untuk Navigasi**

**Kode:**
```dart
// lib/widgets/event_card.dart
InkWell(
  onTap: onTap,  // ← INI EVENT HANDLING: Saat card diklik, jalankan fungsi onTap
  child: Card(...),
)

// Di event_page.dart
EventCard(
  event: event,
  onTap: () {  // ← INI CALLBACK: Fungsi yang dijalankan saat diklik
    Navigator.push(  // ← Navigasi ke halaman detail
      context,
      MaterialPageRoute(
        builder: (context) => DetailEventPage(event: event),
      ),
    );
  },
)
```

**Cara Menjelaskan:**
> "Pak/Bu, saat user **klik** EventCard, kita menggunakan `onTap` untuk menangani klik tersebut. Di dalam `onTap`, kita panggil `Navigator.push()` untuk **navigasi** ke halaman Detail Event. Ini contoh **event handling** untuk interaksi user."

---

##### **2. onPressed untuk Button**

**Kode:**
```dart
// lib/pages/detail_event.dart
IconButton(
  onPressed: () {  // ← INI EVENT HANDLING: Saat button diklik
    setState(() {
      _showDescription = !_showDescription;  // Toggle state
    });
  },
  icon: Icon(...),
)
```

**Penjelasan:**
> "Saat user klik IconButton untuk toggle deskripsi, kita gunakan `onPressed` untuk menangani klik. Di dalamnya kita panggil `setState()` untuk mengubah state `_showDescription`."

---

### **📋 RINGKASAN LOGIKA & STATE:**

| Konsep | Di Mana? | Contoh |
|--------|----------|--------|
| **State** | `main.dart`, `detail_event.dart` | `_currentIndex`, `_showDescription` |
| **setState()** | Saat perlu update UI | Navigasi, toggle deskripsi |
| **Conditional Logic** | `detail_event.dart` | `if (_showDescription)` |
| **Switch Case** | `event_card.dart` | `getCategoryIcon()`, `getStatusColor()` |
| **Data Processing** | `dashboard_page.dart` | Filter dengan `where()`, count dengan `length` |
| **Event Handling** | Semua halaman | `onTap`, `onPressed` |

---

## 🎯 **4. MANAJEMEN DATA (15%)**

### **✅ Status: SESUAI**

### **Penjelasan Sederhana:**

#### **A. Struktur Data**

##### **1. Apa itu List<Map<String, dynamic>>?**

**Penjelasan Sederhana:**
- **List** = Kumpulan data (seperti array)
- **Map** = Data dengan key-value (seperti dictionary)
- **String, dynamic** = Key berupa string, value bisa apa saja

**Contoh:**
```dart
// lib/pages/event_page.dart
static List<Map<String, dynamic>> getEvents() {
  return [
    // Event 1
    {
      'title': 'Seminar Teknologi Informasi',  // ← Key: 'title', Value: 'Seminar...'
      'organizer': 'HIMTI',  // ← Key: 'organizer', Value: 'HIMTI'
      'category': 'Seminar',  // ← Key: 'category', Value: 'Seminar'
      'status': 'Upcoming',  // ← Key: 'status', Value: 'Upcoming'
      'date': DateTime(...),  // ← Key: 'date', Value: DateTime object
      'time': '09:00 WIB',  // ← Key: 'time', Value: '09:00 WIB'
    },
    // Event 2
    {
      'title': 'Lomba Programming Competition',
      'organizer': 'Fakultas Teknik',
      // ... dst
    },
    // ... event lainnya
  ];
}
```

**Cara Menjelaskan:**
> "Pak/Bu, kita menyimpan data event dalam bentuk **List** yang berisi **Map**. Setiap Map adalah satu event dengan key seperti 'title', 'organizer', 'category', dll. Ini seperti tabel Excel: List adalah baris-baris, Map adalah kolom-kolom. Kita punya 6 event dalam List ini."

**Visualisasi:**
```
List<Map> = [
  {title: 'Seminar...', organizer: 'HIMTI', ...},  ← Event 1
  {title: 'Lomba...', organizer: 'Fakultas Teknik', ...},  ← Event 2
  {title: 'Rapat...', organizer: 'BEM', ...},  ← Event 3
  ... dst
]
```

---

#### **B. Akses Data**

##### **1. Static Method getEvents()**

**Kode:**
```dart
// lib/pages/event_page.dart
static List<Map<String, dynamic>> getEvents() {  // ← INI METHOD: Mengembalikan List event
  return [
    // ... data event
  ];
}

// Cara menggunakan:
final events = EventPage.getEvents();  // ← Panggil method untuk dapat data
```

**Cara Menjelaskan:**
> "Pak/Bu, kita membuat method `getEvents()` yang mengembalikan List berisi semua event. Method ini **static**, artinya bisa dipanggil tanpa membuat object. Kita bisa memanggil `EventPage.getEvents()` dari mana saja untuk mendapatkan data event."

**Kenapa Static?**
- Bisa dipanggil tanpa membuat instance: `EventPage.getEvents()`
- Data terpusat di satu tempat
- Mudah diakses dari berbagai halaman

---

##### **2. Menggunakan Data di Berbagai Halaman**

**Kode:**
```dart
// Di dashboard_page.dart
final events = EventPage.getEvents();  // ← Ambil data dari EventPage

// Di event_page.dart
final events = getEvents();  // ← Ambil data dari method sendiri
```

**Penjelasan:**
> "Data event bisa digunakan di berbagai halaman. Dashboard menggunakan data ini untuk menghitung statistik. EventPage menggunakan data ini untuk menampilkan list event. Semua menggunakan data yang sama, jadi konsisten."

---

#### **C. Pengolahan Data (Data Processing)**

##### **1. Filter Data**

**Kode:**
```dart
// lib/pages/dashboard_page.dart
final events = getEvents();  // Ambil semua event (6 event)

// Filter: Hanya ambil event dengan status "Upcoming"
final upcomingEvents = events.where((e) => e['status'] == 'Upcoming').length;
// ↑ Method where() = filter
// ↑ (e) => e['status'] == 'Upcoming' = kondisi filter
// ↑ .length = hitung jumlah hasil filter

// Hasil: upcomingEvents = 2 (karena ada 2 event dengan status "Upcoming")
```

**Cara Menjelaskan:**
> "Pak/Bu, untuk menghitung event yang statusnya 'Upcoming', kita menggunakan method `where()`. Method ini seperti **filter**: ambil hanya data yang memenuhi kondisi. Kondisinya adalah `e['status'] == 'Upcoming'` (status harus 'Upcoming'). Setelah itu kita hitung dengan `.length`."

**Step by Step:**
1. `events` = [Event1, Event2, Event3, Event4, Event5, Event6] (6 event)
2. `events.where((e) => e['status'] == 'Upcoming')` = [Event1, Event3] (2 event)
3. `.length` = 2

---

##### **2. Format Data untuk Display**

**Kode:**
```dart
// lib/pages/event_page.dart
'date': now.add(const Duration(days: 5)).copyWith(hour: 9, minute: 0),  // ← DateTime object
'dateString': formatDate(now.add(const Duration(days: 5))),  // ← String "23/1/2025"
'time': '09:00 WIB',  // ← String untuk display
```

**Penjelasan:**
> "Kita menyimpan data dalam 2 format: `date` sebagai DateTime object untuk perhitungan, dan `dateString` sebagai String untuk ditampilkan. Ini memudahkan: DateTime untuk logika, String untuk tampilan."

---

#### **D. Menampilkan Data**

##### **1. ListView.builder**

**Kode:**
```dart
// lib/pages/event_page.dart
ListView.builder(
  itemCount: events.length,  // ← Jumlah item dalam list (6 event)
  itemBuilder: (context, index) {  // ← Fungsi untuk membuat widget setiap item
    final event = events[index];  // ← Ambil event ke-index
    return EventCard(  // ← Buat widget EventCard untuk event ini
      event: event,
      onTap: () { ... },
    );
  },
)
```

**Cara Menjelaskan:**
> "Pak/Bu, untuk menampilkan list event, kita menggunakan `ListView.builder`. Ini seperti **loop**: untuk setiap event dalam List, buat satu EventCard. `itemCount` menentukan berapa kali loop berjalan (6 kali untuk 6 event). `itemBuilder` adalah fungsi yang membuat widget untuk setiap item."

**Alur Kerja:**
1. `itemCount: 6` → Loop 6 kali
2. `index = 0` → Ambil `events[0]`, buat EventCard
3. `index = 1` → Ambil `events[1]`, buat EventCard
4. ... dst sampai index 5

---

##### **2. Mengakses Data dalam Map**

**Kode:**
```dart
// lib/widgets/event_card.dart
Text(
  event['title'],  // ← Akses value dengan key 'title'
)

Text(
  event['organizer'],  // ← Akses value dengan key 'organizer'
)

Chip(
  label: Text(event['status']),  // ← Akses value dengan key 'status'
)
```

**Penjelasan:**
> "Untuk mengakses data dalam Map, kita gunakan key dalam kurung siku. `event['title']` mengambil value dari key 'title'. Ini seperti mengambil nilai dari dictionary."

---

### **📋 RINGKASAN MANAJEMEN DATA:**

| Konsep | Di Mana? | Contoh |
|--------|----------|--------|
| **Data Structure** | `event_page.dart` | `List<Map<String, dynamic>>` |
| **Akses Data** | Semua halaman | `EventPage.getEvents()` |
| **Filter Data** | `dashboard_page.dart` | `events.where((e) => e['status'] == 'Upcoming')` |
| **Count Data** | `dashboard_page.dart` | `.length` |
| **Format Data** | `event_page.dart` | `dateString`, `time` |
| **Display Data** | `event_page.dart` | `ListView.builder` |
| **Akses Map** | Semua widget | `event['title']`, `event['organizer']` |

---

## 🎯 **6. STRUKTUR KODE (10%)**

### **✅ Status: SANGAT SESUAI**

### **Penjelasan Sederhana:**

#### **A. Struktur Folder**

**Struktur Project:**
```
finalproject/
├── lib/                    ← Folder untuk source code
│   ├── main.dart          ← Entry point aplikasi
│   ├── pages/             ← Folder untuk halaman-halaman
│   │   ├── dashboard_page.dart    ← Halaman Dashboard
│   │   ├── event_page.dart        ← Halaman Events
│   │   ├── detail_event.dart      ← Halaman Detail Event
│   │   └── profile_page.dart      ← Halaman Profile
│   └── widgets/           ← Folder untuk reusable widgets
│       ├── event_card.dart        ← Widget untuk card event
│       ├── summary_card.dart     ← Widget untuk summary card
│       └── profile_card.dart      ← Widget untuk profile card
├── assets/                ← Folder untuk gambar/file statis
│   └── images/
└── pubspec.yaml           ← File konfigurasi dependencies
```

**Cara Menjelaskan:**
> "Pak/Bu, struktur folder project ini terorganisir dengan baik. Folder `lib/` berisi semua source code. Di dalamnya ada folder `pages/` untuk halaman-halaman aplikasi dan folder `widgets/` untuk komponen yang bisa digunakan berulang kali. Ini membuat kode mudah dicari dan dirawat."

**Kenapa Struktur Ini?**
- ✅ Mudah mencari file (halaman di `pages/`, widget di `widgets/`)
- ✅ Mudah memahami struktur project
- ✅ Mengikuti best practices Flutter

---

#### **B. Organisasi File**

##### **1. Satu File untuk Satu Widget/Halaman**

**Contoh:**
- `dashboard_page.dart` → Hanya berisi DashboardPage
- `event_page.dart` → Hanya berisi EventPage
- `event_card.dart` → Hanya berisi EventCard

**Cara Menjelaskan:**
> "Setiap file memiliki satu tujuan yang jelas. File `dashboard_page.dart` hanya berisi widget DashboardPage. File `event_card.dart` hanya berisi widget EventCard. Ini membuat kode mudah dipahami dan dirawat."

**Keuntungan:**
- ✅ Mudah mencari kode
- ✅ Mudah mengubah satu bagian tanpa mempengaruhi yang lain
- ✅ Kode lebih rapi dan terorganisir

---

##### **2. Naming Convention yang Jelas**

**Contoh:**
- `dashboard_page.dart` → File untuk halaman dashboard
- `event_card.dart` → File untuk widget card event
- `profile_card.dart` → File untuk widget card profile

**Penjelasan:**
> "Nama file mengikuti pola yang jelas: `[nama]_page.dart` untuk halaman, `[nama]_card.dart` untuk card widget. Ini membuat kita langsung tahu isi file dari namanya."

---

#### **C. Reusable Widgets (Widget yang Bisa Digunakan Berulang)**

##### **1. EventCard**

**Kode:**
```dart
// lib/widgets/event_card.dart
class EventCard extends StatelessWidget {
  final Map<String, dynamic> event;  // ← Parameter: data event
  final VoidCallback onTap;  // ← Parameter: fungsi saat diklik
  
  // Widget ini bisa digunakan berkali-kali dengan data berbeda
}
```

**Penggunaan:**
```dart
// lib/pages/event_page.dart
ListView.builder(
  itemBuilder: (context, index) {
    return EventCard(  // ← Pakai EventCard untuk event 1
      event: events[0],
      onTap: () { ... },
    );
    // EventCard bisa dipakai lagi untuk event 2, 3, dst dengan data berbeda
  },
)
```

**Cara Menjelaskan:**
> "Pak/Bu, EventCard adalah **reusable widget**. Artinya kita bisa menggunakannya berkali-kali dengan data berbeda. Di EventPage, kita menggunakan EventCard 6 kali (untuk 6 event) dengan data yang berbeda-beda. Ini menghindari duplikasi kode: kita tidak perlu menulis kode card 6 kali, cukup buat sekali dan pakai berkali-kali."

**Keuntungan:**
- ✅ Tidak perlu duplikasi kode
- ✅ Jika perlu ubah desain card, cukup ubah di satu tempat
- ✅ Konsistensi UI

---

##### **2. SummaryCard**

**Kode:**
```dart
// lib/widgets/summary_card.dart
class SummaryCard extends StatelessWidget {
  final IconData icon;  // ← Parameter: icon
  final String title;   // ← Parameter: judul
  final int count;      // ← Parameter: angka
  final Color color;    // ← Parameter: warna
}
```

**Penggunaan:**
```dart
// lib/pages/dashboard_page.dart
Row(
  children: [
    SummaryCard(  // ← Card 1: Total Event
      icon: Icons.event,
      title: 'Total Event',
      count: totalEvents,
      color: Colors.indigo,
    ),
    SummaryCard(  // ← Card 2: Upcoming
      icon: Icons.upcoming,
      title: 'Upcoming',
      count: upcomingEvents,
      color: Colors.blue,
    ),
    SummaryCard(  // ← Card 3: Ongoing
      icon: Icons.play_circle_outline,
      title: 'Ongoing',
      count: ongoingEvents,
      color: Colors.green,
    ),
  ],
)
```

**Cara Menjelaskan:**
> "Pak/Bu, SummaryCard juga reusable widget. Kita menggunakannya 3 kali di Dashboard dengan parameter berbeda: satu untuk Total Event, satu untuk Upcoming, satu untuk Ongoing. Tanpa reusable widget, kita harus menulis kode card 3 kali. Dengan reusable widget, cukup tulis sekali dan pakai 3 kali dengan parameter berbeda."

---

##### **3. ProfileCard**

**Kode:**
```dart
// lib/widgets/profile_card.dart
class ProfileCard extends StatelessWidget {
  final String name;  // ← Parameter: nama
  final String nim;   // ← Parameter: NIM
  final String imagePath;  // ← Parameter: path foto
}
```

**Penggunaan:**
```dart
// lib/pages/profile_page.dart
ProfileCard(  // ← Card untuk Pradigdya Rafly
  name: 'Pradigdya Rafly',
  nim: '2313010631',
  imagePath: 'assets/images/profile1.jpg',
),

ProfileCard(  // ← Card untuk Mikhael Dava
  name: 'Mikhael Dava',
  nim: '2313010650',
  imagePath: 'assets/images/profile2.jpg',
),
```

**Penjelasan:**
> "ProfileCard digunakan 2 kali di ProfilePage: satu untuk Pradigdya Rafly, satu untuk Mikhael Dava. Setiap ProfileCard menggunakan data yang berbeda (nama, NIM, foto) tapi struktur dan desainnya sama."

---

#### **D. Helper Methods (Method Pembantu)**

##### **1. getCategoryIcon()**

**Kode:**
```dart
// lib/widgets/event_card.dart
IconData getCategoryIcon(String category) {
  switch (category) {
    case 'Seminar': return Icons.school;
    case 'Lomba': return Icons.emoji_events;
    case 'Organisasi': return Icons.groups;
    default: return Icons.category;
  }
}

// Penggunaan:
Icon(
  getCategoryIcon(event['category']),  // ← Panggil method untuk dapat icon
)
```

**Cara Menjelaskan:**
> "Kita membuat method `getCategoryIcon()` yang mengembalikan icon berdasarkan kategori. Method ini digunakan di EventCard untuk menampilkan icon yang sesuai. Ini contoh **helper method**: method kecil yang membantu tugas tertentu."

**Keuntungan:**
- ✅ Logika terpusat di satu tempat
- ✅ Mudah diubah (ubah di satu tempat, semua ikut berubah)
- ✅ Kode lebih rapi

---

##### **2. getStatusColor()**

**Kode:**
```dart
// lib/widgets/event_card.dart
Color getStatusColor(String status) {
  switch (status) {
    case 'Upcoming': return Colors.blue;
    case 'Ongoing': return Colors.green;
    case 'Finished': return Colors.grey;
    default: return Colors.grey;
  }
}

// Penggunaan:
Chip(
  backgroundColor: getStatusColor(event['status']),  // ← Panggil method untuk dapat warna
)
```

**Penjelasan:**
> "Method `getStatusColor()` mengembalikan warna berdasarkan status event. Method ini digunakan untuk memberikan warna pada Chip status. Ini membuat kode lebih rapi dan mudah dirawat."

---

#### **E. Komentar Kode**

**Contoh:**
```dart
// lib/pages/dashboard_page.dart
// Mengambil data event
final events = getEvents();

// Menghitung jumlah event berdasarkan status
final totalEvents = events.length;
final upcomingEvents = events.where((e) => e['status'] == 'Upcoming').length;
```

**Cara Menjelaskan:**
> "Kode dilengkapi dengan **komentar** yang menjelaskan apa yang dilakukan setiap bagian. Ini membantu memahami kode, terutama untuk developer lain atau saat kita lupa setelah beberapa waktu."

---

### **📋 RINGKASAN STRUKTUR KODE:**

| Aspek | Di Mana? | Contoh |
|-------|----------|--------|
| **Folder Structure** | Project root | `lib/pages/`, `lib/widgets/` |
| **File Organization** | Semua file | Satu file = satu widget/halaman |
| **Naming Convention** | Semua file | `[nama]_page.dart`, `[nama]_card.dart` |
| **Reusable Widgets** | `lib/widgets/` | EventCard, SummaryCard, ProfileCard |
| **Helper Methods** | Di dalam widget | `getCategoryIcon()`, `getStatusColor()` |
| **Komentar** | Semua file | Penjelasan di setiap bagian penting |

---

## 🎯 **CARA MENJELASKAN KE DOSEN (RINGKASAN)**

### **Untuk Logika & State (20%):**

> "Pak/Bu, untuk **logika dan state**, kita menggunakan **StatefulWidget** dengan **setState()**. Di `main.dart`, kita punya state `_currentIndex` untuk navigasi. Saat user klik menu, kita panggil `setState()` untuk update state dan Flutter otomatis menampilkan halaman yang sesuai. Di Detail Event, kita punya state `_showDescription` untuk toggle deskripsi. Kita juga menggunakan **conditional logic** seperti `if` statement dan `switch case` untuk menentukan tampilan berdasarkan kondisi."

### **Untuk Manajemen Data (15%):**

> "Pak/Bu, untuk **manajemen data**, kita menyimpan data event dalam **List<Map<String, dynamic>>**. Data disimpan dalam method `getEvents()` yang bisa diakses dari berbagai halaman. Kita melakukan **data processing** seperti filter dengan `where()` untuk mengambil event berdasarkan status, dan count dengan `length` untuk menghitung statistik. Data ditampilkan menggunakan `ListView.builder` yang efisien."

### **Untuk Struktur Kode (10%):**

> "Pak/Bu, untuk **struktur kode**, kita menggunakan struktur folder yang rapi: `pages/` untuk halaman dan `widgets/` untuk reusable widgets. Kita membuat 3 reusable widgets: EventCard, SummaryCard, dan ProfileCard yang bisa digunakan berkali-kali dengan data berbeda. Ini menghindari duplikasi kode dan membuat kode lebih mudah dirawat. Setiap file memiliki satu tujuan yang jelas dan dilengkapi dengan komentar."

---

**SELAMAT PRESENTASI! 🎉**
