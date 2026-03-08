import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../core/data/portfolio_data.dart';
import '../layouts/site_container.dart';
import '../timeline/timeline_marker.dart';
import 'experience_item_tile.dart';

class ExperienceSection extends StatelessComponent {
  const ExperienceSection({super.key});

  @override
  Component build(BuildContext context) {
    return section(
      id: 'experience',
      classes: 'experience-section portfolio-section',
      [
        Component.element(
          tag: 'style',
          children: [Component.text(_experienceSectionCss)],
        ),
        SiteContainer(
          children: [
            div(classes: 'experience-section__shell portfolio-shell', [
              div(
                classes: 'experience-section__marker portfolio-section-marker',
                const [TimelineMarker(accent: TimelineMarkerAccent.copper)],
              ),
              div(classes: 'experience-section__header portfolio-header', [
                h2(classes: 'experience-section__title portfolio-title', [
                  Component.text('Professional History'),
                ]),
              ]),
            ]),
            div(
              classes: 'experience-section__list',
              [
                for (var index = 0; index < portfolioData.experiences.length; index++)
                  ExperienceItemTile(
                    item: portfolioData.experiences[index],
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

const String _experienceSectionCss = '''
.experience-section__header {
  max-width: none;
}

.experience-section__title {
  max-width: none;
}

.experience-section__list {
  display: grid;
  gap: 4rem;
  margin-top: 3.55rem;
}

@supports (animation-timeline: view()) {
  .experience-section__header {
    opacity: 0;
    transform: translateY(1rem);
    animation: experience-header-reveal 1ms both;
    animation-timeline: view();
    animation-range: entry 12% cover 30%;
  }
}

@keyframes experience-header-reveal {
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
  .experience-section__header {
    animation: none !important;
    opacity: 1 !important;
    transform: none !important;
  }
}

@media (max-width: 720px) {
  .experience-section__title {
    max-width: 12ch;
  }

  .experience-section__list {
    gap: 2.75rem;
    margin-top: 2.45rem;
  }
}
''';
