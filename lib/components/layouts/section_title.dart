import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class SectionTitle extends StatelessComponent {
  const SectionTitle({
    required this.title,
    super.key,
    this.eyebrow,
    this.description,
  });

  final String title;
  final String? eyebrow;
  final String? description;

  @override
  Component build(BuildContext context) {
    return div(classes: 'section-title', [
      Component.element(tag: 'style', children: [Component.text(_sectionTitleCss)]),
      if (eyebrow != null) div(classes: 'section-title__eyebrow', [Component.text(eyebrow!)]),
      h2(classes: 'section-title__heading', [Component.text(title)]),
      if (description != null) p(classes: 'section-title__description', [Component.text(description!)]),
    ]);
  }
}

const String _sectionTitleCss = '''
.section-title {
  max-width: 42rem;
}

.section-title__eyebrow {
  margin-bottom: 0.9rem;
  font-size: 0.78rem;
  font-weight: 700;
  letter-spacing: 0.14em;
  text-transform: uppercase;
  color: #a16207;
}

.section-title__heading {
  margin: 0;
  font-size: clamp(2rem, 4vw, 3rem);
  line-height: 1.02;
  letter-spacing: -0.05em;
  color: #111827;
}

.section-title__description {
  margin: 1rem 0 0;
  font-size: 1rem;
  line-height: 1.75;
  color: #52525b;
}
''';
