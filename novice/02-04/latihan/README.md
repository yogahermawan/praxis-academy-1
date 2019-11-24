## Animasi
AnimationController adalah objek animasi khusus yang menghasilkan nilai baru 
setiap kali hardware siap untuk bingkai baru. Secara linear menghasilkan durasi 0,0 sampai 1,0. 
```
controller =
    AnimationController(duration: const Duration(seconds: 2), vsync: this);
```
`vsync` mencegah animasi offscreen menggunakan sumber daya yang tidak perlu. 
Tween adalah objek stateless terdiri dari `begin` dan `end` yang menentukan pemetaan dari rentang input ke rentang output. 
Tween mewarisi dari Animatable<T>. Contoh animasi, [exampleanimation.dart]()

<img src="" width="300">

AnimatedWidget memisahkan kode core widget dengan kode animasi. 
Contoh file, [simpleanimation.dart]()\
`addStatusListener()` memunculkan notifikasi untuk mengetahui kapan animasi berubah keadaan, seperti finishing, moving forward, atau reversing. 
```
..addStatusListener((state) => print('$state'));
```
File [animationmonitoring.dart]()\
AnimatedBuilder untuk memperbaiki atau membangun kembali struktur kode(refactoring).\
Container->GrowTransition->AnimatedBuilder->(AnonymousBuilder)->LogoWidget
File [refactoring.dart]()
Animasi Simultan, contoh []()

<img src="" width="300">