import '../models/question.dart';

final List<Question> mythologyThemeQuestions = 
[
  Question(
    id: 'q1',
    questionText: 'Combien de dieux composent les Olympiens ?',
    questionType: 'slider',
    minValue: 10,
    maxValue: 14,
    correctAnswer: '12',
  ),
  Question(
    id: 'q2',
    questionText: 'Quel dieu est connu comme le messager des dieux ?',
    questionType: 'multiple_choice',
    options: ['Hermès', 'Apollon', 'Arès', 'Dionysos'],
    correctAnswer: 'Hermès',
  ),
  Question(
    id: 'q3',
    questionText: 'Associez les dieux à leurs domaines respectifs :',
    questionType: 'lookup_table',
    columns: ["Dieu", "Domaine"],
    tableData: [
      {"Option": "Poséidon", "Criteria": "Mer"},
      {"Option": "Déméter", "Criteria": "Agriculture"},
      {"Option": "Arès", "Criteria": "Guerre"},
      {"Option": "Aphrodite", "Criteria": "Amour"},
    ],
  ),
  Question(
    id: 'q4',
    questionText: 'Qui a donné le feu aux humains selon la mythologie grecque ?',
    questionType: 'dropdown',
    dropdownOptions: [
      'Prométhée',
      'Héphaïstos',
      'Zeus',
      'Athéna',
    ],
    correctAnswer: 'Prométhée',
  ),
  Question(
    id: 'q5',
    questionText: 'Quel héros grec a tué le Minotaure ?',
    questionType: 'multiple_choice',
    options: ['Thésée', 'Héraclès', 'Achille', 'Persée'],
    correctAnswer: 'Thésée',
  ),
  Question(
    id: 'q6',
    questionText: 'Combien de travaux Héraclès devait-il accomplir initialement ?',
    questionType: 'slider',
    minValue: 10,
    maxValue: 15,
    correctAnswer: '10',
  ),
  Question(
    id: 'q7',
    questionText: 'Quelle déesse est associée à la sagesse et à la stratégie militaire ?',
    questionType: 'multiple_choice',
    options: ['Athéna', 'Artémis', 'Héra', 'Aphrodite'],
    correctAnswer: 'Athéna',
  ),
  Question(
    id: 'q8',
    questionText: 'Quel dieu grec est associé au soleil ?',
    questionType: 'multiple_choice',
    options: ['Apollon', 'Hélios', 'Zeus', 'Hermès'],
    correctAnswer: 'Apollon',
  ),
  Question(
    id: 'q9',
    questionText: 'Cliquez sur une image représentant une harpie',
    questionType: 'image_choice',
    imageOptions: [
      'lib/assets/harpy.jpg',
      'lib/assets/cerberus.jpg',
      'lib/assets/minotaur.jpg',
      'lib/assets/siren.jpg',
    ],
    correctAnswer: 'lib/assets/harpy.jpg',
  ),
  Question(
    id: 'q10',
    questionText: 'Quel dieu grec est associé au vin et à la fête ?',
    questionType: 'multiple_choice',
    options: ['Dionysos', 'Apollon', 'Arès', 'Hermès'],
    correctAnswer: 'Dionysos',
  ),
];
