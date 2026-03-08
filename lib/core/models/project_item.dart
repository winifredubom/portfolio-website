class ProjectItem {
  const ProjectItem({
    required this.name,
    required this.type,
    required this.description,
    required this.tags,
    required this.quickSummary,
    required this.previewImages,
    this.yearLabel,
    this.githubUrl,
    this.caseStudyUrl,
  });

  final String name;
  final String type;
  final String description;
  final List<String> tags;
  final String quickSummary;
  final List<ProjectPreviewImage> previewImages;
  final String? yearLabel;
  final String? githubUrl;
  final String? caseStudyUrl;
}

class ProjectPreviewImage {
  const ProjectPreviewImage({
    required this.path,
    required this.alt,
  });

  final String path;
  final String alt;
}
