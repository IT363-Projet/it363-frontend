import '../../models/Question.dart';

final List<Question> geographyThemeQuestions = 
[
  Question(
    id: 'q1',
    questionText: 'Classez les continents du plus grand au plus petit en superficie :',
    questionType: 'ranking',
    rankingOptions: {
      'Asie': 0,
      'Amérique du Nord': 0,
      'Afrique': 0,
      'Océanie': 0,
      'Europe': 0,
    },
    correctAnswer: ['Asie', 'Afrique', 'Amérique du Nord', 'Europe', 'Océanie'],
  ),
  Question(
    id: 'q2',
    questionText: 'Cliquez sur le Mont Everest',
    questionType: 'image_choice',
    imageOptions: [
      'lib/assets/images/K2.jpg',
      'lib/assets/images/everest.jpg',
      'lib/assets/images/aconcagua.jpg',
      'lib/assets/images/mont_blanc.jpg',
    ],
    correctAnswer: 'lib/assets/everest.jpg',
  ),
  Question(
    id: 'q3',
    questionText: 'Combien de pays composent l\'Afrique ?',
    questionType: 'slider',
    minValue: 50,
    maxValue: 60,
    correctAnswer: '54',
  ),
  Question(
    id: 'q4',
    questionText: 'Quel pays a la plus grande population ?',
    questionType: 'single_choice',
    options: ['Chine', 'Inde', 'États-Unis', 'Indonésie'],
    correctAnswer: 'Chine',
  ),
  Question(
    id: 'q5',
    questionText: 'Cochez les fleuves qui traversent l\'Europe :',
    questionType: 'multiple_choice',
    columns: ["Fleuve", "Continent"],
    tableData: [
      {"Option": "Danube", "Criteria": "Europe"},
      {"Option": "Nil", "Criteria": "Afrique"},
      {"Option": "Yangtsé", "Criteria": "Asie"},
      {"Option": "Volga", "Criteria": "Europe"},
    ],
  ),
  Question(
    id: 'q6',
    questionText: 'Quelle est la capitale de la France ?',
    questionType: 'dropdown',
    dropdownOptions: [
      'Londres',
      'Paris',
      'Berlin',
      'Madrid',
    ],
    correctAnswer: 'Paris',
  ),
  Question(
    id: 'q7',
    questionText: 'Quel océan est le plus grand ?',
    questionType: 'single_choice',
    options: ['Atlantique', 'Pacifique', 'Indien', 'Arctique'],
    correctAnswer: 'Pacifique',
  ),
  Question(
    id: 'q8',
    questionText: 'Cliquez sur l\'Australie',
    questionType: 'image_choice',
    imageOptions: [
      'lib/assets/images/afrique.jpg',
      'lib/assets/images/europe.jpg',
      'lib/assets/images/australie.jpg',
      'lib/assets/images/asie.jpg',
    ],
    correctAnswer: 'lib/assets/images/australie.jpg',
  ),
  Question(
    id: 'q9',
    questionText: 'Classez les pays suivants selon leur superficie (du plus grand au plus petit) :',
    questionType: 'ranking',
    rankingOptions: {
      'Russie': 0,
      'Canada': 0,
      'États-Unis': 0,
      'Chine': 0,
    },
    correctAnswer: ['Russie', 'Canada', 'Chine', 'États-Unis'],
  ),
  Question(
    id: 'q10',
    questionText: 'Combien de continents existe-t-il ?',
    questionType: 'slider',
    minValue: 4,
    maxValue: 8,
    correctAnswer: '7',
  ),
];
