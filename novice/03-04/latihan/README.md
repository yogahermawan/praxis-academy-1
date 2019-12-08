### Aksesibilitas
Desain perangkat yang dapat digunakan oleh penyandang disabilitas. Berikut aplikasi-aplikasi untuk test aksesibilitas android. 
Contoh aplikasi [android-BasicAccessibility](https://github.com/googlearchive/android-BasicAccessibility). 
Konfigurasi `build.gradle` sesuai yang dibutuhkan. Jalankan aplikasi dengan menggunakan android studio dan 
aktifkan talkback pada android untuk memberi tahu isi tampilan aplikasi.\
![]()\
Contoh aplikasi [basic-android-accessibility](https://github.com/googlecodelabs/basic-android-accessibility/archive/master.zip). 
Buka dengan android studio, pilih java/kotlin. File sumber berada di `app/java` dan seluruh file layout berada di `app/res/layout`. 

<img src="" width="300">

Aktifkan Talkback, `Setelan>Aksesibilitas>Talkback>switch on`. 
Tutorial talkback dapat dicoba seperti gambar berikut pada `setelan talkback>tutorial talkback`:\
![]()\
Terdapat 5 pelajaran dasar, yaitu Navigasi Dasar, Menggulir, Menu Talkback, Navigasi Teks, Mengedit Teks. 
Menggunakan talkback, klik sekali untuk mendeskripsikan item dan klik dua kali untuk memilih item. 
Untuk menggeser layar/scroll menggunakan dua jari. Coba menggunakan talkback pada aplikasi yang telah dijalankan tadi. 
Tool layout bound, untuk mengetahui lebar item pada aplikasi. Aktifkan dengan `Setelan>Sistem>Opsi developer>Tampilkan batas tata letak>switch on`.\
![]()\
Menggunakan Accessibility Scanner, fitur ini menyarankan peningkatan aksesibilitas untuk aplikasi Android seperti memperbesar target sentuhan kecil, 
meningkatkan kontras, dan memberikan deskripsi konten. Aktifkan pada `Setelan>Aksesibilitas>Accessibility Scanner>switch on`. 
Misal kita gunakan pada aplikasi aksesibilitas tadi, fitur ini akan memberi sugesti untuk meningkatkan kontras agar lebih terang 
sehingga pengguna dengan penglihatan rendah dapat melihatnya.\
![]()\
Jika tidak ada masalah atau sugesti pada tampilan maka akan seperti ini:\
![]()\


Sumber:\
[Codelabs Accessibility](https://codelabs.developers.google.com/codelabs/basic-android-accessibility/#0)\
[Codelabs Accessibility Service](https://codelabs.developers.google.com/codelabs/developing-android-a11y-service/#0)