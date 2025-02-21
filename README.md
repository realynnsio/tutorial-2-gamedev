# Latihan: Playtest

Sekarang coba gerakkan objek landasan ke atas sehingga objek pesawatnya hampir menyentuh batas atas area permainan/window. Kemudian jawablah pertanyaan-pertanyaan berikut:

### 1. Apa saja pesan log yang dicetak pada panel Output?

“Platform initialized”
“Reached objective!”

### 2. Coba gerakkan landasan ke batas area bawah, lalu gerakkan kembali ke atas hingga hampir menyentuh batas atas. Apa saja pesan log yang dicetak pada panel Output?

“Reached objective!”

### 3. Buka scene MainLevel dengan tampilan workspace 2D. Apakah lokasi scene ObjectiveArea memiliki kaitan dengan pesan log yang dicetak pada panel Output pada percobaan sebelumnya?

Ya, setiap kali objek pesawat memasuki area lokasi “ObjectiveArea”, panel Output mencetak pesan “Reached objective!”. Saat dilihat di ObjectiveArea.gd, dapat dilihat bahwa hal ini terjadi karena ada fungsi `_on_ObjectiveArea_body_entered(body: RigidBody2D)` yang ditrigger dan dijalankan ketika ia menerima sinyal bahwa ada RigidBody2D yang memasuki area ObjectiveArea. Saat RigidBody2D ini bernama “BlueShip”, yaitu nama objek pesawat kita, akan dijalankan `print(“Reached objective!”)` yang mencetak pesan log tersebut di panel output.


<br>

# Latihan: Memanipulasi Node dan Scene

Sekarang coba kamu inspeksi scene-scene pada contoh proyek tutorial 2 dan jawablah pertanyaan-pertanyaan berikut:

### 1. Scene BlueShip dan StonePlatform sama-sama memiliki sebuah child node bertipe Sprite. Apa fungsi dari node bertipe Sprite?

Node Sprite, khususnya node Sprite2D, adalah node yang berfungsi untuk menampilkan tekstur/gambar 2D. Pada scene BlueShip, tekstur yang ditampilkan adalah gambar pesawat. Pada scene StonePlatform, tekstur yang ditampilkan adalah gambar platform batu.

### 2. Root node dari scene BlueShip dan StonePlatform menggunakan tipe yang berbeda. BlueShip menggunakan tipe RigidBody2D, sedangkan StonePlatform menggunakan tipe StaticBody2D. Apa perbedaan dari masing-masing tipe node?

-	RigidBody2D adalah tipe Node yang terpengaruhi oleh 2D physics. Ini artinya ia terpengaruhi oleh hal-hal seperti gravitasi dan physics bodies lainnya yang bertumbukkan dengannya. RigidBody2D juga akan mempertahankan bentuk dan ukurannya saat ada gaya yang diterapkan padanya.
-	StaticBody2D adalah tipe 2D physics body Node yang tidak terpengaruh/tidak bisa digerakkan oleh gaya external maupun kontak dengan physics bodies lainnya. Ia hanya bisa digerakkan secara manual seperti dengan implementasi kode.


### 3. Ubah nilai atribut Mass pada tipe RigidBody2D secara bebas di scene BlueShip, lalu coba jalankan scene MainLevel. Apa yang terjadi?

Dari percobaan yang saya lakukan, tidak banyak perubahan yang terlihat... saya mencoba mengangkat objek pesawat dengan platform batu sampai mengenai ujung atas screen dan mengukur waktu yang dibutuhkan untuk pesawat tersebut jatuh ke platform lagi apabila platform digerakkan ke ujung bawah screen. Pada saat Mass pesawat 5 kg, waktu yang dibutuhkan adalah 1.22 detik. Pada saat Mass pesawat 150 kg, waktu yang dibutuhkan adalah 1.21 detik. Perbedaan 0.01 detik kemungkinan hanya berupa perbedaan kecepatan refleks saya sehingga waktu jatuhnya dapat diasumsi tetap sama.

Hal ini sedikit berbeda dengan ekspektasi saya saat membaca dokumentasi Godot, yang menyebutkan bahwa mengubah properti mass pada RigidBody2D akan mengubah bagaimana simulasi physics akan berdampak kepadanya.

### 4. Ubah nilai atribut Disabled pada tipe CollisionShape2D di scene StonePlatform, lalu coba jalankan scene MainLevel. Apa yang terjadi?

Saat scene MainLevel dijalankan, objek pesawat langsung jatuh menembus objek platform. Hal ini terjadi karena collision shape yang telah di-disable tidak memiliki pengaruh pada dunia.

### 5. Pada scene MainLevel, coba manipulasi atribut Position, Rotation, dan Scale milik node BlueShip secara bebas. Apa yang terjadi pada visualisasi BlueShip di Viewport?

![1](/readme_img/1.png)
![2](/readme_img/2.png)
![3](/readme_img/3.png)
![4](/readme_img/4.png)
 
Visualisasi BlueShip di viewport berubah position dan rotation-nya, namun scale-nya tidak berubah. Setelah saya teliti lebih lanjut, sepertinya hal ini terjadi karena perubahan size pada RigidBody2D akan di-override oleh physics engine saat game-nya dijalankan. Pop-up warning ini juga dapat dilihat pada screenshoot di atas.

### 6. Pada scene MainLevel, perhatikan nilai atribut Position node PlatformBlue, StonePlatform, dan StonePlatform2. Mengapa nilai Position node StonePlatform dan StonePlatform2 tidak sesuai dengan posisinya di dalam scene (menurut Inspector) namun visualisasinya berada di posisi yang tepat?

Nilai posisi dari StonePlatform dan StonePlatform2 diukur relatif terhadap origin point dari root node (PlatformBlue) dan bukan terhadap origin point dari node MainLevel-nya.

