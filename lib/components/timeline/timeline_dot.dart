import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class TimelineDot extends StatelessComponent {
  const TimelineDot({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'timeline-dot', [
      Component.element(tag: 'style', children: [Component.text(_timelineDotCss)]),
    ]);
  }
}

const String _timelineDotCss = '''
.timeline-dot {
  width: 0.9rem;
  height: 0.9rem;
  border-radius: 999px;
  border: 3px solid #f7f4ef;
  background: #ea580c;
  box-shadow: 0 0 0 1px rgba(234, 88, 12, 0.22);
}
''';
