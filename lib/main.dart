import 'package:flutter/material.dart';

import 'custom_theme.dart';

import 'cards.dart';

class MyForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyFormState();
}

void main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: CustomTheme.darkTheme,
    home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Ваш котик',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black87,
          elevation: 4,
          shadowColor: Colors.white,
        ),
        body: MyForm())));
