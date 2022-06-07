import 'package:flutter/material.dart';
import 'custom_theme.dart';
import 'cards.dart';
import 'config.dart';

class MyForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyFormState();
}


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: CustomTheme.lightTheme,
        darkTheme: CustomTheme.darkTheme,
        themeMode: currentTheme.currentTheme,
        home: Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                    icon: const Icon(Icons.brightness_4),
                    onPressed: () {
                      currentTheme.toggleTheme();
                    })
              ],
              title: const Text(
                'Опросник',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: const Color(0xFF673AB7),
            ),
            body: MyForm()));
  }
}


// void main() => runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     theme: CustomTheme.lightTheme,
//     darkTheme: CustomTheme.darkTheme,
//     themeMode: currentTheme.currentTheme,
//     home: Scaffold(
//         appBar: AppBar(
//           actions: [
//             IconButton(
//                 icon: const Icon(Icons.brightness_4),
//                 onPressed: () {
//                   currentTheme.toggleTheme();
//                 })
//           ],
//           title: const Text(
//             'Опросник',
//             style: TextStyle(color: Colors.white),
//           ),
//           backgroundColor: const Color(0xFF673AB7),
//         ),
//         body: MyForm())));
