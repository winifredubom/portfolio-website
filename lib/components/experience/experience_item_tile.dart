import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../core/models/experience_item.dart';
import '../timeline/timeline_marker.dart';

class ExperienceItemTile extends StatelessComponent {
  const ExperienceItemTile({
    required this.item,
    required this.index,
    super.key,
  });

  final ExperienceItem item;
  final int index;

  @override
  Component build(BuildContext context) {
    return div(
      classes: 'experience-entry',
      attributes: {'style': '--experience-index: $index;'},
      [
        Component.element(
          tag: 'style',
          children: [Component.text(_experienceItemTileCss)],
        ),
        div(
          classes: 'experience-entry__rail',
          const [TimelineMarker(accent: TimelineMarkerAccent.copper)],
        ),
        div(classes: 'experience-tile portfolio-panel', [
          h3(classes: 'experience-tile__role', [Component.text(item.role)]),
          div(classes: 'experience-tile__meta', [
            p(
              classes: 'experience-tile__company',
              [Component.text(item.company)],
            ),
            div(classes: 'experience-tile__period', [Component.text(item.period)]),
          ]),
          p(
            classes: 'experience-tile__summary',
            [Component.text(item.summary)],
          ),
        ]),
      ],
    );
  }
}

const String _experienceItemTileCss = '''
.experience-entry {
  display: grid;
  grid-template-columns: auto 1fr;
  gap: 1.9rem;
  align-items: start;
}

.experience-entry__rail {
  position: relative;
  display: flex;
  align-items: flex-start;
  justify-content: center;
  padding-top: 0.82rem;
  width: 1rem;
}

.experience-entry__rail::after {
  content: '';
  position: absolute;
  top: 1.7rem;
  bottom: -2.4rem;
  left: 50%;
  width: 1px;
  background: linear-gradient(180deg, rgba(24, 24, 27, 0.14), rgba(24, 24, 27, 0.025));
  transform: translateX(-50%);
}

.experience-entry:last-child .experience-entry__rail::after {
  display: none;
}

.experience-tile {
  display: grid;
  gap: 0.8rem;
  padding: 0.2rem 0 0.35rem;
  border: none;
  border-radius: 0;
  background: transparent;
  box-shadow: none;
}

.experience-tile__meta {
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  gap: 0.5rem 0.8rem;
}

.experience-tile__period {
  position: relative;
  padding-left: 0.82rem;
  font-size: 0.68rem;
  font-weight: 700;
  letter-spacing: 0.18em;
  text-transform: uppercase;
  color: #9a4c22;
}

.experience-tile__period::before {
  content: '';
  position: absolute;
  left: 0;
  top: 0.44rem;
  width: 0.26rem;
  height: 0.26rem;
  border-radius: 999px;
  background: rgba(180, 83, 9, 0.4);
}

.experience-tile__role {
  margin: 0;
  font-size: 1.66rem;
  line-height: 1.04;
  letter-spacing: -0.055em;
  color: #171311;
}

.experience-tile__company {
  margin: 0;
  font-size: 0.9rem;
  font-weight: 650;
  letter-spacing: 0.01em;
  color: #5f564d;
}

.experience-tile__summary {
  margin: 0.5rem 0 0;
  max-width: none;
  font-size: 0.95rem;
  line-height: 2;
  color: #6d645b;
}

@supports (animation-timeline: view()) {
  .experience-entry,
  .experience-entry__rail .timeline-marker {
    animation-timeline: view();
    animation-fill-mode: both;
  }

  .experience-entry {
    opacity: 0;
    transform: translateY(1rem);
    animation-name: experience-reveal;
    animation-duration: 1ms;
    animation-range: entry calc(14% + (var(--experience-index) * 6%)) cover calc(34% + (var(--experience-index) * 6%));
  }

  .experience-entry__rail .timeline-marker {
    opacity: 0;
    transform: translateY(1rem) scale(0.94);
    animation-name: experience-node-activate;
    animation-duration: 1ms;
    animation-range: entry calc(14% + (var(--experience-index) * 6%)) cover calc(34% + (var(--experience-index) * 6%));
  }
}

@keyframes experience-reveal {
  from {
    opacity: 0;
    transform: translateY(1rem);
  }

  to {
    opacity: 1;
    transform: translateY(0);
  }
}

@keyframes experience-node-activate {
  0% {
    opacity: 0;
    transform: translateY(1rem) scale(0.94);
    box-shadow: 0 0 0 1px rgba(234, 88, 12, 0.22);
  }

  65% {
    opacity: 1;
    transform: translateY(0) scale(1.12);
    box-shadow:
      0 0 0 1px rgba(234, 88, 12, 0.28),
      0 0 0 10px rgba(251, 146, 60, 0.15),
      0 0 18px rgba(249, 115, 22, 0.3);
  }

  100% {
    opacity: 1;
    transform: translateY(0) scale(1);
    box-shadow:
      0 0 0 1px rgba(234, 88, 12, 0.28),
      0 0 0 7px rgba(251, 146, 60, 0.1);
  }
}

@media (max-width: 720px) {
  .experience-entry {
    gap: 1rem;
  }

  .experience-tile {
    padding: 0.1rem 0 0.2rem;
  }
}

@media (prefers-reduced-motion: reduce) {
  .experience-entry,
  .experience-entry__rail .timeline-marker {
    animation: none !important;
    opacity: 1 !important;
    transform: none !important;
  }
}
''';
