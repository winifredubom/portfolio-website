import 'experience_item.dart';
import 'portfolio_profile.dart';
import 'project_item.dart';
import 'skill_category.dart';
import 'social_link.dart';

class PortfolioContent {
  const PortfolioContent({
    required this.profile,
    required this.skillCategories,
    required this.experiences,
    required this.projects,
    required this.socialLinks,
  });

  final PortfolioProfile profile;
  final List<SkillCategory> skillCategories;
  final List<ExperienceItem> experiences;
  final List<ProjectItem> projects;
  final List<SocialLink> socialLinks;
}
