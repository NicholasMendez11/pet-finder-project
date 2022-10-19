import 'package:flutter/material.dart';
import '../model/doglist.dart';

class Info extends StatefulWidget {
  Info({super.key, required this.dog, required this.indexing});

  final Dog dog;
  final int indexing;

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topLeft,
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.49,
                    width: double.infinity,
                    child: Hero(
                      tag: "image hero${widget.indexing}",
                      child: Image.asset(
                        fit: BoxFit.fill,
                        (widget.dog.photo).toString(),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.arrow_back,
                                color: Colors.white, size: 35)),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isFavorite = !isFavorite;
                            });
                          },
                          child: AnimatedContainer(
                              duration: const Duration(milliseconds: 700),
                              curve: Curves.easeInOut,
                              child: Icon(
                                  isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_outline,
                                  color:
                                      isFavorite ? Colors.pink : Colors.white,
                                  size: 35)),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
