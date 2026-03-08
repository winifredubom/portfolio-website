import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class ContactButton extends StatelessComponent {
  const ContactButton({
    required this.label,
    required this.href,
    super.key,
  });

  final String label;
  final String href;

  @override
  Component build(BuildContext context) {
    return a(
      href: href,
      classes: 'contact-button anim-button-glow',
      [
        Component.element(
          tag: 'style',
          children: [Component.text(_contactButtonCss)],
        ),
        span(classes: 'contact-button__label', [Component.text(label)]),
        span(classes: 'contact-button__arrow', [Component.text('↗')]),
      ],
    );
  }
}

const String _contactButtonCss = '''
.contact-button {
  display: inline-flex;
  align-items: center;
  gap: 0.64rem;
  width: fit-content;
  min-height: 3.8rem;
  padding: 0.92rem 1.45rem;
  border-radius: 999px;
  background: linear-gradient(135deg, #ff8a1c 0%, #ee6a00 100%);
  color: #22150d;
  font-size: 0.88rem;
  font-weight: 700;
  letter-spacing: 0.11em;
  text-transform: uppercase;
  text-decoration: none;
  box-shadow: 0 18px 36px rgba(238, 106, 0, 0.18);
}

.contact-button__arrow {
  display: inline-block;
  transform: translateY(-0.03rem);
  transition: transform 180ms ease;
}

.contact-button:hover .contact-button__arrow {
  transform: translate(0.12rem, -0.08rem);
}

@media (prefers-reduced-motion: reduce) {
  .contact-button {
    transition: none !important;
  }
}
''';
