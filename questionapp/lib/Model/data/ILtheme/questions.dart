import '../../models/question.dart';

final List<Question> sportThemeQuestions = 
[
  Question(
    id: 'q1',
    questionText: 'Classez les sports suivants selon leur popularité mondiale (du plus populaire au moins populaire) :',
    questionType: 'ranking',
    rankingOptions: {
      'Football': 0,
      'Basketball': 0,
      'Tennis': 0,
      'Cricket': 0,
    },
    correctAnswer: ['Football', 'Cricket', 'Basketball', 'Tennis'],
  ),
  Question(
    id: 'q3',
    questionText: 'Quel pays a remporté la Coupe du Monde de football en 2018 ?',
    questionType: 'multiple_choice',
    options: ['Brésil', 'Allemagne', 'France', 'Argentine'],
    correctAnswer: 'France',
  ),
  Question(
    id: 'q4',
    questionText: 'Quelle discipline est incluse dans le décathlon ?',
    questionType: 'dropdown',
    dropdownOptions: [
      'Natation',
      '100 mètres',
      'Cyclisme',
      'Escalade',
    ],
    correctAnswer: '100 mètres',
  ),
  Question(
    id: 'q5',
    questionText: 'Quel joueur de basketball est surnommé "King James" ?',
    questionType: 'multiple_choice',
    options: ['Kobe Bryant', 'LeBron James', 'Michael Jordan', 'Shaquille O\'Neal'],
    correctAnswer: 'LeBron James',
  ),
  Question(
    id: 'q6',
    questionText: 'Classez les pays suivants selon leur nombre de médailles aux Jeux Olympiques de Tokyo 2020 (du plus au moins) :',
    questionType: 'ranking',
    rankingOptions: {
      'États-Unis': 0,
      'Chine': 0,
      'Japon': 0,
      'Royaume-Uni': 0,
    },
    correctAnswer: ['États-Unis', 'Chine', 'Japon', 'Royaume-Uni'],
  ),
  Question(
    id: 'q7',
    questionText: 'Combien de sets faut-il gagner pour remporter un match de tennis en Grand Chelem masculin ?',
    questionType: 'slider',
    minValue: 2,
    maxValue: 5,
    correctAnswer: '3',
  ),
  Question(
    id: 'q8',
    questionText: 'Quel est le sport national du Canada ?',
    questionType: 'multiple_choice',
    options: ['Hockey sur glace', 'Baseball', 'Football américain', 'Cricket'],
    correctAnswer: 'Hockey sur glace',
  ),
  Question(
    id: 'q9',
    questionText: 'Quelle est la durée maximale d\'un match de football professionnel ?',
    questionType: 'multiple_choice',
    options: ['60 minutes', '90 minutes', '120 minutes', 'Indéterminée'],
    correctAnswer: '90 minutes',
  ),
  Question(
    id: 'q10',
    questionText: 'Quel sport utilise le terme "home run" ?',
    questionType: 'multiple_choice',
    options: ['Baseball', 'Cricket', 'Football', 'Basketball'],
    correctAnswer: 'Baseball',
  ),
];
