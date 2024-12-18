import '../../models/question.dart';

final List<Question> cinemaThemeQuestions = 
[
  Question(
    id: 'q1',
    questionText: 'Quel film a remporté l\'Oscar du meilleur film en 2023 ?',
    questionType: 'multiple_choice',
    options: ['Everything Everywhere All At Once', 'Avatar : La Voie de l\'eau', 'Top Gun : Maverick', 'The Fabelmans'],
    correctAnswer: 'Everything Everywhere All At Once',
  ),
  Question(
    id: 'q2',
    questionText: 'Associez les réalisateurs à leurs films emblématiques :',
    questionType: 'lookup_table',
    columns: ["Réalisateur", "Film"],
    tableData: [
      {"Option": "Steven Spielberg", "Criteria": "Jurassic Park"},
      {"Option": "James Cameron", "Criteria": "Titanic"},
      {"Option": "Christopher Nolan", "Criteria": "Inception"},
      {"Option": "Quentin Tarantino", "Criteria": "Pulp Fiction"},
    ],
  ),
  Question(
    id: 'q3',
    questionText: 'Cliquez sur une image représentant "Le Parrain"',
    questionType: 'image_choice',
    imageOptions: [
      'lib/assets/godfather.jpg',
      'lib/assets/pulp_fiction.jpg',
      'lib/assets/casablanca.jpg',
      'lib/assets/inception.jpg',
    ],
    correctAnswer: 'lib/assets/godfather.jpg',
  ),
  Question(
    id: 'q4',
    questionText: 'Quel acteur a incarné le personnage de Jack Sparrow ?',
    questionType: 'multiple_choice',
    options: ['Johnny Depp', 'Orlando Bloom', 'Brad Pitt', 'Leonardo DiCaprio'],
    correctAnswer: 'Johnny Depp',
  ),
  Question(
    id: 'q5',
    questionText: 'Classez les films suivants selon leur date de sortie :',
    questionType: 'ranking',
    rankingOptions: {
      'Citizen Kane': 0,
      'The Godfather': 0,
      'Pulp Fiction': 0,
      'Inception': 0,
    },
    correctAnswer: ['Citizen Kane', 'The Godfather', 'Pulp Fiction', 'Inception'],
  ),
  Question(
    id: 'q6',
    questionText: 'Quel film est souvent considéré comme le premier film parlant ?',
    questionType: 'multiple_choice',
    options: ['Le Chanteur de jazz', 'Les Temps modernes', 'Metropolis', 'Un chien andalou'],
    correctAnswer: 'Le Chanteur de jazz',
  ),
  Question(
    id: 'q7',
    questionText: 'Quel acteur a remporté trois Oscars du meilleur acteur ?',
    questionType: 'multiple_choice',
    options: ['Daniel Day-Lewis', 'Tom Hanks', 'Denzel Washington', 'Jack Nicholson'],
    correctAnswer: 'Daniel Day-Lewis',
  ),
  Question(
    id: 'q8',
    questionText: 'Quel film d\'animation a remporté l\'Oscar en 2001 ?',
    questionType: 'multiple_choice',
    options: ['Shrek', 'Le Roi Lion', 'Toy Story', 'Monstres & Cie'],
    correctAnswer: 'Shrek',
  ),
  Question(
    id: 'q9',
    questionText: 'Quelle saga de science-fiction commence avec "Un nouvel espoir" ?',
    questionType: 'multiple_choice',
    options: ['Star Wars', 'Star Trek', 'Blade Runner', 'Dune'],
    correctAnswer: 'Star Wars',
  ),
];
