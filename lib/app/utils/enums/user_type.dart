enum UserType {
  patient('patient', 'Paciente'),
  caregiver('caregiver', 'Cuidador'),
  professional('professional', 'Profesional'),
  other('other', '--'),
  ;

  const UserType(this.value, this.label);

  final String value;
  final String label;
}
