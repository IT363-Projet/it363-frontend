import '../../models/question.dart';

final List<Question> LHthemeQuestions = 
[
  Question(
    id: 'q1',
    questionText: 'Classez les planètes de la plus grande à la plus petite :',
    questionType: 'ranking',
    rankingOptions: {
      'Jupiter': 0,
      'Neptune': 0,
      'Uranus': 0,
      'Saturne': 0,
    },
    correctAnswer: ['Jupiter', 'Saturne', 'Uranus', 'Neptune'],
  ),
  Question(
    id: 'q2',
    questionText: 'Cliquez sur Neptune',
    questionType: 'image_choice',
    imageOptions: [
      'lib/assets/Jupiter.jpg',
      'lib/assets/mercure.jpg',
      'lib/assets/uranus.jpg',
      'lib/assets/neptune.jpg',
    ],
    correctAnswer: 'lib/assets/neptune.jpg',
  ),
  Question(
    id: 'q3',
    questionText: 'Combien de planètes composent le système solaire ?',
    questionType: 'slider',
    minValue: 6,
    maxValue: 9,
    correctAnswer: '8',
  ),
  Question(
    id: 'q4',
    questionText: 'Quelle planète est surnomée la "planète rouge" ?',
    questionType: 'multiple_choice',
    options: ['Mars', 'Vénus', 'Mercure', 'Neptune'],
    correctAnswer: 'Mars',
  ),
  Question(
    id: 'q5',
    questionText: 'Cochez les planètes gazeuses:',
    questionType: 'lookup_table',
    columns: ["Planète", "Gazeuse"],
    tableData: [
      {"Option": "Saturne", "Criteria": "gazeuse"},
      {"Option": "Vénus", "Criteria": "solide"},
      {"Option": "Mercure", "Criteria": "solide"},
      {"Option": "Uranus", "Criteria": "gazeuse"},
    ],
  ),
    Question(
    id: 'q6',
    questionText: 'Quelle est la planète la plus proche du Soleil ?',
    questionType: 'dropdown',
    dropdownOptions: [
      'Mercure',
      'Vénus',
      'Mars',
      'Terre',
    ],
    correctAnswer: 'Mercure', 
  ),  
];


