class ExperienceItem {
  const ExperienceItem({
    required this.role,
    required this.company,
    required this.period,
    required this.summary,
    required this.location,
    required this.workMode,
    required this.highlights,
  });

  final String role;
  final String company;
  final String period;
  final String summary;
  final String location;
  final String workMode;
  final List<String> highlights;
}
