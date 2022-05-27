import 'package:flutter/material.dart';

enum GenderList { male, female }

const CatSrc = 'assets/images/q19898.jpg';

class MyFormState extends State {
  final _formKey = GlobalKey<FormState>();
  GenderList _gender = GenderList.female;
  bool _dryfood = false;
  bool _wetfood = false;
  bool _naturalfood = false;

  Widget _catName() {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(children: [
          const Text(
            'Кличка питомца:',
            style: TextStyle(fontSize: 20.0),
          ),
          TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Пожалуйста введите кличку питомца';
                }
              },
              style: TextStyle(fontSize: 20.0)),
        ]),
      ),
    );
  }

  Widget _catBreed() {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(children: [
          const Text(
            'Порода питомца:',
            style: TextStyle(fontSize: 20.0),
          ),
          TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Пожалуйста введите породу питомца';
                }
              },
              style: TextStyle(fontSize: 20.0)),
        ]),
      ),
    );
  }

  Widget _catSex() {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(10),
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
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(children: [
          const Text(
            'Корм:',
            style: TextStyle(fontSize: 20.0),
          ),
          CheckboxListTile(
              value: _dryfood,
              activeColor: Colors.deepPurpleAccent,
              title: const Text('Сухой', style: TextStyle(fontSize: 20.0)),
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (bool? value) => setState(() => _dryfood = value!)),
          CheckboxListTile(
              value: _wetfood,
              activeColor: Colors.deepPurpleAccent,
              title: const Text('Влажный', style: TextStyle(fontSize: 20.0)),
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (bool? value) => setState(() => _wetfood = value!)),
          CheckboxListTile(
              value: _naturalfood,
              activeColor: Colors.deepPurpleAccent,
              title:
                  const Text('Натуральный', style: TextStyle(fontSize: 20.0)),
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (bool? value) =>
                  setState(() => _naturalfood = value!)),
        ]),
      ),
    );
  }

  Widget _ownerName() {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(children: [
          const Text(
            'Имя:',
            style: TextStyle(fontSize: 20.0),
          ),
          TextFormField(
              validator: (value) {
                if (value!.isEmpty) return 'Пожалуйста введите свое имя';
              },
              style: TextStyle(fontSize: 20.0)),
        ]),
      ),
    );
  }

  Widget _ownerEmail() {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(children: [
          const Text(
            'Контактный E-mail:',
            style: TextStyle(fontSize: 20.0),
          ),
          TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Пожалуйста введите свой E-mail';
                }
                if ((!value.contains('@')) || (!value.contains('.'))) {
                  return 'E-mail должен иметь вид ***@***.***';
                }
              },
              style: TextStyle(fontSize: 20.0)),
        ]),
      ),
    );
  }

  Widget _finalButton() {
    return Card(
      child: RaisedButton(
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
              color = Colors.blueAccent;
            }

            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text(text),
              backgroundColor: color,
            ));
          }
        },
        child: const Text('Сохранить',
            style: TextStyle(fontWeight: FontWeight.bold)),
        color: const Color(0xFF673AB7),
        textColor: Colors.white,
      ),
    );
  }

  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(CatSrc),
            opacity: 1.0,
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: ListView(children: <Widget>[
            const Text(
              'Питомец',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            _catName(),
            _catBreed(),
            _catSex(),
            _catFeed(),
            const Text(
              'Контактные данные владельца',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            _ownerName(),
            _ownerEmail(),
            _finalButton(),
          ]),
        ));
  }
}
