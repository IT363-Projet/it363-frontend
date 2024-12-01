class Question {
  final String id;
  final String questionText;
  final String questionType; // 'multiple_choice', 'slider', 'ranking', etc.
  final List<String>? columns; // Colonnes du tableau (ex. ["Option", "Criteria"])
  final List<String>? options; // Utilisé pour les questions à choix multiples ou de classement
  final dynamic correctAnswer; // Peut être un String, int, ou autre
  final Map<String, int>? rankingOptions; // Pour le classement
  final List<Map<String, String>>? tableData; // Données du tableau
  final List<String>? imageOptions; // Chemins vers les images pour les options
  final List<String>? dropdownOptions; // Liste des options pour la liste déroulante
  final int? minValue; // Pour les questions avec glisseur
  final int? maxValue;

  Question({
    required this.id,
    required this.questionText,
    required this.questionType,
    this.options,
    this.correctAnswer,
    this.dropdownOptions,
    this.rankingOptions,
    this.columns,
    this.tableData,
    this.imageOptions,
    this.minValue,
    this.maxValue,
  });
}

