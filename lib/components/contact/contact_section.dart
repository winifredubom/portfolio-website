import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../core/data/portfolio_data.dart';
import '../layouts/site_container.dart';
import '../timeline/timeline_marker.dart';
import 'contact_button.dart';
import 'social_links.dart';

class ContactSection extends StatelessComponent {
  const ContactSection({super.key});

  @override
  Component build(BuildContext context) {
    final currentYear = DateTime.now().year;

    return section(
      id: 'contact',
      classes: 'contact-section portfolio-section portfolio-section--terminal',
      [
        Component.element(
          tag: 'style',
          children: [Component.text(_contactSectionCss)],
        ),
        SiteContainer(
          children: [
            div(classes: 'contact-section__shell portfolio-shell', [
              div(
                classes: 'contact-section__marker portfolio-section-marker',
                const [TimelineMarker(accent: TimelineMarkerAccent.warm)],
              ),
              div(classes: 'contact-section__panel', [
                div(classes: 'contact-section__content portfolio-header', [
                  div(classes: 'contact-section__eyebrow portfolio-eyebrow', [
                    Component.text('Contact'),
                  ]),
                  h2(classes: 'contact-section__title portfolio-title', [
                    Component.text("Let's Connect"),
                  ]),
                  p(classes: 'contact-section__copy portfolio-copy', [
                    Component.text(
                      'Open to mobile app roles, freelance opportunities, and product collaborations where strong engineering, reliable delivery, and thoughtful user experience matter.',
                    ),
                  ]),
                ]),
                div(classes: 'contact-section__actions', [
                  const ContactButton(
                    label: 'Say Hello',
                    href: '#contact-links',
                  ),
                ]),
                div(classes: 'contact-section__socials', [
                  SocialLinks(
                    id: 'contact-links',
                    links: portfolioData.socialLinks,
                  ),
                ]),
                div(classes: 'contact-section__footer', [
                  div(classes: 'contact-section__footer-line', []),
                  div(classes: 'contact-section__footer-copy', [
                    Component.text(
                      '© $currentYear Idara Ubom. Built with jaspr and flutter.',
                    ),
                  ]),
                ]),
              ]),
            ]),
          ],
        ),
      ],
    );
  }
}

const String _contactSectionCss = '''
.contact-section {
  padding-top: calc(var(--section-space-lg) + 1.45rem);
}

.contact-section__panel {
  display: grid;
  gap: 2.05rem;
  padding: 0;
}

.contact-section__content {
  max-width: 35rem;
}

.contact-section__actions {
  display: flex;
  align-items: center;
  justify-content: flex-start;
}

.contact-section__socials {
  display: flex;
  align-items: center;
  justify-content: flex-start;
}

.contact-section__footer {
  display: grid;
  gap: 0.75rem;
  margin-top: 2.4rem;
}

.contact-section__footer-line {
  width: 100%;
  height: 1px;
  background: linear-gradient(90deg, rgba(24, 24, 27, 0.12), rgba(24, 24, 27, 0.025));
}

.contact-section__footer-copy {
  max-width: 30rem;
  font-size: 0.8rem;
  line-height: 1.8;
  color: #887c71;
}

@supports (animation-timeline: view()) {
  .contact-section__title,
  .contact-section__copy,
  .contact-button {
    animation-timeline: view();
    animation-fill-mode: both;
  }

  .contact-section__title {
    opacity: 0;
    transform: translateY(1rem);
    animation-name: contact-reveal;
    animation-duration: 1ms;
    animation-range: entry 12% cover 28%;
  }

  .contact-section__copy {
    opacity: 0;
    transform: translateY(1rem);
    animation-name: contact-reveal;
    animation-duration: 1ms;
    animation-range: entry 16% cover 34%;
  }

  .contact-button {
    opacity: 0;
    transform: translateY(1rem);
    animation-name: contact-button-reveal;
    animation-duration: 1ms;
    animation-range: entry 18% cover 36%;
  }
}

@keyframes contact-reveal {
  from {
    opacity: 0;
    transform: translateY(1rem);
  }

  to {
    opacity: 1;
    transform: translateY(0);
  }
}

@keyframes contact-button-reveal {
  0% {
    opacity: 0;
    transform: translateY(1rem) scale(0.98);
  }

  70% {
    opacity: 1;
    transform: translateY(-0.08rem) scale(1.01);
  }

  100% {
    opacity: 1;
    transform: translateY(0) scale(1);
  }
}

@media (prefers-reduced-motion: reduce) {
  .contact-section__title,
  .contact-section__copy,
  .contact-button {
    animation: none !important;
    opacity: 1 !important;
    transform: none !important;
  }
}

@media (max-width: 720px) {
  .contact-section {
    padding-top: calc(var(--section-space-lg) + 0.35rem);
  }

  .contact-section__footer {
    margin-top: 1.65rem;
  }
}
''';
