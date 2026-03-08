import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../core/models/skill_category.dart';

class SkillCard extends StatelessComponent {
  const SkillCard({
    required this.category,
    required this.index,
    super.key,
  });

  final SkillCategory category;
  final int index;

  @override
  Component build(BuildContext context) {
    return div(
      classes: 'skill-card portfolio-panel skill-card--${_slug(category.title)}',
      attributes: {'style': '--skill-card-index: $index;'},
      [
        Component.element(
          tag: 'style',
          children: [Component.text(_skillCardCss)],
        ),
        div(classes: 'skill-card__icon-wrap', [
          div(classes: 'skill-card__icon', [_iconFor(category.title)]),
        ]),
        div(classes: 'skill-card__content', [
          h3(classes: 'skill-card__title', [Component.text(category.title)]),
          ul(
            classes: 'skill-card__list',
            [
              for (final skill in category.skills) li(classes: 'skill-card__item', [Component.text(skill)]),
            ],
          ),
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

Component _iconFor(String title) {
  switch (title) {
    case 'Mobile Development':
      return _svgIcon([
        _path(
          'M8 3h8a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2H8a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2Z',
        ),
        _path('M10 7h4'),
        _path('M12 17h.01'),
      ]);
    case 'Architecture & State':
      return _svgIcon([
        _path('M4 6h16'),
        _path('M7 12h10'),
        _path('M10 18h4'),
        _path('M6 4v4'),
        _path('M12 10v4'),
        _path('M18 16v4'),
      ]);
    case 'Backend & Realtime':
      return _svgIcon([
        _path('M12 3 4 7v10l8 4 8-4V7l-8-4Z'),
        _path('M4 7l8 4 8-4'),
        _path('M12 11v10'),
      ]);
    default:
      return _svgIcon([
        _path('M12 3v18'),
        _path('M3 12h18'),
        _path('m5.6 5.6 12.8 12.8'),
        _path('m18.4 5.6-12.8 12.8'),
      ]);
  }
}

Component _svgIcon(List<Component> children) {
  return svg(
    viewBox: '0 0 24 24',
    classes: 'skill-card__icon-svg',
    attributes: const {
      'fill': 'none',
      'stroke': 'currentColor',
      'stroke-width': '1.7',
      'stroke-linecap': 'round',
      'stroke-linejoin': 'round',
      'aria-hidden': 'true',
    },
    children,
  );
}

Component _path(String d) {
  return path(d: d, []);
}

const String _skillCardCss = '''
.skill-card {
  --skill-accent: #60a5fa;
  --skill-accent-soft: rgba(96, 165, 250, 0.14);
  --skill-accent-border: rgba(96, 165, 250, 0.18);
  display: grid;
  grid-template-columns: auto 1fr;
  gap: 1rem;
  min-height: 100%;
  padding: 1.75rem 1.55rem 1.8rem;
  border-radius: 1.3rem;
  border-color: var(--skill-accent-border);
  background: linear-gradient(180deg, rgba(255, 255, 255, 0.88), rgba(255, 251, 246, 0.68));
  box-shadow: 0 6px 18px rgba(33, 24, 18, 0.022);
  transition:
    transform 180ms ease,
    box-shadow 180ms ease,
    border-color 180ms ease;
}

.skill-card:hover {
  transform: translateY(-0.12rem);
  border-color: color-mix(in srgb, var(--skill-accent) 20%, rgba(24, 24, 27, 0.04));
  box-shadow: 0 10px 22px rgba(33, 24, 18, 0.03);
}

.skill-card__icon-wrap {
  display: flex;
  align-items: flex-start;
}

.skill-card__icon {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  width: 2.75rem;
  height: 2.75rem;
  border-radius: 0.82rem;
  background: linear-gradient(135deg, var(--skill-accent-soft), rgba(255, 255, 255, 0.7));
  color: var(--skill-accent);
  box-shadow: inset 0 0 0 1px color-mix(in srgb, var(--skill-accent) 14%, rgba(24, 24, 27, 0.02));
  transition: transform 180ms ease, box-shadow 180ms ease;
}

.skill-card:hover .skill-card__icon {
  transform: scale(1.05);
  box-shadow:
    inset 0 0 0 1px color-mix(in srgb, var(--skill-accent) 22%, rgba(24, 24, 27, 0.02)),
    0 8px 18px color-mix(in srgb, var(--skill-accent) 12%, transparent);
}

.skill-card__icon-svg {
  width: 1.26rem;
  height: 1.26rem;
}

.skill-card__content {
  min-width: 0;
}

.skill-card__title {
  margin: 0;
  font-size: 1.02rem;
  line-height: 1.08;
  letter-spacing: -0.035em;
  color: #171311;
}

.skill-card__list {
  margin: 1rem 0 0;
  padding: 0;
  list-style: none;
  display: grid;
  gap: 0.56rem;
}

.skill-card__item {
  position: relative;
  padding-left: 0.92rem;
  font-size: 0.84rem;
  line-height: 1.62;
  color: #696158;
}

.skill-card__item::before {
  content: '';
  position: absolute;
  left: 0;
  top: 0.5rem;
  width: 0.34rem;
  height: 0.34rem;
  border-radius: 999px;
  background: var(--skill-accent);
}

.skill-card--mobile-development {
  --skill-accent: #60a5fa;
  --skill-accent-soft: rgba(96, 165, 250, 0.16);
  --skill-accent-border: rgba(96, 165, 250, 0.18);
}

.skill-card--architecture-and-state {
  --skill-accent: #c084fc;
  --skill-accent-soft: rgba(192, 132, 252, 0.16);
  --skill-accent-border: rgba(192, 132, 252, 0.18);
}

.skill-card--backend-and-realtime {
  --skill-accent: #34d399;
  --skill-accent-soft: rgba(52, 211, 153, 0.16);
  --skill-accent-border: rgba(52, 211, 153, 0.18);
}

.skill-card--product-delivery-and-tools {
  --skill-accent: #fbbf24;
  --skill-accent-soft: rgba(251, 191, 36, 0.16);
  --skill-accent-border: rgba(251, 191, 36, 0.2);
}

@supports (animation-timeline: view()) {
  .skill-card {
    opacity: 0;
    transform: translateY(1.1rem);
    animation: skill-card-reveal 1ms both;
    animation-timeline: view();
    animation-range: entry calc(14% + (var(--skill-card-index) * 6%)) cover calc(36% + (var(--skill-card-index) * 6%));
  }
}

@keyframes skill-card-reveal {
  from {
    opacity: 0;
    transform: translateY(1.1rem);
  }

  to {
    opacity: 1;
    transform: translateY(0);
  }
}

@media (prefers-reduced-motion: reduce) {
  .skill-card {
    animation: none !important;
    opacity: 1 !important;
    transform: none !important;
  }

  .skill-card,
  .skill-card__icon {
    transition: none !important;
  }
}

@media (max-width: 720px) {
  .skill-card {
    padding: 1.45rem 1.15rem 1.5rem;
    gap: 0.95rem;
  }

  .skill-card__icon {
    width: 2.55rem;
    height: 2.55rem;
  }
}
''';
