import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../core/data/portfolio_data.dart';
import '../layouts/site_container.dart';

class TopNav extends StatelessComponent {
  const TopNav({super.key});

  @override
  Component build(BuildContext context) {
    return header(classes: 'top-nav', [
      Component.element(tag: 'style', children: [Component.text(_topNavCss)]),
      SiteContainer(
        children: [
          div(classes: 'top-nav__bar portfolio-panel portfolio-panel--glass', [
            div(classes: 'top-nav__brand', [
              div(classes: 'top-nav__name', [Component.text(portfolioData.profile.name)]),
              div(classes: 'top-nav__meta', [Component.text(portfolioData.profile.title)]),
            ]),
            div(classes: 'top-nav__links', [
              _navLink('Journey', '#journey'),
              _navLink('Skills', '#skills'),
              _navLink('Projects', '#projects'),
              _navLink('Experience', '#experience'),
              _navLink('Contact', '#contact'),
            ]),
          ]),
        ],
      ),
    ]);
  }
}

Component _navLink(String label, String href) {
  return a(
    href: href,
    classes: 'top-nav__link',
    [Component.text(label)],
  );
}

const String _topNavCss = '''
.top-nav {
  position: sticky;
  top: 0.85rem;
  z-index: 10;
  padding: 0.75rem 0 0;
}

.top-nav__bar {
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 1.35rem;
  min-height: 4.15rem;
  padding: 0.8rem 1.05rem 0.84rem;
  border-radius: 999px;
  border-color: rgba(255, 255, 255, 0.34);
  box-shadow: 0 14px 28px rgba(33, 24, 18, 0.05);
}

.top-nav__brand {
  display: flex;
  flex-direction: column;
  gap: 0.12rem;
}

.top-nav__name {
  font-size: 0.92rem;
  font-weight: 700;
  letter-spacing: -0.01em;
  color: #171311;
}

.top-nav__meta {
  font-size: 0.72rem;
  font-weight: 700;
  letter-spacing: 0.14em;
  text-transform: uppercase;
  color: #8b7d6a;
}

.top-nav__links {
  display: flex;
  flex-wrap: wrap;
  justify-content: flex-end;
  gap: 0.95rem 1rem;
}

.top-nav__link {
  color: #4f4b45;
  font-size: 0.8rem;
  font-weight: 600;
  letter-spacing: 0.08em;
  text-transform: uppercase;
  text-decoration: none;
  transition: color 160ms ease, opacity 160ms ease, transform 160ms ease;
}

.top-nav__link:hover {
  color: #1a1512;
  transform: translateY(-0.04rem);
}

@media (max-width: 959px) {
  .top-nav {
    top: 0.55rem;
    padding-top: 0.6rem;
  }

  .top-nav__bar {
    border-radius: 1.45rem;
  }
}

@media (max-width: 780px) {
  .top-nav__bar {
    align-items: flex-start;
    flex-direction: column;
    padding: 0.95rem 0.95rem 1rem;
  }

  .top-nav__links {
    justify-content: flex-start;
    gap: 0.8rem 0.9rem;
  }
}
''';
