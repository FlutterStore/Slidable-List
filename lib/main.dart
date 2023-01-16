import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({
    Key? key,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int indexs = 0;

  List fruit = [
    'Apple',
    'Banana',
    'Cranberry',
    'Cherry',
    'Coconut',
    'Fig',
    'Finger Lime',
    'Hazelnut',
    'Guava',
    'Ice Apple',
    'Jenipapo',
    'Longan',
    'Kiwano',
    'Kiwi',
    'Lime',
    'Mango',
    'Mulberry',
    'Oranges',
    'Papaya',
    'Strawberries',
    'Sapota',
    'Star apple',
    'Rambutan',
    'Pineapple',
    'Jackfruit',
    'Watermelon',
  ];

  @override
  void initState() {
    setState(() {
      indexs = fruit.length;
    });
    super.initState();
  }

  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Slidable ListTile',style: TextStyle(fontSize: 15),),
        ),
        body:  
        ListView.builder(
          itemCount: indexs,
          itemBuilder: (context, index) {
            return Slidable(
              key: ValueKey(indexs),
              startActionPane: ActionPane(
                motion: const ScrollMotion(),
                dismissible: DismissiblePane(
                  key: ValueKey(indexs),
                  onDismissed: () {
                  setState(() {
                    fruit.remove(fruit[index]);
                    indexs--;
                  });
                }),
                children: [
                  SlidableAction(
                    onPressed: (context) {},
                    backgroundColor: Color(0xFFFE4A49),
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Delete',
                  ),
                  SlidableAction(
                    onPressed: (context) {},
                    backgroundColor: Color(0xFF21B7CA),
                    foregroundColor: Colors.white,
                    icon: Icons.share,
                    label: 'Share',
                  ),
                ],
              ),
              endActionPane: ActionPane(
                motion: ScrollMotion(),
                children: [
                  SlidableAction(
                    flex: 2,
                    onPressed: (context) {},
                    backgroundColor: Color(0xFF7BC043),
                    foregroundColor: Colors.white,
                    icon: Icons.archive,
                    label: 'Archive',
                  ),
                  SlidableAction(
                    onPressed: (context) {},
                    backgroundColor: Color(0xFF0392CF),
                    foregroundColor: Colors.white,
                    icon: Icons.save,
                    label: 'Save',
                  ),
                ],
              ),
              child: ListTile(
                leading: const Icon(Icons.apple),
                title: Text(fruit[index])
              ),
            );
          },
        )
      ),
    );
  }
}