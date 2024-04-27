import 'package:flutter/material.dart';
import 'package:voting/common/I_button.dart';
import 'package:voting/common/i_input.dart';
import 'package:voting/models/person_dart.dart';
import 'package:intl/intl.dart';

class Formulaire extends StatefulWidget {
  const Formulaire({Key? key});

  @override
  State<Formulaire> createState() => _Formulaire();
}

class _Formulaire extends State<Formulaire> {
  final _formKey = GlobalKey<FormState>();
  final Person person = Person();
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Création de candidat"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              IIinput(
                name: 'Nom',
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Champ obligatoire";
                  }
                },
                onSaved: (value) {
                  person.name = value;
                },
                prefixIcon: Icon(Icons.person),
                suffixIcon: Icon(Icons.access_time_filled),
              
              ),
              SizedBox(height: 10),
              IIinput(
                name: 'Prénom',
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Champ obligatoire";
                  }
                },
                onSaved: (value) {
                  person.surname = value;
                },
                prefixIcon: Icon(Icons.person),
                
              ),
              SizedBox(height: 10),
              IIinput(
                name: 'Partie politique',
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Champ obligatoire";
                  }
                },
                onSaved: (value) {
                  person.party = value;
                },
                prefixIcon: Icon(Icons.flag),
                
              ),
              SizedBox(height: 10),
              Container(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: IIinput(
                    name: 'Description',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Champ obligatoire";
                      }
                    },
                    onSaved: (value) {
                      person.description = value;
                    },
                    prefixIcon: Icon(Icons.description),
                    
                  ),
                ),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: _selectedDate ?? DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (picked != null && picked != _selectedDate) {
                    setState(() {
                      _selectedDate = picked;
                      person.birthDate =
                          DateFormat('yyyy-MM-dd').format(picked);
                    });
                  }
                },
                child: IIinput(
                  name: 'Date de naissance',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Champ obligatoire";
                    }
                  },
                  onSaved: (value) {
                    person.birthDate = value;
                  },
                  prefixIcon: Icon(Icons.calendar_today),
                  initialValue: _selectedDate != null
                      ? DateFormat('yyyy-MM-dd').format(_selectedDate!)
                      : '',
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: IButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              Navigator.pop(context, person);
            }
          },
          text: 'Sauvegarder',
        ),
      ),
    );
  }
}
