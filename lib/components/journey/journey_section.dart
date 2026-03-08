import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../layouts/site_container.dart';
import 'journey_highlight.dart';

class JourneySection extends StatelessComponent {
  const JourneySection({super.key});

  @override
  Component build(BuildContext context) {
    return section(
      id: 'journey',
      classes: 'journey-section portfolio-section portfolio-section--compact',
      [
        Component.element(
          tag: 'style',
          children: [Component.text(_journeySectionCss)],
        ),
        SiteContainer(
          children: [
            div(classes: 'journey-section__shell portfolio-shell', [
              div(classes: 'journey-section__layout', [
                div(classes: 'journey-section__content portfolio-header', [
                  h2(
                    classes: 'journey-section__title portfolio-title',
                    [Component.text('The Journey So Far')],
                  ),
                  p(
                    classes: 'journey-section__paragraph journey-section__paragraph--one',
                    [
                      Component.text(
                        'The path started with Android development, where Jetpack Compose, REST integrations, and performance-minded UI work built a strong native foundation.',
                      ),
                    ],
                  ),
                  p(
                    classes: 'journey-section__paragraph journey-section__paragraph--two',
                    [
                      Component.text(
                        'That foundation expanded into Flutter and cross-platform product development, shipping healthcare, logistics, and e-commerce experiences with real-time interactions and reliable delivery flows. ',
                      ),
                      span(
                        classes: 'journey-section__inline-accent',
                        [
                          Component.text(
                            'Clean architecture, secure data handling, and intuitive UX shape every product decision.',
                          ),
                        ],
                      ),
                    ],
                  ),
                  p(
                    classes: 'journey-section__paragraph journey-section__paragraph--three',
                    [
                      Component.text(
                        'Today the work is grounded in scalable mobile engineering, careful code quality, and AI-assisted workflows that improve delivery speed without weakening structure, security, or maintainability.',
                      ),
                    ],
                  ),
                ]),
                div(classes: 'journey-section__highlights', const [
                  JourneyHighlight(
                    stage: 'Foundation',
                    title: 'Android roots in healthcare product work',
                    copy:
                        'Early experience in Android and Jetpack Compose built fluency in native UI structure, API integration, and app performance.',
                  ),
                  JourneyHighlight(
                    stage: 'Expansion',
                    title: 'Flutter delivery across product categories',
                    copy:
                        'The transition into Flutter enabled cross-platform delivery for healthcare, logistics, e-commerce, and real-time mobile experiences.',
                  ),
                  JourneyHighlight(
                    stage: 'Approach',
                    title: 'Quality-focused execution with modern tooling',
                    copy:
                        'Clean architecture, secure data handling, intuitive UX, and disciplined AI-assisted workflows keep delivery fast and technically sound.',
                  ),
                ]),
              ]),
            ]),
          ],
        ),
      ],
    );
  }
}

const String _journeySectionCss = '''
.journey-section {
  padding-top: clamp(2.9rem, 5.2vw, 4.15rem);
}

.journey-section__shell {
  position: relative;
}

.journey-section__layout {
  display: grid;
  gap: 2.65rem;
}

.journey-section__content {
  position: relative;
  max-width: 78rem;
  padding-left: 2.8rem;
}

.journey-section__title {
  max-width: none;
  margin-top: 0;
  font-family: "Instrument Sans", "Avenir Next", "Segoe UI", sans-serif;
  font-size: clamp(3rem, 5.6vw, 4.45rem);
  font-weight: 700;
  line-height: 0.96;
  letter-spacing: -0.06em;
}

.journey-section__content::before {
  content: '';
  position: absolute;
  left: 0.65rem;
  top: 8.4rem;
  bottom: 0.85rem;
  width: 2px;
  border-radius: 999px;
  background: linear-gradient(180deg, rgba(212, 187, 153, 0.54), rgba(212, 187, 153, 0.1));
}

.journey-section__paragraph {
  max-width: 70rem;
  margin: 2.05rem 0 0;
  font-size: 1.04rem;
  line-height: 1.94;
  color: #67615a;
}

.journey-section__inline-accent {
  color: #d86b10;
  font-weight: 700;
}

.journey-section__paragraph--three {
  margin-top: 2.05rem;
}

.journey-section__highlights {
  display: grid;
  gap: 1.6rem;
  margin-top: 3.1rem;
}

@media (min-width: 960px) {
  .journey-section__marker {
    top: 13.6rem;
    left: 1.42rem;
  }

  .journey-section__marker .timeline-marker {
    width: 1.18rem;
    height: 1.18rem;
  }

  .journey-section__marker .timeline-marker__core {
    border-color: #fcfbf8;
    box-shadow:
      0 0 0 1px rgba(234, 88, 12, 0.28),
      0 0 0 7px rgba(251, 146, 60, 0.12);
  }

  .journey-section__marker .timeline-marker::after {
    border-color: rgba(234, 88, 12, 0.12);
  }

  .journey-section__highlights {
    grid-template-columns: repeat(3, minmax(0, 1fr));
    gap: 1.25rem;
  }
}

@media (min-width: 721px) and (max-width: 959px) {
  .journey-section__highlights {
    grid-template-columns: repeat(2, minmax(0, 1fr));
  }
}

@media (max-width: 720px) {
  .journey-section {
    padding-top: clamp(2.2rem, 7vw, 3rem);
  }

  .journey-section__content {
    padding-left: 1.15rem;
  }

  .journey-section__title {
    max-width: 9ch;
    font-size: clamp(2.45rem, 10vw, 3.35rem);
    line-height: 0.98;
  }

  .journey-section__paragraph {
    margin-top: 1.55rem;
    font-size: 0.98rem;
    line-height: 1.84;
  }
}

@supports (animation-timeline: view()) {
  .journey-section__title,
  .journey-section__paragraph,
  .journey-highlight,
  .journey-section__marker .timeline-marker {
    animation-timeline: view();
    animation-fill-mode: both;
  }

  .journey-section__title {
    opacity: 0;
    transform: translateY(1.2rem);
    animation-name: journey-rise;
    animation-duration: 1ms;
    animation-range: entry 12% cover 32%;
  }

  .journey-section__paragraph--one {
    opacity: 0;
    transform: translateY(1rem);
    animation-name: journey-rise;
    animation-duration: 1ms;
    animation-range: entry 16% cover 35%;
  }

  .journey-section__paragraph--two {
    opacity: 0;
    transform: translateY(1rem);
    animation-name: journey-rise;
    animation-duration: 1ms;
    animation-range: entry 20% cover 38%;
  }

  .journey-section__paragraph--three {
    opacity: 0;
    transform: translateY(1rem);
    animation-name: journey-rise;
    animation-duration: 1ms;
    animation-range: entry 24% cover 42%;
  }

  .journey-highlight:nth-child(1) {
    opacity: 0;
    transform: translateY(1rem);
    animation-name: journey-rise;
    animation-duration: 1ms;
    animation-range: entry 20% cover 38%;
  }

  .journey-highlight:nth-child(2) {
    opacity: 0;
    transform: translateY(1rem);
    animation-name: journey-rise;
    animation-duration: 1ms;
    animation-range: entry 24% cover 42%;
  }

  .journey-highlight:nth-child(3) {
    opacity: 0;
    transform: translateY(1rem);
    animation-name: journey-rise;
    animation-duration: 1ms;
    animation-range: entry 28% cover 46%;
  }

  .journey-section__marker .timeline-marker {
    animation-name: journey-dot-glow;
    animation-duration: 1ms;
    animation-range: entry 12% cover 34%;
  }
}

@keyframes journey-rise {
  from {
    opacity: 0;
    transform: translateY(1rem);
  }

  to {
    opacity: 1;
    transform: translateY(0);
  }
}

@keyframes journey-dot-glow {
  0% {
    transform: scale(1);
    box-shadow: 0 0 0 1px rgba(234, 88, 12, 0.22);
    filter: saturate(1);
  }

  60% {
    transform: scale(1.12);
    box-shadow:
      0 0 0 1px rgba(234, 88, 12, 0.28),
      0 0 0 10px rgba(251, 146, 60, 0.16),
      0 0 22px rgba(249, 115, 22, 0.34);
    filter: saturate(1.08);
  }

  100% {
    transform: scale(1.08);
    box-shadow:
      0 0 0 1px rgba(234, 88, 12, 0.28),
      0 0 0 8px rgba(251, 146, 60, 0.12),
      0 0 18px rgba(249, 115, 22, 0.28);
    filter: saturate(1.05);
  }
}

@media (prefers-reduced-motion: reduce) {
  .journey-section__title,
  .journey-section__paragraph,
  .journey-highlight,
  .journey-section__marker .timeline-marker {
    animation: none !important;
    opacity: 1 !important;
    transform: none !important;
  }
}
''';
