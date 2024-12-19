import '../../models/Question.dart';

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
    questionType: 'single_choice',
    options: ['Hermès', 'Apollon', 'Arès', 'Dionysos'],
    correctAnswer: 'Hermès',
  ),
  Question(
    id: 'q3',
    questionText: 'Associez les dieux à leurs domaines respectifs :',
    questionType: 'multiple_choice',
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
    questionType: 'single_choice',
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
    questionType: 'single_choice',
    options: ['Athéna', 'Artémis', 'Héra', 'Aphrodite'],
    correctAnswer: 'Athéna',
  ),
  Question(
    id: 'q8',
    questionText: 'Quel dieu grec est associé au soleil ?',
    questionType: 'single_choice',
    options: ['Apollon', 'Hélios', 'Zeus', 'Hermès'],
    correctAnswer: 'Apollon',
  ),
  Question(
    id: 'q9',
    questionText: 'Cliquez sur une image représentant une harpie',
    questionType: 'image_choice',
    imageOptions: [
      'lib/assets/images/harpy.jpg',
      'lib/assets/images/cerberus.jpg',
      'lib/assets/images/minotaur.jpg',
      'lib/assets/images/siren.jpg',
    ],
    correctAnswer: 'lib/assets/images/harpy.jpg',
  ),
  Question(
    id: 'q10',
    questionText: 'Quel dieu grec est associé au vin et à la fête ?',
    questionType: 'single_choice',
    options: ['Dionysos', 'Apollon', 'Arès', 'Hermès'],
    correctAnswer: 'Dionysos',
  ),
];
