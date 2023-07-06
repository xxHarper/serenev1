class Sociodemographic {
  final String sex;
  final int age;
  final String sivilStat;
  final String educationLevel;
  final String occupation;
  final String residence;
  final String treatment;
  final String medicine;

  Sociodemographic(
    this.sex,
    this.age,
    this.sivilStat,
    this.educationLevel,
    this.occupation,
    this.residence,
    this.treatment,
    this.medicine,
  );

  Sociodemographic.fromJson(Map<String, dynamic> json)
      : sex = json['Sexo'],
        age = json['Edad'], 
        sivilStat = json['Estado Civil'], 
        educationLevel = json['¿Cuál es su nivel de estudios?'], 
        occupation = json['Ocupación'], 
        residence = json['email'], 
        treatment = json['email'], 
        medicine = json['email'];
}
