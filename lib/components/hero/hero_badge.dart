import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class HeroBadge extends StatelessComponent {
  const HeroBadge({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Component build(BuildContext context) {
    return div(classes: 'hero-badge', [
      span(classes: 'hero-badge__line', []),
      span(classes: 'hero-badge__text', [Component.text(label)]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.hero-badge').styles(
      raw: {
        'display': 'inline-flex',
        'align-items': 'center',
        'gap': '0.8rem',
        'width': 'fit-content',
        'opacity': '0',
        'transform': 'translateY(0.85rem)',
        'animation': 'hero-editorial-rise 700ms cubic-bezier(0.18, 0.84, 0.35, 1) 0.05s forwards',
      },
    ),
    css('.hero-badge__line').styles(
      raw: {
        'display': 'block',
        'width': '2.35rem',
        'height': '1px',
        'background': 'linear-gradient(90deg, rgba(234, 88, 12, 0.9), rgba(234, 88, 12, 0.14))',
      },
    ),
    css('.hero-badge__text').styles(
      raw: {
        'font-size': '0.7rem',
        'font-weight': '700',
        'letter-spacing': '0.2em',
        'text-transform': 'uppercase',
        'color': '#9a3412',
        'opacity': '0.88',
      },
    ),
  ];
}
