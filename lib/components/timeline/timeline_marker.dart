import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class TimelineMarker extends StatelessComponent {
  const TimelineMarker({
    super.key,
    this.accent = TimelineMarkerAccent.warm,
    this.animate = true,
  });

  final TimelineMarkerAccent accent;
  final bool animate;

  @override
  Component build(BuildContext context) {
    final classes = [
      'timeline-marker',
      'timeline-marker--${accent.name}',
      if (animate) 'timeline-marker--animated',
    ].join(' ');

    return div(classes: classes, [
      Component.element(
        tag: 'style',
        children: [Component.text(_timelineMarkerCss)],
      ),
      span(classes: 'timeline-marker__core', []),
    ]);
  }
}

enum TimelineMarkerAccent {
  warm,
  amber,
  clay,
  copper,
  gold,
}

const String _timelineMarkerCss = '''
.timeline-marker {
  --timeline-marker-fill: #ea580c;
  --timeline-marker-ring: rgba(234, 88, 12, 0.18);
  --timeline-marker-glow: rgba(249, 115, 22, 0.18);
  position: relative;
  display: inline-flex;
  align-items: center;
  justify-content: center;
  width: 0.95rem;
  height: 0.95rem;
  border-radius: 999px;
  opacity: 0.94;
}

.timeline-marker::before {
  content: '';
  position: absolute;
  inset: -0.42rem;
  border-radius: 999px;
  background: radial-gradient(circle, var(--timeline-marker-glow) 0%, rgba(249, 115, 22, 0) 74%);
  opacity: 0;
  transform: scale(0.82);
}

.timeline-marker::after {
  content: '';
  position: absolute;
  inset: 0;
  border-radius: 999px;
  border: 1px solid rgba(24, 24, 27, 0.08);
}

.timeline-marker__core {
  position: relative;
  z-index: 1;
  width: calc(100% - 0.28rem);
  height: calc(100% - 0.28rem);
  border-radius: 999px;
  border: 2px solid #f6f2eb;
  background: var(--timeline-marker-fill);
  box-shadow: 0 0 0 1px var(--timeline-marker-ring);
}

.timeline-marker--warm {
  --timeline-marker-fill: #ea580c;
  --timeline-marker-ring: rgba(234, 88, 12, 0.18);
  --timeline-marker-glow: rgba(249, 115, 22, 0.18);
}

.timeline-marker--amber {
  --timeline-marker-fill: #f59e0b;
  --timeline-marker-ring: rgba(245, 158, 11, 0.18);
  --timeline-marker-glow: rgba(251, 191, 36, 0.18);
}

.timeline-marker--clay {
  --timeline-marker-fill: #c2410c;
  --timeline-marker-ring: rgba(194, 65, 12, 0.18);
  --timeline-marker-glow: rgba(234, 88, 12, 0.16);
}

.timeline-marker--copper {
  --timeline-marker-fill: #b45309;
  --timeline-marker-ring: rgba(180, 83, 9, 0.18);
  --timeline-marker-glow: rgba(217, 119, 6, 0.16);
}

.timeline-marker--gold {
  --timeline-marker-fill: #ca8a04;
  --timeline-marker-ring: rgba(202, 138, 4, 0.18);
  --timeline-marker-glow: rgba(234, 179, 8, 0.16);
}

@supports (animation-timeline: view()) {
  .timeline-marker--animated {
    opacity: 0;
    transform: translateY(0.8rem) scale(0.94);
    animation: timeline-marker-activate 1ms both;
    animation-timeline: view();
    animation-range: entry 18% cover 42%;
  }
}

@keyframes timeline-marker-activate {
  0% {
    opacity: 0;
    transform: translateY(0.8rem) scale(0.94);
  }

  65% {
    opacity: 1;
    transform: translateY(0) scale(1.04);
  }

  100% {
    opacity: 1;
    transform: translateY(0) scale(1);
  }
}

@keyframes timeline-marker-glow {
  0%,
  100% {
    opacity: 0.1;
    transform: scale(0.88);
  }

  50% {
    opacity: 0.15;
    transform: scale(0.94);
  }
}

.timeline-marker--animated::before {
  animation: timeline-marker-glow 4.6s ease-in-out 1s infinite;
}

@media (prefers-reduced-motion: reduce) {
  .timeline-marker--animated,
  .timeline-marker--animated::before {
    animation: none !important;
    opacity: 1 !important;
    transform: none !important;
  }

  .timeline-marker::before {
    opacity: 0.12;
  }
}
''';
