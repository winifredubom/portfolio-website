import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class JourneyHighlight extends StatelessComponent {
  const JourneyHighlight({
    required this.stage,
    required this.title,
    required this.copy,
    super.key,
  });

  final String stage;
  final String title;
  final String copy;

  @override
  Component build(BuildContext context) {
    return div(classes: 'journey-highlight portfolio-panel', [
      Component.element(
        tag: 'style',
        children: [Component.text(_journeyHighlightCss)],
      ),
      div(classes: 'journey-highlight__stage', [Component.text(stage)]),
      h3(classes: 'journey-highlight__title', [Component.text(title)]),
      p(classes: 'journey-highlight__copy', [Component.text(copy)]),
    ]);
  }
}

const String _journeyHighlightCss = '''
.journey-highlight {
  position: relative;
  height: 100%;
  padding: 1.7rem 1.6rem 1.8rem 1.65rem;
  border-left: 1px solid rgba(24, 24, 27, 0.04);
  border-radius: 1.4rem;
  background: linear-gradient(180deg, rgba(255, 254, 251, 0.5), rgba(255, 249, 241, 0.12));
  box-shadow: 0 10px 24px rgba(33, 24, 18, 0.024);
}

.journey-highlight::before {
  content: '';
  position: absolute;
  left: 1.1rem;
  top: 1.05rem;
  width: 0.42rem;
  height: 0.42rem;
  border-radius: 999px;
  background: linear-gradient(135deg, rgba(251, 146, 60, 0.9), rgba(234, 88, 12, 0.78));
  box-shadow: 0 0 0 3px rgba(251, 146, 60, 0.04);
}

.journey-highlight__stage {
  padding-left: 1rem;
  font-size: 0.74rem;
  font-weight: 700;
  letter-spacing: 0.14em;
  text-transform: uppercase;
  color: #c2410c;
}

.journey-highlight__title {
  margin: 0.88rem 0 0;
  padding-left: 1rem;
  font-size: 1.08rem;
  line-height: 1.22;
  letter-spacing: -0.03em;
  color: #18181b;
}

.journey-highlight__copy {
  margin: 0.92rem 0 0;
  padding-left: 1rem;
  font-size: 0.92rem;
  line-height: 1.88;
  color: #696158;
}
''';
