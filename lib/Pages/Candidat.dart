import 'package:flutter/material.dart';
import 'package:voting/models/person_dart.dart';
import 'package:voting/Pages/Formulaire.dart';

class Candidat extends StatefulWidget {
  const Candidat({Key? key});

  @override
  State<Candidat> createState() => _Candidat();
}

class _Candidat extends State<Candidat> {
  String name = "";
  bool liked = false;
  List<Person> persons = [];
  List<Person> friends = [];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Election 🇧🇯 🇧🇯 ")),
        actions: [
          IconButton(
            onPressed: () async {
              Person person = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FriendPage(
                    friends: friends,
                  ),
                ),
              );
              print(person.name);
              friends.remove(person);
              setState(() {});
            },
            icon: Icon(Icons.favorite),
          )
        ],
      ),
      body: ListView(
        children: persons
            .map((person) => ListTile(
                  title: Text("${person.name} ${person.surname}"),
                  subtitle: Text("Bonjour comment vas-tu?"),
                  leading: CircleAvatar(),
                  onTap: () {
                    addFriend(person);
                    setState(() {});
                  },
                ))
            .toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Person person = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FriendFormPage(),
            ),
          );

          setState(() => persons.add(person));
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 203, 250, 205),
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedItemColor: Color.fromARGB(255, 47, 69, 48),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'candidats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.how_to_vote),
            label: 'Vote',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  bool checkIfExists(Person person) {
    return friends.contains(person);
  }

  void addFriend(Person person) {
    if (!checkIfExists(person)) {
      friends.add(person);
    } else {
      friends.remove(person);
    }
  }
}
