import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../timeline/timeline_rail.dart';

class SiteShell extends StatelessComponent {
  const SiteShell({
    required this.children,
    super.key,
  });

  final List<Component> children;

  @override
  Component build(BuildContext context) {
    return div(classes: 'site-shell', [
      Component.element(tag: 'style', children: [Component.text(_siteShellCss)]),
      div(classes: 'site-shell__frame', [
        const TimelineRail(),
        div(classes: 'site-shell__content', children),
      ]),
    ]);
  }
}

const String _siteShellCss = '''
.site-shell {
  min-height: 100vh;
  background:
    radial-gradient(circle at 16% 24%, rgba(251, 191, 36, 0.08), transparent 18%),
    radial-gradient(circle at 84% 24%, rgba(253, 224, 71, 0.16), transparent 20%),
    linear-gradient(180deg, #ffffff 0%, #fdfcf8 38%, #fbfaf8 100%);
  color: #18181b;
}

.site-shell__frame {
  position: relative;
}

.site-shell__content {
  position: relative;
  z-index: 1;
  display: flex;
  flex-direction: column;
  gap: 0;
}

@media (max-width: 720px) {
  .site-shell {
    background:
      radial-gradient(circle at 18% 18%, rgba(251, 191, 36, 0.08), transparent 20%),
      radial-gradient(circle at 82% 16%, rgba(253, 224, 71, 0.12), transparent 22%),
      linear-gradient(180deg, #ffffff 0%, #fbfaf8 100%);
  }
}
''';
