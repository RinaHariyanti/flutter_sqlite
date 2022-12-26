
import 'package:flutter/material.dart';
import 'database/db_helper.dart';
import 'model/kontak.dart';


class FormKontak extends StatefulWidget {
  final Kontak? kontak;

  const FormKontak({super.key, this.kontak});

  @override
  // ignore: library_private_types_in_public_api
  _FormKontakState createState() => _FormKontakState();
}

class _FormKontakState extends State<FormKontak> {
  DbHelper db = DbHelper();

  TextEditingController? name;
  TextEditingController? nim;
  TextEditingController? alamat;
  TextEditingController? jk;

  @override
  void initState() {
    name = TextEditingController(
        text: widget.kontak == null ? '' : widget.kontak!.nama);

    nim = TextEditingController(
        text: widget.kontak == null ? '' : widget.kontak!.nim);

    alamat = TextEditingController(
        text: widget.kontak == null ? '' : widget.kontak!.alamat);

    jk = TextEditingController(
        text: widget.kontak == null ? '' : widget.kontak!.jk);

    super.initState();
  }
  int _value = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: TextField(
              controller: name,
              decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: TextField(
              controller: nim,
              decoration: InputDecoration(
                  labelText: 'Nim',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  )),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(
          //     top: 20,
          //   ),
          //   child: TextField(
          //     controller: Nim,
          //     decoration: InputDecoration(
          //         labelText: 'Mobile No',
          //         border: OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(8),
          //         )),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              bottom: 20,
            ),
            child: TextField(
              controller: alamat,
              decoration: InputDecoration(
                  labelText: 'Alamat',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  )),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(children: [
                Radio(
                  value: 1, 
                  groupValue: _value, 
                  onChanged: (value){
                    setState(() {
                      _value = value!;
                    });
                  },
                  ),
                const SizedBox(width: 10.0,),
                const Text("Male"),
              ],),
              Row(children: [
                Radio(
                  value: 1, 
                  groupValue: _value, 
                  onChanged: (value){
                    setState(() {
                      _value = value!;
                    });
                  },
                  ),
                const SizedBox(width: 10.0,),
                const Text("Famale"),
              ],),
            ],
          ),
          
          // Padding(
          //   padding: const EdgeInsets.only(
          //     top: 20,
          //   ),
          //   child: TextField(
          //     controller: jk,
          //     decoration: InputDecoration(
          //         labelText: 'Jenis Kelamin',
          //         border: OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(8),
          //         )),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(
                top: 20
            ),
            child: ElevatedButton(
              child: (widget.kontak == null)
                  ? const Text(
                'Add',
                style: TextStyle(color: Colors.white),
              )
                  : const Text(
                'Update',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                upsertKontak();
              },
            ),
          )
        ],
      ),
    );
  }

  Future<void> upsertKontak() async {
    if (widget.kontak != null) {
      //update
      await db.updateKontak(Kontak(
          id: widget.kontak!.id,
          nama: name!.text,
          nim: nim!.text,
          alamat: alamat!.text,
          jk: jk!.text
      ));

      // ignore: use_build_context_synchronously
      Navigator.pop(context, 'update');
    } else {
      //insert
      await db.saveKontak(Kontak(
        nama: name!.text,
        nim: nim!.text,
        alamat: alamat!.text,
        jk: jk!.text,
      ));
      // ignore: use_build_context_synchronously
      Navigator.pop(context, 'save');
    }
  }
}