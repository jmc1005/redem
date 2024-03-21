enum EM {
  emrr('EMRR', 'Recurrente-remitente'),
  emsp('EMSP', 'Secundaria progresiva'),
  empp('EMPP', 'Primaria progresiva'),
  empr('EMPR', 'Progresiva-recurrente');

  const EM(this.value, this.label);

  final String value;
  final String label;
}
