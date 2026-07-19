# Ayocuci App - Redesign

Proyek ini adalah implementasi *redesign* antarmuka (UI) dari aplikasi kasir laundry **Ayocuci**. Pembaruan ini bertujuan untuk memberikan tampilan yang lebih modern, segar, estetik, dan *user-friendly*.

## 🚀 Fitur & Pembaruan UI

Berikut adalah daftar layar dan komponen yang telah direnovasi secara menyeluruh dalam versi ini:

### 1. 🏠 Navigasi & Beranda (Navbar & Home Screen)
- **Custom Bottom Navigation Bar**: Dibangun ulang dengan desain *modern* menggunakan `persistent_bottom_nav_bar_v2`. Menampilkan tombol **Order** melayang (floating) besar di tengah dengan efek bayangan menyala (*glow*). 
- **Transisi Instan**: Animasi geser (*slide*) saat berpindah tab dimatikan, menjadikan perpindahan menu di navbar terasa sangat cepat dan responsif tanpa *delay*.
- **Home Header**: Menampilkan foto profil bulat rapi dan penyajian sapaan awal.

### 2. 🔐 Autentikasi (Login & Register)
- **Login Screen**: 
  - Desain *clean* dan modern dengan label di luar kotak input.
  - Integrasi tombol masuk dengan **Google** menggunakan logo asli Google.
  - Terdapat opsi "Ingat saya" (Checkbox) dan "Lupa Password".
  - Tombol Login berbentuk *pill* besar berwarna oranye khas.
- **Register Screen**: 
  - Desain premium dengan header berlatar oranye solid yang memuat indikator *progress* (1 Kontak, 2 Data Anda, 3 Keamanan).
  - Tampilan kartu putih yang menutupi *background* (*overlapping*), dirancang responsif mengisi penuh layar ke bagian paling bawah (tanpa celah *home indicator* HP).
  - Avatar logo "melayang" di garis perbatasan antar seksi.

### 3. 📝 Order Screen
- Disesuaikan sehingga saat halaman dibuka, menu bar bawah otomatis disembunyikan agar kasir fokus pada pengisian nota pesanan.
- Menambahkan *input field* **"Keterangan (Opsional)"** untuk mencatat permintaan khusus pelanggan.
- Layout detail order dipertajam dengan tepian membulat dan visual yang minimalis.

### 4. 🕒 Status Screen
- *Search bar* khusus ditempatkan di atas untuk mencari ID nota / pelanggan.
- Penggantian ikon menu dari yang lama menjadi ikon **jam** (`Icons.access_time`).
- *TabBar* dioptimalkan.

### 5. 👤 Profile & Setting Screen
Pembenahan pada menu halaman profil dengan menambahkan beberapa kategori manajerial khusus yang dibungkus dalam desain *card* rapi:
- **Konfigurasi**:
  - Layanan & Produk
- **Keuangan**:
  - Kelola Kategori Keuangan
- **Printer**:
  - Kelola Printer & Nota
- **Support**:
  - Customer Support
  - Tutorial
  - Tentang Kami

## 🎨 Palet Warna Utama
- **Primary Orange**: `#xFFFF5A26` - Digunakan pada tombol, *active icon*, dan elemen fokus.
- **Latar Merah Muda Soft**: `#FFFEF2F2` - Digunakan untuk boks info peringatan (Info Box).
- **Teks**: Menggunakan variasi kontras abu-abu dan hitam.

## 🛠 Instalasi & Cara Menjalankan

1. Pastikan Anda memiliki Flutter SDK (versi ^3.11.0 direkomendasikan).
2. Lakukan clone atau unduh proyek ini.
3. Jalankan `flutter pub get` di dalam terminal.
4. Jalankan aplikasi di emulator atau *device* Anda dengan `flutter run`.
