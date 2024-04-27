class Person {
  String? name;
  String? surname;
  String? birthDate;
  String? sex;
  String? profil;
  String? party;
  String? description;

  Person({this.name, this.surname, this.birthDate, this.sex, this.party, this.description;

  @override
  String toString() {
    return 'Person{name: $name, surname: $surname, birthDate: $birthDate, sex: $sex, party: $party, description: $description  }';
  }
}
