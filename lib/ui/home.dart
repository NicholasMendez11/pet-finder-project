import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool darkmode = false;
  // var darkIcon = darkmode ? Icons.lightbulb_outline : Icons.lightbulb;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Page")),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(20),
                      child: Row(children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text("Hey Spikey,"),
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
                    )
                  ],
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }

  void switchMode() {
    setState(() {
      darkmode = !darkmode;
    });
  }
}
