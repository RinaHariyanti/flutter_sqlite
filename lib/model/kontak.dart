
class Kontak{
  int? id;
  String? nama;
  String? nim;
  String? alamat;
  String? jk;

  Kontak({this.id, this.nama, this.nim, this.alamat, this.jk});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};

    if (id != null) {
      map['id'] = id;
    }
    map['nama'] = nama;
    map['nim'] = nim;
    map['alamat'] = alamat;
    map['jk'] = jk;

    return map;
  }

  Kontak.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    nama = map['nama'];
    nim = map['nim'];
    alamat = map['alamat'];
    jk = map['jk'];
  }
}
