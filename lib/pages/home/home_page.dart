import 'package:jaspr/jaspr.dart';

import '../../components/contact/contact_section.dart';
import '../../components/experience/experience_section.dart';
import '../../components/hero/hero_section.dart';
import '../../components/journey/journey_section.dart';
import '../../components/layouts/site_shell.dart';
import '../../components/navigation/top_nav.dart';
import '../../components/projects/projects_section.dart';
import '../../components/skills/skills_section.dart';

class HomePage extends StatelessComponent {
  const HomePage({super.key});

  @override
  Component build(BuildContext context) {
    return SiteShell(
      children: [
       // const TopNav(),
        const HeroSection(),
        const JourneySection(),
        const SkillsSection(),
        const ProjectsSection(),
        const ExperienceSection(),
        const ContactSection(),
      ],
    );
  }
}
