import 'package:flutter/material.dart';
import '../helpers/utils.dart'; //Getting the utils
import '../model/doglist.dart'; // Getting the created class
import './info.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool darkmode = false;

  List<Dog> dogs = Utils.getMockedCategories();
  // var darkIcon = darkmode ? Icons.lightbulb_outline : Icons.lightbulb;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE5E5E5),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 47),
                child: Row(children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Hey Spikey,",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Adopt a new friend near you")
                      ]),
                  const SizedBox(
                    width: 130,
                  ),
                  IconButton(
                      onPressed: switchMode,
                      icon: Padding(
                        padding: EdgeInsets.zero,
                        child: Icon(
                            darkmode
                                ? Icons.tips_and_updates_outlined
                                : Icons.tips_and_updates,
                            color: darkmode ? null : Colors.yellow),
                      ))
                ]),
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: dogs.length,
                      itemBuilder: (BuildContext ctx, int index) {
                        //.map for list view. Here it will create one of this thing for each items
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    Info(dog: dogs[index], indexing: index),
                              ),
                            );
                          },
                          child: Container(
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              margin:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Hero(
                                        tag: "image hero${index}",
                                        child: Image.asset(
                                          fit: BoxFit.fill,
                                          height: 100,
                                          width: 100,
                                          (dogs[index].photo).toString(),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      height: 100,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text((dogs[index].name).toString(),
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500)),
                                          Row(
                                            children: [
                                              Text((dogs[index].year)
                                                  .toString()),
                                              const SizedBox(
                                                width: 1,
                                              ),
                                              Text("|"),
                                              Text("Playful")
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Icon(Icons.location_pin,
                                                  color: Color.fromARGB(
                                                      255, 225, 87, 22)),
                                              Text((dogs[index].location)
                                                  .toString())
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )),
                        );
                      }))
            ],
          ),
        ),
      ),
    );
  }

  void navigateToInfo() {}
  void switchMode() {
    setState(() {
      darkmode = !darkmode;
    });
  }
}
