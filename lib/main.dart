//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learningsqlite/%20list_kontak.dart';
import 'package:learningsqlite/form_kontak.dart';
void main() async {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4 ,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "BIODATA MAHASISWA",
          ),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Biodata',),
              Tab(text: 'List',)
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            FormKontak(),
            ListKontakPage()
          ],
        ),
      ),
    );
  }
}