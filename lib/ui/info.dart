import 'package:flutter/material.dart';
import '../model/doglist.dart';

class Info extends StatelessWidget {
  const Info({super.key, required this.dog, required this.indexing});

  final Dog dog;
  final int indexing;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${dog.name}")),
      body: Container(
        child: Column(
          children: [
            Hero(
              tag: "image hero${indexing}",
              child: Image.asset(
                fit: BoxFit.fill,
                (dog.photo).toString(),
              ),
            ),
            const Text("Soy un perro wau wau!",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300))
          ],
        ),
      ),
    );
  }
}
