import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../core/data/portfolio_data.dart';
import '../layouts/site_container.dart';
import '../timeline/timeline_marker.dart';
import 'skill_card.dart';

class SkillsSection extends StatelessComponent {
  const SkillsSection({super.key});

  @override
  Component build(BuildContext context) {
    return section(
      id: 'skills',
      classes: 'skills-section portfolio-section',
      [
        Component.element(
          tag: 'style',
          children: [Component.text(_skillsSectionCss)],
        ),
        SiteContainer(
          children: [
            div(classes: 'skills-section__shell portfolio-shell', [
              div(
                classes: 'skills-section__marker portfolio-section-marker',
                const [TimelineMarker(accent: TimelineMarkerAccent.gold)],
              ),
              div(classes: 'skills-section__header portfolio-header', [
                h2(classes: 'skills-section__title portfolio-title', [
                  Component.text('Technical Arsenal'),
                ]),
              ]),
            ]),
            div(
              classes: 'skills-section__grid',
              [
                for (var index = 0; index < portfolioData.skillCategories.length; index++)
                  SkillCard(
                    category: portfolioData.skillCategories[index],
                    index: index,
                  ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

const String _skillsSectionCss = '''
.skills-section__header {
  max-width: 52rem;
}

.skills-section__title {
  max-width: none;
}

.skills-section__grid {
  display: grid;
  gap: 1.9rem;
  margin-top: 3.25rem;
}

@media (min-width: 820px) {
  .skills-section__grid {
    grid-template-columns: repeat(2, minmax(0, 1fr));
  }
}

@supports (animation-timeline: view()) {
  .skills-section__header {
    opacity: 0;
    transform: translateY(1rem);
    animation: skills-header-reveal 1ms both;
    animation-timeline: view();
    animation-range: entry 12% cover 30%;
  }
}

@keyframes skills-header-reveal {
  from {
    opacity: 0;
    transform: translateY(1rem);
  }

  to {
    opacity: 1;
    transform: translateY(0);
  }
}

@media (prefers-reduced-motion: reduce) {
  .skills-section__header {
    animation: none !important;
    opacity: 1 !important;
    transform: none !important;
  }
}

@media (max-width: 720px) {
  .skills-section__title {
    max-width: 9ch;
  }

  .skills-section__grid {
    gap: 1.35rem;
    margin-top: 2.2rem;
  }
}
''';
