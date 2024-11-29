# A. Praktikum 1, Designing an HTTP client and getting data

## 1. Mendaftarlah ke layanan Lab Mock di https://app.wiremock.cloud/. Bisa anda gunakanakun google untuk mendaftar. Jika berhasil bendaftar dan login, akan muncul seperti gambar berikut.

## 2.Di halaman dahsboard, klik menu Stubs, kemudian klik entri pertama yaitu “GET a JSON resource”. Anda akan melihat layar yang mirip dengan berikut

## 3. Klik “Create new stub”. Di kolom sebelah kanan, lengkapi data berikut. Namanya adalah“Pizza List”, kemudian pilih GET dan isi dengan “/pizzalist”.

Kemudian, pada bagian
Response, untuk status 200, kemudian pada Body pilih JSON sebagai formatnya dan isi
konten JSON dari https://bit.ly/pizzalist. Perhatikan gambar berikut.

## 4.Tekan tombol SAVE di bagian bawah halaman untuk menyimpan Mock ini. Jika berhasil tersimpan, maka Mock API sudah siap digunakan.

## 5. Buatlah project flutter baru dengan nama pizza_api_nama_anda, tambahkan depedensi “http” melalui terminal

## 6. DI folder “lib” project anda, tambahkan file dengan nama “httphelper.dart”

## 7. Isi httphelper.dart dengan kode berikut. Ubah “02z2g.mocklab.io” dengan URL Mock API anda.

```
import 'dart:io';
import 'package:flutter_basic/models/pizza.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'models/pizza.dart';

class Httphelper {
  final String authority = "https://wm89g.wiremockapi.cloud/";
  final String path = "pizzalist";

  Future<List<Pizza>> getPizzaList() async {
    final Uri url = Uri.parse(authority + path);
    final http.Response result = await http.get(url);
    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = jsonDecode(result.body);
      final List<Pizza> pizzas =
          jsonResponse.map<Pizza>((i) => Pizza.fromJson(i)).toList();

      return pizzas;
    } else {
      return [];
    }
  }
}

```

## 8. Di file “main.dart”, di class \_ MyHomePageState, tambahkan metode bernama“callPizzas”.

Metode ini mengembalikan sebuah Future dari daftar objek Pizza dengan
memanggil metode getPizzaList dari kelas HttpHelper, dengan kode sebagai berikut:

```
Future<List<Pizza>> callPizzas() async {
    Httphelper helper = Httphelper();
    List<Pizza> pizzas = await helper.getPizzaList();
    return pizzas;
  }
```

## 9. Di class \_MyHomePageState, e, di dalam body Scaffold, tambahkan FutureBuilder yang membuat ListView dari widget ListTile yang berisi objek Pizza:

```
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JSON'),
      ),
      body: FutureBuilder(
          future: callPizzas(),
          builder: (BuildContext context, AsyncSnapshot<List<Pizza>> snapshot) {
            if (snapshot.hasError) {
              return const Text('Sometging when wrong');
            } else if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            }
            return ListView.builder(
                itemCount: (snapshot.data == null) ? 0 : snapshot.data!.length,
                itemBuilder: (BuildContext context, int position) {
                  return ListTile(
                    title: Text(snapshot.data![position].pizzaName),
                    subtitle: Text(
                        '${snapshot.data![position].description}i  ${snapshot.data![position].price}'),
                  );
                });
          }),
    );
  }
```

## 10. Jalankan aplikasi. Anda akan melihat layar yang mirip dengan berikut ini:

![alt text](image.png)
