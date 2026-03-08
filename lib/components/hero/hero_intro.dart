import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class HeroIntro extends StatelessComponent {
  const HeroIntro({
    super.key,
    required this.name,
    required this.title,
    required this.location,
    required this.intro,
  });

  final String name;
  final String title;
  final String location;
  final String intro;

  @override
  Component build(BuildContext context) {
    return div(classes: 'hero-intro', [
      p(classes: 'hero-intro__copy', [Component.text(intro)]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.hero-intro').styles(
      raw: {
        'margin-top': '2.35rem',
        'max-width': '29rem',
        'opacity': '0',
        'transform': 'translateY(1rem)',
        'animation': 'hero-editorial-rise 760ms cubic-bezier(0.18, 0.84, 0.35, 1) 0.72s forwards',
      },
    ),
    css('.hero-intro__copy').styles(
      raw: {
        'margin': '0',
        'font-size': 'clamp(1rem, 1.75vw, 1.12rem)',
        'line-height': '1.95',
        'letter-spacing': '0.002em',
        'color': '#645d55',
      },
    ),
  ];
}
