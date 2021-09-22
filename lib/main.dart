import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FormPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();

  late String firstname;
  late String lastname;

  late String selectedGender = '';

  bool _isOptional1 = false;
  bool _isOptional2 = false;
  bool _isOptional3 = false;
  List<String> selectedOptions = [];

  void _onRadioButtonChange(String value) {
    print(value);
    setState(() {
      selectedGender = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(5),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text('Firstname'),
                  TextFormField(
                    initialValue: '',
                    onSaved: (value) => setState(() {
                      firstname = value!;
                    }),
                  ),
                  Text('Lastname'),
                  TextFormField(
                    initialValue: '',
                    onSaved: (value) => setState(() {
                      lastname = value!;
                    }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Male'),
                      Radio(
                          value: 'Male',
                          groupValue: selectedGender,
                          onChanged: (value) {
                            _onRadioButtonChange(value as String);
                          }),
                      Text('Female'),
                      Radio(
                          value: 'Female',
                          groupValue: selectedGender,
                          onChanged: (value) {
                            _onRadioButtonChange(value as String);
                          }),
                    ],
                  ),
                  Column(
                    children: [
                      CheckboxListTile(
                          title: Text('ไอ'),
                          value: _isOptional1,
                          onChanged: (val) {
                            setState(() {
                              _isOptional1 = !_isOptional1;
                              if (_isOptional1) {
                                selectedOptions.add('ไอ');
                              } else {
                                selectedOptions.remove('ไอ');
                              }
                            });
                          }),
                      CheckboxListTile(
                          title: Text('เจ็บคอ'),
                          value: _isOptional2,
                          onChanged: (val) {
                            setState(() {
                              _isOptional2 = !_isOptional2;
                              if (_isOptional2) {
                                selectedOptions.add('เจ็บคอ');
                              } else {
                                selectedOptions.remove('เจ็บคอ');
                              }
                            });
                          }),
                      CheckboxListTile(
                          title: Text('มีไข้'),
                          value: _isOptional3,
                          onChanged: (val) {
                            setState(() {
                              _isOptional3 = !_isOptional3;
                              if (_isOptional3) {
                                selectedOptions.add('มีไข้');
                              } else {
                                selectedOptions.remove('มีไข้');
                              }
                            });
                          }),
                    ],
                  ),
                  RaisedButton(
                    onPressed: () => {
                      if (_formKey.currentState!.validate())
                        {
                          _formKey.currentState!.save(),
                          print('save'),
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Page1(
                                        firstname: firstname,
                                        lastname: lastname,
                                        gender: selectedGender,
                                        symtopms: selectedOptions,
                                      )))
                        }
                    },
                    child: Text('save'),
                  )
                ],
              )),
        ),
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  Page1({
    required this.firstname,
    required this.lastname,
    required this.gender,
    required this.symtopms,
  });

  final String firstname;
  final String lastname;
  final String gender;
  final List<String> symtopms;

  final String description = 'Hello world';
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(firstname),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            covidDetect(symtopms),
          ],
        ),
      ),
    );
  }

  Widget covidDetect(List<String> symtopms) {
    if (symtopms.length == 3) {
      return Container(
        width: 300,
        height: 300,
        child: Center(child: Text('คุณ $firstname $lastname คุณเป็นโควิด')),
      );
    } else {
      return Container(
        width: 300,
        height: 300,
        child: Center(child: Text('คุณ $firstname $lastname คุณไม่เป็นโควิด')),
      );
    }
  }
}

// class Page2 extends StatelessWidget {
//   Page2({
//     required this.firstname,
//     required this.lastname,
//     required this.gender,
//     required this.symtopms,
//   });

//   final String firstname;
//   final String lastname;
//   final String gender;
//   final List<String> symtopms;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Report'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               child: Text(''),
//             ),
//             // FloatingActionButton(
//             //   onPressed: () => Navigator.pop(
//             //     context,
//             //     MaterialPageRoute(
//             //         builder: (context) => Page1(
//             //               firstname: 'Page1',
//             //               lastname: '',
//             //               gender: '',
//             //               symtopms: [],
//             //             )),
//             //   ),
//             //   child: Text('Back'),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }
