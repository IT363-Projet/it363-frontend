import '../../models/question.dart';

final List<Question> philosophyThemeQuestions = 
[
  Question(
    id: 'q1',
    questionText: 'Qui est considéré comme le père de la philosophie occidentale ?',
    questionType: 'multiple_choice',
    options: ['Socrate', 'Platon', 'Aristote', 'Descartes'],
    correctAnswer: 'Socrate',
  ),
  Question(
    id: 'q2',
    questionText: 'Associez les philosophes à leurs idées principales :',
    questionType: 'lookup_table',
    columns: ["Philosophe", "Idée principale"],
    tableData: [
      {"Option": "Descartes", "Criteria": "Cogito, ergo sum"},
      {"Option": "Nietzsche", "Criteria": "Surhomme"},
      {"Option": "Kant", "Criteria": "Impératif catégorique"},
      {"Option": "Platon", "Criteria": "Théorie des formes"},
    ],
  ),
  Question(
    id: 'q3',
    questionText: 'Cliquez sur une image représentant Platon',
    questionType: 'image_choice',
    imageOptions: [
      'lib/assets/plato.jpg',
      'lib/assets/aristotle.jpg',
      'lib/assets/socrates.jpg',
      'lib/assets/descartes.jpg',
    ],
    correctAnswer: 'lib/assets/plato.jpg',
  ),
  Question(
    id: 'q4',
    questionText: 'Quel philosophe a écrit "Ainsi parlait Zarathoustra" ?',
    questionType: 'multiple_choice',
    options: ['Friedrich Nietzsche', 'Arthur Schopenhauer', 'Jean-Paul Sartre', 'René Descartes'],
    correctAnswer: 'Friedrich Nietzsche',
  ),
  Question(
    id: 'q5',
    questionText: 'Classez les philosophes suivants selon leur chronologie :',
    questionType: 'ranking',
    rankingOptions: {
      'Socrate': 0,
      'Platon': 0,
      'Aristote': 0,
      'Descartes': 0,
    },
    correctAnswer: ['Socrate', 'Platon', 'Aristote', 'Descartes'],
  ),
  Question(
    id: 'q6',
    questionText: 'Associez les écoles de pensée à leurs fondateurs :',
    questionType: 'lookup_table',
    columns: ["École", "Fondateur"],
    tableData: [
      {"Option": "Stoïcisme", "Criteria": "Zénon de Kition"},
      {"Option": "Épicurisme", "Criteria": "Épicure"},
      {"Option": "Existentialisme", "Criteria": "Jean-Paul Sartre"},
      {"Option": "Empirisme", "Criteria": "John Locke"},
    ],
  ),
  Question(
    id: 'q7',
    questionText: 'Quelle est la principale œuvre de Jean-Jacques Rousseau sur la politique ?',
    questionType: 'multiple_choice',
    options: ['Du Contrat Social', 'L’Émile', 'Les Confessions', 'Le Discours sur l’origine des inégalités'],
    correctAnswer: 'Du Contrat Social',
  ),
  Question(
    id: 'q8',
    questionText: 'Combien de livres compose "La République" de Platon ?',
    questionType: 'slider',
    minValue: 5,
    maxValue: 15,
    correctAnswer: '10',
  ),
  Question(
    id: 'q9',
    questionText: 'Quel philosophe a proposé la "théorie de la justice" ?',
    questionType: 'multiple_choice',
    options: ['John Rawls', 'Hannah Arendt', 'Simone de Beauvoir', 'Karl Marx'],
    correctAnswer: 'John Rawls',
  ),
  Question(
    id: 'q10',
    questionText: 'Quel concept est au centre de la philosophie de Camus ?',
    questionType: 'multiple_choice',
    options: ['L’absurde', 'Le surhomme', 'La dialectique', 'Le cogito'],
    correctAnswer: 'L’absurde',
  ),
];
