import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../core/data/portfolio_data.dart';
import '../layouts/site_container.dart';
import '../timeline/timeline_marker.dart';
import 'project_card.dart';

class ProjectsSection extends StatelessComponent {
  const ProjectsSection({super.key});

  @override
  Component build(BuildContext context) {
    return section(
      id: 'projects',
      classes: 'projects-section portfolio-section portfolio-section--projects',
      [
        Component.element(
          tag: 'style',
          children: [Component.text(_projectsSectionCss)],
        ),
        SiteContainer(
          children: [
            div(classes: 'projects-section__shell portfolio-shell', [
              div(
                classes: 'projects-section__marker portfolio-section-marker',
                const [TimelineMarker(accent: TimelineMarkerAccent.clay)],
              ),
              div(classes: 'projects-section__header portfolio-header', [
                h2(classes: 'projects-section__title portfolio-title', [
                  Component.text('Personal & Private Projects'),
                ]),
                p(classes: 'projects-section__copy portfolio-copy', [
                  Component.text(
                    'A concise set of mobile projects showcasing my approach to solving real-world problems.',
                  ),
                ]),
              ]),
            ]),
            div(
              classes: 'projects-section__list',
              [
                for (var index = 0; index < portfolioData.projects.length; index++)
                  ProjectCard(
                    project: portfolioData.projects[index],
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

const String _projectsSectionCss = '''
.projects-section {
  padding-top: calc(var(--section-space-lg) + 1.35rem);
}

.projects-section__header {
  max-width: none;
}

.projects-section__title {
  max-width: none;
}

.projects-section__copy {
  max-width: none;
}

.projects-section__list {
  display: grid;
  gap: 4.15rem;
  margin-top: 3.8rem;
}

@supports (animation-timeline: view()) {
  .projects-section__header {
    opacity: 0;
    transform: translateY(1rem);
    animation: projects-header-reveal 1ms both;
    animation-timeline: view();
    animation-range: entry 12% cover 30%;
  }
}

@keyframes projects-header-reveal {
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
  .projects-section__header {
    animation: none !important;
    opacity: 1 !important;
    transform: none !important;
  }
}

@media (max-width: 720px) {
  .projects-section {
    padding-top: calc(var(--section-space-lg) + 0.55rem);
  }

  .projects-section__title {
    max-width: 12ch;
  }

  .projects-section__copy {
    max-width: 30rem;
  }

  .projects-section__list {
    gap: 2.75rem;
    margin-top: 2.5rem;
  }
}
''';
