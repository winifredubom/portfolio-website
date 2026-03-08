import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../layouts/site_container.dart';
import 'hero_badge.dart';
import 'hero_intro.dart';
import 'scroll_hint.dart';

class HeroSection extends StatelessComponent {
  const HeroSection({
    super.key,
    this.id = 'hero',
    this.label = 'Portfolio & Narrative',
    this.name = 'Idara Ubom',
    this.title = 'Mobile Application Developer',
    this.location = 'Lagos, Nigeria',
    this.lineOne = 'Building mobile',
    this.lineTwo = 'experiences with',
    this.highlightPhrase = 'purpose & craft',
    this.intro =
        'I\'m Idara Ubom, a mobile app developer of 2+ years building secure, scalable mobile applications with real-time features, strong architecture, and thoughtful product delivery for mobile experiences.',
    this.scrollLabel = 'Scroll to explore',
    this.scrollTarget = '#journey',
  });

  final String id;
  final String label;
  final String name;
  final String title;
  final String location;
  final String lineOne;
  final String lineTwo;
  final String highlightPhrase;
  final String intro;
  final String scrollLabel;
  final String scrollTarget;

  @override
  Component build(BuildContext context) {
    return section(
      id: id,
      classes: 'hero-editorial portfolio-section portfolio-section--hero',
      [
        const _HeroEditorialStyles(),
        SiteContainer(
          children: [
            div(classes: 'hero-editorial__layout', [
              div(classes: 'hero-editorial__column', [
                HeroBadge(label: label),
                h1(classes: 'hero-editorial__headline', [
                  _HeadlineLine(
                    textValue: lineOne,
                    classes: 'hero-editorial__line hero-editorial__line--primary',
                  ),
                  _HeadlineLine(
                    textValue: lineTwo,
                    classes: 'hero-editorial__line hero-editorial__line--soft',
                  ),
                  span(classes: 'hero-editorial__highlight-wrap', [
                    span(
                      classes: 'hero-editorial__highlight',
                      [Component.text('$highlightPhrase.')],
                    ),
                  ]),
                ]),
                HeroIntro(
                  name: name,
                  title: title,
                  location: location,
                  intro: intro,
                ),
                ScrollHint(
                  label: scrollLabel,
                  target: scrollTarget,
                ),
              ]),
              const _HeroWarmOrb(),
            ]),
          ],
        ),
      ],
    );
  }
}

class _HeadlineLine extends StatelessComponent {
  const _HeadlineLine({
    required this.textValue,
    required this.classes,
  });

  final String textValue;
  final String classes;

  @override
  Component build(BuildContext context) {
    return span(classes: classes, [Component.text(textValue)]);
  }
}

class _HeroWarmOrb extends StatelessComponent {
  const _HeroWarmOrb();

  @override
  Component build(BuildContext context) {
    return div(
      classes: 'hero-editorial__orb-pane',
      attributes: const {'aria-hidden': 'true'},
      [
        div(classes: 'hero-editorial__orb-scene', [
          div(classes: 'hero-editorial__orb', []),
        ]),
      ],
    );
  }
}

class _HeroEditorialStyles extends StatelessComponent {
  const _HeroEditorialStyles();

  @override
  Component build(BuildContext context) {
    return Component.element(
      tag: 'style',
      children: [Component.text(_heroEditorialCss)],
    );
  }
}

const String _heroEditorialCss = '''
.hero-editorial {
  position: relative;
  isolation: isolate;
  overflow: clip;
}

.hero-editorial__layout {
  position: relative;
  display: grid;
  grid-template-columns: minmax(0, 58fr) minmax(0, 42fr);
  align-items: start;
  min-height: clamp(44rem, 82vh, 52rem);
}

.hero-editorial__column {
  position: relative;
  z-index: 1;
  width: min(100%, 39rem);
  padding-top: clamp(0.25rem, 1.2vw, 0.85rem);
}

.hero-editorial__headline {
  margin: 1.55rem 0 0;
  font-family: Iowan Old Style, Palatino Linotype, Book Antiqua, Georgia, serif;
  font-size: clamp(3.85rem, 8.4vw, 6.9rem);
  font-weight: 700;
  line-height: 0.84;
  letter-spacing: -0.095em;
  color: #181412;
}

.hero-editorial__line,
.hero-editorial__highlight {
  opacity: 0;
  transform: translateY(1.6rem);
  will-change: transform, opacity;
}

.hero-editorial__line {
  display: block;
  white-space: nowrap;
  animation: hero-editorial-rise 780ms cubic-bezier(0.18, 0.84, 0.35, 1) forwards;
}

.hero-editorial__line--primary {
  color: #171311;
  animation-delay: 0.18s;
}

.hero-editorial__line--soft {
  margin-top: 0.06em;
  color: #a29a90;
  animation-delay: 0.26s;
}

.hero-editorial__highlight-wrap {
  display: block;
  margin-top: 0.18em;
}

.hero-editorial__highlight {
  display: inline-flex;
  align-items: center;
  padding: 0;
  line-height: 0.88;
  white-space: nowrap;
  background: transparent;
  color: #e86f08;
  box-shadow: none;
  animation: hero-editorial-highlight 860ms cubic-bezier(0.18, 1, 0.32, 1) 0.42s forwards;
}

.hero-editorial__orb-scene {
  position: relative;
  width: 100%;
  height: 100%;
  pointer-events: none;
}

.hero-editorial__orb-pane {
  position: relative;
  min-height: clamp(34rem, 66vh, 42rem);
}

.hero-editorial__orb {
  position: absolute;
  right: 6%;
  top: 24%;
  width: clamp(18rem, 24vw, 23rem);
  aspect-ratio: 1;
  border-radius: 999px;
  background:
    radial-gradient(circle at 44% 42%, rgba(255, 248, 228, 0.92), rgba(255, 226, 176, 0.42) 34%, rgba(238, 120, 15, 0.08) 60%, rgba(238, 120, 15, 0.01) 100%);
  filter: blur(66px);
  opacity: 0.76;
  animation: hero-editorial-float 16s ease-in-out 0.2s infinite;
}

@keyframes hero-editorial-rise {
  from {
    opacity: 0;
    transform: translateY(1.6rem);
  }

  to {
    opacity: 1;
    transform: translateY(0);
  }
}

@keyframes hero-editorial-highlight {
  0% {
    opacity: 0;
    transform: translateY(1.8rem) scale(0.98);
  }

  60% {
    opacity: 1;
    transform: translateY(-0.08rem) scale(1.01);
  }

  100% {
    opacity: 1;
    transform: translateY(0) scale(1);
  }
}

@keyframes hero-editorial-float {
  0%,
  100% {
    transform: translate3d(0, 0, 0);
  }

  50% {
    transform: translate3d(0.45rem, -0.85rem, 0);
  }
}

@keyframes hero-editorial-bounce {
  0%,
  100% {
    transform: translateY(0);
  }

  50% {
    transform: translateY(0.32rem);
  }
}

@media (min-width: 960px) {
  .hero-editorial__column {
    padding-right: 2rem;
  }
}

@media (max-width: 959px) {
  .hero-editorial__layout {
    grid-template-columns: 1fr;
    min-height: auto;
  }

  .hero-editorial__column {
    width: min(100%, 39rem);
    padding-top: 0.45rem;
  }

  .hero-editorial__orb-pane {
    min-height: 11rem;
  }

  .hero-editorial__orb-scene {
    position: absolute;
    inset: auto 0 -1.75rem 0;
    height: 11rem;
  }

  .hero-editorial__orb {
    right: -2.5rem;
    top: -0.5rem;
    width: clamp(15rem, 42vw, 20rem);
  }
}

@media (max-width: 640px) {
  .hero-editorial__column {
    width: 100%;
    padding-top: 0.25rem;
  }

  .hero-editorial__headline {
    font-size: clamp(3rem, 11.6vw, 4.55rem);
    letter-spacing: -0.082em;
  }

  .hero-editorial__highlight-wrap {
    margin-top: 0.18em;
  }

}

@media (prefers-reduced-motion: reduce) {
  .hero-badge,
  .hero-editorial__line,
  .hero-editorial__highlight,
  .hero-intro,
  .scroll-cue,
  .scroll-cue__icon,
  .hero-editorial__orb {
    animation: none !important;
    opacity: 1 !important;
    transform: none !important;
  }
}
''';
