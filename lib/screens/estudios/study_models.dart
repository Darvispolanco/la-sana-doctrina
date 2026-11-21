part of '../../main.dart';

class Study {
final String number;
final String title;
final String subtitle;
final String introduction;
final List<StudySection> sections;
final String conclusion;

const Study({
required this.number,
required this.title,
required this.subtitle,
required this.introduction,
required this.sections,
required this.conclusion,
});
}

class StudySection {
final String title;
final String content;
final String references;

const StudySection({
required this.title,
required this.content,
required this.references,
});
}
