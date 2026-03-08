import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class SiteContainer extends StatelessComponent {
  const SiteContainer({
    required this.children,
    super.key,
    this.classes = '',
  });

  final List<Component> children;
  final String classes;

  @override
  Component build(BuildContext context) {
    final containerClasses = classes.isEmpty ? 'site-container' : 'site-container $classes';

    return div(classes: containerClasses, [
      Component.element(tag: 'style', children: [Component.text(_siteContainerCss)]),
      ...children,
    ]);
  }
}

const String _siteContainerCss = '''
.site-container {
  position: relative;
  box-sizing: border-box;
  width: min(var(--content-max-width), calc(100% - var(--content-gutter-mobile)));
  margin: 0 auto;
}

@media (min-width: 720px) {
  .site-container {
    width: min(var(--content-max-width), calc(100% - var(--content-gutter-tablet)));
  }
}

@media (min-width: 960px) {
  .site-container {
    width: min(var(--content-max-width), calc(100% - var(--content-gutter-desktop)));
    padding-left: var(--timeline-content-offset);
  }
}
''';
