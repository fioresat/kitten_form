import 'package:flutter/material.dart';

import 'config.dart';

enum GenderList { male, female }

class MyFormState extends State {
  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      setState(() {});
    });
  }


  final _formKey = GlobalKey<FormState>();
  GenderList _gender = GenderList.female;
  bool _dryfood = false;
  bool _wetfood = false;
  bool _naturalfood = false;

  Widget _inputField(String a, String b) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
        child: Column(children: [
          Text(
            a,
            style: TextStyle(fontSize: 20.0),
          ),
          TextFormField(
            textAlign: TextAlign.center,
            validator: (value) {
              if (value!.isEmpty) {
                return b;
              } else if (a == 'Контактный E-mail:' &&
                  ((!value.contains('@')) || (!value.contains('.')))) {
                return 'E-mail должен иметь вид ***@***.***';
              }
            },
            style: const TextStyle(fontSize: 20.0),
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              //hintText: 'Кличка',
            ),
          ),
        ]),
      ),
    );
  }

  Widget _catSex() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
        child: Column(children: [
          const Text(
            'Пол питомца:',
            style: TextStyle(fontSize: 20.0),
          ),
          RadioListTile(
            title: const Text('Самец', style: TextStyle(fontSize: 20.0)),
            activeColor: Colors.deepPurple,
            value: GenderList.male,
            groupValue: _gender,
            onChanged: (GenderList? value) {
              setState(() {
                _gender = value!;
              });
            },
          ),
          RadioListTile(
            title: const Text('Самка', style: TextStyle(fontSize: 20.0)),
            activeColor: Colors.deepPurple,
            value: GenderList.female,
            groupValue: _gender,
            onChanged: (GenderList? value) {
              setState(() {
                _gender = value!;
              });
            },
          ),
        ]),
      ),
    );
  }

  Widget _catFeed() {
    return Card(
      //color: const Color(0xFFeeeeee),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
        child: Column(children: [
          const Text(
            'Корм:',
            style: TextStyle(fontSize: 20.0),
          ),
          CheckboxListTile(
              value: _dryfood,
              activeColor: Colors.deepPurple,
              title: const Text('Сухой', style: TextStyle(fontSize: 20.0)),
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (bool? value) => setState(() => _dryfood = value!)),
          CheckboxListTile(
              value: _wetfood,
              activeColor: Colors.deepPurple,
              title: const Text('Влажный', style: TextStyle(fontSize: 20.0)),
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (bool? value) => setState(() => _wetfood = value!)),
          CheckboxListTile(
              value: _naturalfood,
              activeColor: Colors.deepPurple,
              title:
                  const Text('Натуральный', style: TextStyle(fontSize: 20.0)),
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (bool? value) =>
                  setState(() => _naturalfood = value!)),
        ]),
      ),
    );
  }

  Widget _finalButton() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          Color color = Colors.red;
          String text;
          if (_gender == null) {
            text = 'Выберите пол питомца';
          } else if (_dryfood == false &&
              _wetfood == false &&
              _naturalfood == false) {
            text = 'Укажите вид корма';
          } else {
            text = 'Форма успешно заполнена';
            color = Colors.teal;
          }

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              behavior: SnackBarBehavior.floating,
              backgroundColor: color,
              content: Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          );
        }
      },
      child: const Text(
        'Сохранить',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),

    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10.0),
        child: Form(
            key: _formKey,
            child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, int index) {
                  return Column(children: [
                    const Text(
                      'Питомец',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.bold),
                    ),
                    _inputField(
                        'Кличка питомца', 'Пожалуйста введите кличку питомца'),
                    _inputField(
                        'Порода питомца', 'Пожалуйста введите породу питомца'),
                    _catSex(),
                    _catFeed(),
                    const Text(
                      'Контактные данные владельца',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.bold),
                    ),
                    _inputField('Имя', 'Пожалуйста введите своё имя'),
                    _inputField(
                        'Контактный E-mail:', 'Пожалуйста введите свой E-mail'),
                    _finalButton(),
                  ]);
                })));
  }
}
