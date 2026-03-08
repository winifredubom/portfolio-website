import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class ScrollHint extends StatelessComponent {
  const ScrollHint({
    super.key,
    this.label = 'Scroll to explore',
    this.target = '#journey',
  });

  final String label;
  final String target;

  @override
  Component build(BuildContext context) {
    return a(
      href: target,
      classes: 'scroll-cue',
      [
        div(classes: 'scroll-cue__icon', [
          span(classes: 'scroll-cue__stem', []),
          span(classes: 'scroll-cue__chevron', []),
        ]),
        span(classes: 'scroll-cue__text', [Component.text(label)]),
      ],
    );
  }

  @css
  static List<StyleRule> get styles => [
    css('.scroll-cue').styles(
      raw: {
        'display': 'inline-flex',
        'align-items': 'center',
        'gap': '0.72rem',
        'width': 'fit-content',
        'margin-top': '2.6rem',
        'text-decoration': 'none',
        'color': '#7e776d',
        'opacity': '0',
        'transform': 'translateY(1rem)',
        'animation': 'hero-editorial-rise 760ms cubic-bezier(0.18, 0.84, 0.35, 1) 0.92s forwards',
      },
    ),
    css('.scroll-cue__icon').styles(
      raw: {
        'position': 'relative',
        'display': 'inline-flex',
        'align-items': 'center',
        'justify-content': 'center',
        'width': '2.45rem',
        'height': '2.45rem',
        'border': '1px solid rgba(161, 98, 7, 0.08)',
        'border-radius': '999px',
        'background': 'rgba(255, 255, 255, 0.42)',
        'box-shadow': '0 6px 16px rgba(15, 23, 42, 0.024)',
        'backdrop-filter': 'blur(10px)',
        'animation': 'hero-editorial-bounce 2.8s ease-in-out 1.15s infinite',
      },
    ),
    css('.scroll-cue__stem').styles(
      raw: {
        'display': 'block',
        'width': '1px',
        'height': '0.8rem',
        'background': '#8b7c66',
        'transform': 'translateY(-0.08rem)',
      },
    ),
    css('.scroll-cue__chevron').styles(
      raw: {
        'position': 'absolute',
        'bottom': '0.75rem',
        'width': '0.44rem',
        'height': '0.44rem',
        'border-right': '1.5px solid #8b7c66',
        'border-bottom': '1.5px solid #8b7c66',
        'transform': 'rotate(45deg)',
      },
    ),
    css('.scroll-cue__text').styles(
      raw: {
        'font-size': '0.8rem',
        'font-weight': '600',
        'letter-spacing': '0.02em',
      },
    ),
  ];
}
