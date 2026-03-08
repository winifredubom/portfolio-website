import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../core/models/social_link.dart';

class SocialLinks extends StatelessComponent {
  const SocialLinks({
    required this.links,
    super.key,
    this.id,
  });

  final List<SocialLink> links;
  final String? id;

  @override
  Component build(BuildContext context) {
    return div(
      id: id,
      classes: 'social-links',
      [
        Component.element(
          tag: 'style',
          children: [Component.text(_socialLinksCss)],
        ),
        for (final link in links) _SocialLinkItem(link: link),
      ],
    );
  }
}

class _SocialLinkItem extends StatelessComponent {
  const _SocialLinkItem({required this.link});

  final SocialLink link;

  @override
  Component build(BuildContext context) {
    final children = [
      span(classes: 'social-links__icon', [_iconFor(link.label)]),
      span(classes: 'social-links__label', [Component.text(link.label)]),
    ];

    if (link.url != null && link.url!.isNotEmpty) {
      return a(
        href: link.url!,
        classes: 'social-links__item',
        attributes: {'aria-label': link.label, 'title': link.label},
        children,
      );
    }

    return div(
      classes: 'social-links__item social-links__item--static',
      attributes: {'title': link.label},
      children,
    );
  }
}

Component _iconFor(String label) {
  switch (label.toLowerCase()) {
    case 'github':
      return _svgIcon([
        _path(
          'M9 19c-4.5 1.4-4.5-2.5-6-3m12 6v-3.5c0-1 .1-1.4-.5-2 2.8-.3 5.5-1.4 5.5-6.2A4.8 4.8 0 0 0 18.7 7c.1-.3.6-1.5-.1-3-1 0-1.8.3-3 1.2A10.4 10.4 0 0 0 12 5c-1.2 0-2.4.2-3.5.6C7.3 4.7 6.5 4.4 5.5 4.4c-.7 1.5-.2 2.7-.1 3A4.8 4.8 0 0 0 4 10.3c0 4.8 2.7 5.9 5.5 6.2-.4.4-.6.9-.5 1.8V22',
        ),
      ]);
    case 'linkedin':
      return _svgIcon([
        _path('M16 8a6 6 0 0 1 6 6v7h-4v-7a2 2 0 0 0-2-2 2 2 0 0 0-2 2v7h-4v-7a6 6 0 0 1 6-6Z'),
        _path('M2 9h4v12H2z'),
        _path('M4 4h.01'),
      ]);
    default:
      return _svgIcon([
        _path('M4 6h16v12H4z'),
        _path('m4 9 4.8 3.6a2 2 0 0 0 2.4 0L20 9'),
      ]);
  }
}

Component _svgIcon(List<Component> children) {
  return svg(
    viewBox: '0 0 24 24',
    classes: 'social-links__svg',
    attributes: const {
      'fill': 'none',
      'stroke': 'currentColor',
      'stroke-width': '1.7',
      'stroke-linecap': 'round',
      'stroke-linejoin': 'round',
      'aria-hidden': 'true',
    },
    children,
  );
}

Component _path(String d) {
  return path(d: d, []);
}

const String _socialLinksCss = '''
.social-links {
  display: flex;
  flex-wrap: wrap;
  gap: 1rem;
}

.social-links__item {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  width: 2.85rem;
  height: 2.85rem;
  padding: 0;
  border-radius: 999px;
  border: 1px solid rgba(24, 24, 27, 0.04);
  background: rgba(255, 253, 250, 0.4);
  color: #7a6f63;
  text-decoration: none;
  box-shadow: none;
  transition: transform 180ms ease, box-shadow 180ms ease, border-color 180ms ease;
}

.social-links__item:hover {
  transform: scale(1.04);
  border-color: rgba(251, 146, 60, 0.07);
  box-shadow: 0 10px 20px rgba(33, 24, 18, 0.03);
}

.social-links__item--static {
  cursor: default;
}

.social-links__icon {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  width: 1.3rem;
  height: 1.3rem;
  color: #76685b;
}

.social-links__svg {
  width: 1.15rem;
  height: 1.15rem;
}

.social-links__label {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip: rect(0, 0, 0, 0);
  white-space: nowrap;
  border: 0;
}

@media (prefers-reduced-motion: reduce) {
  .social-links__item {
    transition: none !important;
  }
}
''';
