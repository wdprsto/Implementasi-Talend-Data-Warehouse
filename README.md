# Implementasi-Talend-Data-Warehouse

Solusi untuk Task 5 dari VIX Rakamin Data Engineer ID/X Partners oleh Wahyu Dwi Prasetio.

- File `DWH_Project.sql` merupakan file SQL yang berisi struktur tabel/skema dan data pada database DWH_Project. Data ini diperoleh dari proses ETL menggunakan aplikasi Talend.

- Folder `LOCAL_PROJECT` merupakan folder yang dihasilkan dari proses Export pada aplikasi Talend. Folder ini mengandung konfigurasi Transformasi dan Koneksi ke Database.



## Studi Kasus

Salah satu client dari ID/X Partners yang bergerak di bidang e-commerce memiliki kebutuhan untuk membuat sebuah Data Warehouse yang berasal dari beberapa tabel dari database sumber. Data Warehouse ini nantinya terdiri dari satu tabel Fact dan beberapa tabel Dimension. Sebagai Data Engineer, ada beberapa task yang perlu anda lakukan yaitu:

1. Melakukan Import/Restore Database Staging.

2. Membuat sebuah Database bernama DWH_Project, serta membuat Tabel Fact dan Dimension dari tabel yang ada di database Staging.

3. Membuat Job ETL di aplikasi talend untuk memindahkan data dari Staging ke Data Warehouse. Khusus untuk Tabel DimCustomer, lakukan transformasi data dengan merubah data dari kolom FirstName dan LastName menjadi huruf kapital semua, lalu gabungkan kedua kolom tersebut menjadi satu kolom yang bernama CustomerName.

4. Membuat Store Procedure (SP) untuk menampilkan summary sales order berdasarkan status pengiriman



## Penyelesaian Masalah

### Kasus 1



### Kasus 2



### Kasus 3



### Kasus 4



## Replikasi Penyelesaian Masalah di Talend

- untuk ekspor items: klik kanan di `job designs` -> `export items`
- untuk import items: buka toolbar, lalu pilih opsi `import items`



## References

- [Cara Membuat Koneksi ke Database MSSQL di Talend](https://blogs.perficient.com/2022/10/14/how-to-connect-sql-server-with-talend-tool/)

- [Migrasi Data dari Satu Database ke yang Lain Menggunakan Talend](https://www.youtube.com/watch?v=gC_UX1AkuiQ&t=574s)
