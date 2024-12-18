import '../../models/Question.dart';

final List<Question> sciFiThemeQuestions = [
  Question(
    id: 'q1',
    questionText: 'Qui a réalisé "Blade Runner" ?',
    questionType: 'single_choice',
    options: [
      'Ridley Scott',
      'Steven Spielberg',
      'Christopher Nolan',
      'James Cameron',
    ],
    correctAnswer: 'Ridley Scott',
  ),
  Question(
    id: 'q2',
    questionText: 'Cliquez sur le vaisseau TARDIS :',
    questionType: 'image_choice',
    imageOptions: [
      'lib/assets/images/millennium_falcon.jpg',
      'lib/assets/images/enterprise.jpg',
      'lib/assets/images/tardis.jpg',
      'lib/assets/images/xwing.jpg',
    ],
    correctAnswer: 'lib/assets/images/tardis.jpg',
  ),
  Question(
    id: 'q3',
    questionText: "Combien d'Oscars a remporté 'Avatar' en 2010 ?",
    questionType: 'slider',
    minValue: 0,
    maxValue: 10,
    correctAnswer: '3',
  ),
  Question(
    id: 'q4',
    questionText: 'Classez ces films par ordre de sortie (du plus ancien au plus récent) :',
    questionType: 'ranking',
    rankingOptions: {
      '2001: L’Odyssée de l’espace': 0,
      'Star Wars: Un Nouvel Espoir': 0,
      'Blade Runner': 0,
      'Interstellar': 0,
    },
    correctAnswer: [
      '2001: L’Odyssée de l’espace',
      'Star Wars: Un Nouvel Espoir',
      'Blade Runner',
      'Interstellar',
    ],
  ),
  Question(
    id: 'q5',
    questionText: 'Cochez les films mettant en scène des robots :',
    questionType: 'multiple_choice',
    columns: ["Film", "Présence de robots"],
    tableData: [
      {"Option": "I, Robot", "Criteria": "Oui"},
      {"Option": "Gravity", "Criteria": "Non"},
      {"Option": "Wall-E", "Criteria": "Oui"},
      {"Option": "Inception", "Criteria": "Non"},
    ],
  ),
  Question(
    id: 'q6',
    questionText: 'Quel acteur joue le rôle principal dans "Inception" ?',
    questionType: 'dropdown',
    dropdownOptions: [
      'Leonardo DiCaprio',
      'Matt Damon',
      'Brad Pitt',
      'Keanu Reeves',
    ],
    correctAnswer: 'Leonardo DiCaprio',
  ),
  Question(
    id: 'q7',
    questionText: "Quelle est la planète d'origine de Luke Skywalker dans Star Wars ?",
    questionType: 'single_choice',
    options: [
      'Tatooine',
      'Hoth',
      'Endor',
      'Naboo',
    ],
    correctAnswer: 'Tatooine',
  ),
  Question(
    id: 'q8',
    questionText: 'Cliquez sur le personnage de Wall-E :',
    questionType: 'image_choice',
    imageOptions: [
      'lib/assets/wall-e.jpg',
      'lib/assets/r2d2.jpg',
      'lib/assets/bb8.jpg',
      'lib/assets/c3po.jpg',
    ],
    correctAnswer: 'lib/assets/wall-e.jpg',
  ),
  Question(
    id: 'q9',
    questionText: 'Classez ces franchises par leur popularité (du plus populaire au moins populaire) :',
    questionType: 'ranking',
    rankingOptions: {
      'Star Wars': 0,
      'The Matrix': 0,
      'Avatar': 0,
      'Blade Runner': 0,
    },
    correctAnswer: [
      'Star Wars',
      'Avatar',
      'The Matrix',
      'Blade Runner',
    ],
  ),
  Question(
    id: 'q10',
    questionText: 'En quelle année est sorti le premier film "The Matrix" ?',
    questionType: 'slider',
    minValue: 1990,
    maxValue: 2000,
    correctAnswer: '1999',
  ),
];
