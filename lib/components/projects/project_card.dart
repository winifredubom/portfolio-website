import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../core/models/project_item.dart';
import '../timeline/timeline_marker.dart';
import 'project_tag.dart';

class ProjectCard extends StatelessComponent {
  const ProjectCard({
    required this.project,
    required this.index,
    super.key,
  });

  final ProjectItem project;
  final int index;

  @override
  Component build(BuildContext context) {
    final expandId = 'project-expand-${_slug(project.name)}-$index';

    return div(
      classes: 'project-entry',
      attributes: {'style': '--project-index: $index;'},
      [
        Component.element(
          tag: 'style',
          children: [Component.text(_projectCardCss)],
        ),
        div(classes: 'project-entry__marker', [
          if (project.yearLabel != null)
            div(
              classes: 'project-entry__year',
              [Component.text(project.yearLabel!)],
            )
          else
            const TimelineMarker(accent: TimelineMarkerAccent.clay),
        ]),
        div(classes: 'project-card portfolio-panel', [
          input(
            id: expandId,
            type: InputType.checkbox,
            classes: 'project-card__toggle',
          ),
          div(classes: 'project-card__header', [
            div(classes: 'project-card__heading', [
              h3(classes: 'project-card__title', [Component.text(project.name)]),
              div(classes: 'project-card__type', [Component.text(project.type)]),
            ]),
            div(classes: 'project-card__actions', [
              _GithubIconAction(
                href: project.githubUrl,
                enabled: project.githubUrl != null && project.githubUrl!.isNotEmpty,
              ),
              label(
                classes: 'project-card__icon-button project-card__icon-button--expand',
                attributes: {
                  'for': expandId,
                  'role': 'button',
                  'tabindex': '0',
                  'aria-label': 'Expand project details',
                  'title': 'Expand project details',
                },
                [
                  span(classes: 'project-card__expand-icon', const [_ExpandIcon()]),
                ],
              ),
            ]),
          ]),
          div(
            classes: 'project-card__tags',
            [
              for (final tag in project.tags) ProjectTag(label: tag),
            ],
          ),
          p(
            classes: 'project-card__description',
            [Component.text(project.description)],
          ),
          div(classes: 'project-card__expanded', [
            div(classes: 'project-card__expanded-copy', [
              div(classes: 'project-card__expanded-label', [
                Component.text('Quick Summary'),
              ]),
              p(classes: 'project-card__expanded-text', [
                Component.text(project.quickSummary),
              ]),
            ]),
            div(classes: 'project-card__gallery', [
              for (final preview in project.previewImages)
                img(
                  src: preview.path,
                  alt: preview.alt,
                  classes: 'project-card__preview-image',
                  attributes: const {'loading': 'lazy'},
                ),
            ]),
          ]),
        ]),
      ],
    );
  }
}

String _slug(String value) {
  return value
      .toLowerCase()
      .replaceAll('&', 'and')
      .replaceAll(RegExp(r'[^a-z0-9]+'), '-')
      .replaceAll(RegExp(r'^-|-$'), '');
}

class _GithubIconAction extends StatelessComponent {
  const _GithubIconAction({
    required this.href,
    required this.enabled,
  });

  final String? href;
  final bool enabled;

  @override
  Component build(BuildContext context) {
    const icon = _GithubIcon();

    if (enabled && href != null) {
      return a(
        href: href!,
        classes: 'project-card__icon-button',
        attributes: const {
          'aria-label': 'Open GitHub repository',
          'title': 'Open GitHub repository',
        },
        const [icon],
      );
    }

    return div(
      classes: 'project-card__icon-button project-card__icon-button--disabled',
      attributes: const {
        'aria-label': 'GitHub repository unavailable',
        'title': 'GitHub repository unavailable',
      },
      const [icon],
    );
  }
}

class _GithubIcon extends StatelessComponent {
  const _GithubIcon();

  @override
  Component build(BuildContext context) {
    return svg(
      viewBox: '0 0 24 24',
      classes: 'project-card__icon-svg',
      attributes: const {
        'fill': 'none',
        'stroke': 'currentColor',
        'stroke-width': '1.8',
        'stroke-linecap': 'round',
        'stroke-linejoin': 'round',
        'aria-hidden': 'true',
      },
      [
        path(
          d: 'M9 19c-4.5 1.4-4.5-2.5-6-3m12 6v-3.5c0-1 .1-1.4-.5-2 2.8-.3 5.5-1.4 5.5-6.2A4.8 4.8 0 0 0 18.7 7c.1-.3.6-1.5-.1-3-1 0-1.8.3-3 1.2A10.4 10.4 0 0 0 12 5c-1.2 0-2.4.2-3.5.6C7.3 4.7 6.5 4.4 5.5 4.4c-.7 1.5-.2 2.7-.1 3A4.8 4.8 0 0 0 4 10.3c0 4.8 2.7 5.9 5.5 6.2-.4.4-.6.9-.5 1.8V22',
          [],
        ),
      ],
    );
  }
}

class _ExpandIcon extends StatelessComponent {
  const _ExpandIcon();

  @override
  Component build(BuildContext context) {
    return svg(
      viewBox: '0 0 24 24',
      classes: 'project-card__icon-svg',
      attributes: const {
        'fill': 'none',
        'stroke': 'currentColor',
        'stroke-width': '1.8',
        'stroke-linecap': 'round',
        'stroke-linejoin': 'round',
        'aria-hidden': 'true',
      },
      [
        path(d: 'M14 5h5v5', []),
        path(d: 'M10 19H5v-5', []),
        path(d: 'm19 5-7 7', []),
        path(d: 'm5 19 7-7', []),
      ],
    );
  }
}

const String _projectCardCss = '''
.project-entry {
  position: relative;
  display: block;
}

.project-entry__marker {
  position: absolute;
  top: 1.35rem;
  left: calc(-1 * var(--timeline-content-offset) + var(--timeline-rail-left) - 2.4rem);
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  gap: 1rem;
  width: 4.8rem;
  z-index: 1;
}

.project-entry__marker::after {
  content: '';
  width: 0.88rem;
  height: 0.88rem;
  border-radius: 999px;
  border: 3px solid #f6f2eb;
  background: linear-gradient(135deg, #fb923c, #ea580c);
  box-shadow:
    0 0 0 1px rgba(234, 88, 12, 0.14),
    0 0 16px rgba(249, 115, 22, 0.08);
}

.project-entry__year {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  min-width: 3.5rem;
  min-height: 2rem;
  padding: 0.28rem 0.78rem;
  border-radius: 999px;
  background: rgba(255, 252, 248, 0.82);
  border: 1px solid rgba(24, 24, 27, 0.05);
  color: #87796b;
  font-size: 0.72rem;
  font-weight: 700;
  letter-spacing: 0.14em;
  text-transform: uppercase;
}

.project-card {
  position: relative;
  display: grid;
  gap: 1.75rem;
  padding: 2.7rem 2.65rem 2.75rem;
  border-radius: 1.75rem;
  background: linear-gradient(180deg, rgba(255, 254, 251, 0.52), rgba(255, 249, 241, 0.1));
  box-shadow: 0 10px 24px rgba(33, 24, 18, 0.024);
  transition:
    transform 180ms ease,
    box-shadow 180ms ease,
    border-color 180ms ease;
}

.project-entry:hover .project-card {
  transform: translateY(-0.12rem);
  border-color: rgba(251, 146, 60, 0.06);
  box-shadow: 0 14px 30px rgba(33, 24, 18, 0.034);
}

.project-card__toggle {
  position: absolute;
  opacity: 0;
  pointer-events: none;
}

.project-card__header {
  display: flex;
  align-items: start;
  justify-content: space-between;
  gap: 1.4rem;
}

.project-card__heading {
  min-width: 0;
}

.project-card__title {
  margin: 0;
  font-size: 1.74rem;
  line-height: 1.02;
  letter-spacing: -0.055em;
  color: #171311;
}

.project-card__type {
  margin-top: 0.72rem;
  font-size: 0.68rem;
  font-weight: 700;
  letter-spacing: 0.17em;
  text-transform: uppercase;
  color: #9a4c22;
}

.project-card__description {
  margin: 0;
  max-width: 36rem;
  font-size: 0.96rem;
  line-height: 1.98;
  color: #6d645b;
}

.project-card__tags {
  display: flex;
  flex-wrap: wrap;
  gap: 0.48rem;
}

.project-tag {
  display: inline-flex;
  align-items: center;
  min-height: 1.75rem;
  padding: 0.14rem 0.56rem;
  border-radius: 999px;
  background: rgba(255, 248, 239, 0.22);
  border: 1px solid rgba(24, 24, 27, 0.025);
  color: #8e8173;
  font-size: 0.7rem;
  font-weight: 600;
  letter-spacing: 0.01em;
}

.project-card__actions {
  display: flex;
  align-items: center;
  gap: 0.8rem;
}

.project-card__icon-button {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  width: 2.35rem;
  height: 2.35rem;
  border-radius: 999px;
  border: 1px solid rgba(24, 24, 27, 0.06);
  background: rgba(255, 252, 248, 0.78);
  color: #71665c;
  text-decoration: none;
  cursor: pointer;
  transition:
    transform 180ms ease,
    border-color 180ms ease,
    color 180ms ease,
    box-shadow 180ms ease;
}

.project-card__icon-button:hover {
  transform: translateY(-0.08rem);
  border-color: rgba(234, 88, 12, 0.14);
  color: #8a3d16;
  box-shadow: 0 8px 18px rgba(33, 24, 18, 0.03);
}

.project-card__icon-button--disabled {
  opacity: 0.52;
  cursor: default;
}

.project-card__icon-svg {
  width: 1.18rem;
  height: 1.18rem;
}

.project-card__expand-icon {
  display: inline-flex;
  transition: transform 180ms ease;
}

.project-card__toggle:checked ~ .project-card__header .project-card__expand-icon {
  transform: rotate(45deg) scale(0.98);
}

.project-card__expanded {
  display: grid;
  gap: 1.3rem;
  max-height: 0;
  opacity: 0;
  overflow: hidden;
  border-top: 1px solid rgba(24, 24, 27, 0.06);
  padding-top: 0;
  transition:
    max-height 260ms ease,
    opacity 220ms ease,
    padding-top 220ms ease;
}

.project-card__toggle:checked ~ .project-card__expanded {
  max-height: 48rem;
  opacity: 1;
  padding-top: 1.55rem;
}

.project-card__expanded-label {
  font-size: 0.7rem;
  font-weight: 700;
  letter-spacing: 0.16em;
  text-transform: uppercase;
  color: #9a4c22;
}

.project-card__expanded-text {
  margin: 0.7rem 0 0;
  max-width: 40rem;
  font-size: 0.92rem;
  line-height: 1.84;
  color: #6b6259;
}

.project-card__gallery {
  display: grid;
  gap: 0.9rem;
  grid-template-columns: repeat(auto-fit, minmax(15rem, 1fr));
}

.project-card__preview-image {
  display: block;
  width: 100%;
  border-radius: 1.1rem;
  border: 1px solid rgba(24, 24, 27, 0.06);
  background: rgba(255, 255, 255, 0.68);
}

@supports (animation-timeline: view()) {
  .project-card,
  .project-entry__year,
  .project-entry__marker::after {
    animation-timeline: view();
    animation-fill-mode: both;
  }

  .project-card {
    opacity: 0;
    transform: translateY(1rem);
    animation-name: project-card-reveal;
    animation-duration: 1ms;
    animation-range: entry calc(12% + (var(--project-index) * 5%)) cover calc(32% + (var(--project-index) * 5%));
  }

  .project-entry__year,
  .project-entry__marker::after {
    opacity: 0;
    transform: translateY(1rem) scale(0.96);
    animation-name: project-marker-reveal;
    animation-duration: 1ms;
    animation-range: entry calc(12% + (var(--project-index) * 5%)) cover calc(32% + (var(--project-index) * 5%));
  }
}

@keyframes project-card-reveal {
  from {
    opacity: 0;
    transform: translateY(1rem);
  }

  to {
    opacity: 1;
    transform: translateY(0);
  }
}

@keyframes project-marker-reveal {
  0% {
    opacity: 0;
    transform: translateY(1rem) scale(0.96);
  }

  70% {
    opacity: 1;
    transform: translateY(0) scale(1.04);
  }

  100% {
    opacity: 1;
    transform: translateY(0) scale(1);
  }
}

@media (max-width: 720px) {
  .project-entry {
    display: grid;
    gap: 1rem;
  }

  .project-entry__marker {
    position: relative;
    top: auto;
    left: auto;
    align-items: flex-start;
    padding-top: 0;
    width: auto;
  }

  .project-card {
    padding: 2rem 1.45rem 2.05rem;
    gap: 1.4rem;
  }

  .project-card__header {
    gap: 1rem;
    flex-direction: column;
  }

  .project-card__title {
    font-size: 1.44rem;
  }
}

@media (prefers-reduced-motion: reduce) {
  .project-card,
  .project-entry__year,
  .project-entry__marker::after {
    animation: none !important;
    opacity: 1 !important;
    transform: none !important;
  }

  .project-card,
  .project-card__icon-button,
  .project-card__expand-icon,
  .project-card__expanded {
    transition: none !important;
  }
}
''';
