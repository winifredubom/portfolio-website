import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class TimelineRail extends StatelessComponent {
  const TimelineRail({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'timeline-rail', [
      Component.element(
        tag: 'style',
        children: [Component.text(_timelineRailCss)],
      ),
      div(classes: 'timeline-rail__glow', []),
      div(classes: 'timeline-rail__line', []),
      div(classes: 'timeline-rail__origin', []),
    ]);
  }
}

const String _timelineRailCss = '''
.timeline-rail {
  display: none;
}

@media (min-width: 960px) {
  .timeline-rail {
    display: block;
    position: absolute;
    top: clamp(42rem, 84vh, 50rem);
    bottom: 0;
    left: calc((100vw - min(var(--content-max-width), calc(100vw - var(--content-gutter-desktop)))) / 2 + var(--timeline-rail-left));
    width: 2px;
    pointer-events: none;
    z-index: 0;
  }

  .timeline-rail__glow {
    position: absolute;
    inset: 0;
    width: 10px;
    margin-left: -4px;
    background: linear-gradient(180deg, rgba(251, 146, 60, 0) 0%, rgba(251, 146, 60, 0.05) 16%, rgba(251, 146, 60, 0.08) 52%, rgba(251, 146, 60, 0) 100%);
    filter: blur(7px);
    opacity: 0.78;
  }

  .timeline-rail__line {
    position: absolute;
    inset: 0;
    border-radius: 999px;
    background:
      linear-gradient(180deg, rgba(255, 255, 255, 0.68), rgba(255, 255, 255, 0) 16%),
      linear-gradient(180deg, rgba(24, 24, 27, 0.13) 0%, rgba(180, 83, 9, 0.17) 24%, rgba(180, 83, 9, 0.22) 52%, rgba(24, 24, 27, 0.12) 100%);
  }

  .timeline-rail__origin {
    position: absolute;
    top: 0.75rem;
    left: 50%;
    width: 0.84rem;
    height: 0.84rem;
    border-radius: 999px;
    border: 2px solid #fcfbf8;
    background: linear-gradient(135deg, #f59e0b, #ea580c);
    transform: translateX(-50%);
    box-shadow:
      0 0 0 1px rgba(234, 88, 12, 0.14),
      0 0 0 6px rgba(251, 146, 60, 0.06),
      0 0 14px rgba(249, 115, 22, 0.06);
  }
}
''';
