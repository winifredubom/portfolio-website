import 'package:jaspr/jaspr.dart';

import 'animations.dart';

class GlobalStyles extends StatelessComponent {
  const GlobalStyles({super.key});

  @override
  Component build(BuildContext context) {
    return Component.fragment([
      const AnimationStyles(),
      Component.element(
        tag: 'style',
        children: [Component.text(_globalStylesCss)],
      ),
    ]);
  }
}

const String _globalStylesCss = '''
:root {
  --content-max-width: 1080px;
  --content-gutter-mobile: 2rem;
  --content-gutter-tablet: 3rem;
  --content-gutter-desktop: 3.25rem;
  --timeline-content-offset: 6.4rem;
  --timeline-rail-left: 2.2rem;
  --page-background: #ffffff;
  --page-foreground: #18181b;
  --surface-base: rgba(255, 253, 249, 0.62);
  --surface-soft: rgba(255, 249, 241, 0.44);
  --border-soft: rgba(24, 24, 27, 0.045);
  --accent-warm: #ea580c;
  --accent-glow: rgba(249, 115, 22, 0.16);
  --section-space-md: clamp(4.75rem, 7vw, 6.2rem);
  --section-space-lg: clamp(6.35rem, 9.8vw, 8.45rem);
  --section-space-xl: clamp(6.9rem, 11.5vw, 9.4rem);
  --header-max-width: 37rem;
  --radius-panel: 1.7rem;
  --motion-duration-fast: 180ms;
  --motion-duration-md: 720ms;
  --motion-duration-slow: 1100ms;
  --motion-ease-standard: cubic-bezier(0.22, 0.61, 0.36, 1);
  --motion-ease-emphasis: cubic-bezier(0.18, 0.84, 0.32, 1);
  --motion-distance-sm: 0.7rem;
  --motion-distance-md: 1rem;
  --shadow-card: 0 10px 28px rgba(33, 24, 18, 0.028);
  --shadow-lift: 0 16px 34px rgba(33, 24, 18, 0.04);
  --shadow-button-glow:
    0 18px 36px rgba(238, 106, 0, 0.18),
    0 0 22px rgba(251, 146, 60, 0.1);
}

*,
*::before,
*::after {
  box-sizing: border-box;
}

html {
  min-height: 100%;
  scroll-behavior: smooth;
  background: var(--page-background);
}

body {
  min-height: 100%;
  margin: 0;
  background:
    radial-gradient(circle at 88% 16%, rgba(251, 191, 36, 0.09), transparent 20%),
    radial-gradient(circle at 10% 4%, rgba(251, 146, 60, 0.05), transparent 18%),
    var(--page-background);
  color: var(--page-foreground);
  line-height: 1.5;
  font-family: "Instrument Sans", "Avenir Next", "Segoe UI", sans-serif;
  text-rendering: optimizeLegibility;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

a,
button {
  -webkit-tap-highlight-color: transparent;
}

::selection {
  background: rgba(251, 191, 36, 0.22);
}

.portfolio-section {
  position: relative;
  padding-top: var(--section-space-lg);
}

.portfolio-section--compact {
  padding-top: var(--section-space-md);
}

.portfolio-section--hero {
  padding-top: clamp(1.9rem, 4.2vw, 3.2rem);
  padding-bottom: clamp(2rem, 4.4vw, 3.3rem);
}

.portfolio-section--terminal {
  padding-bottom: var(--section-space-md);
}

.portfolio-shell {
  position: relative;
}

.portfolio-header {
  max-width: var(--header-max-width);
}

.portfolio-eyebrow {
  font-size: 0.76rem;
  font-weight: 700;
  letter-spacing: 0.18em;
  text-transform: uppercase;
  color: #9a5a1c;
  opacity: 0.86;
}

.portfolio-title {
  margin: 1.15rem 0 0;
  font-family: Iowan Old Style, Palatino Linotype, Book Antiqua, Georgia, serif;
  font-size: clamp(2.85rem, 5.4vw, 4.7rem);
  line-height: 0.93;
  letter-spacing: -0.068em;
  color: #191512;
}

.portfolio-copy {
  margin: 1.45rem 0 0;
  font-size: 0.99rem;
  line-height: 1.98;
  color: #6d645a;
}

.portfolio-panel {
  border: 1px solid var(--border-soft);
  border-radius: var(--radius-panel);
  background: linear-gradient(180deg, rgba(255, 254, 251, 0.56), rgba(255, 249, 241, 0.14));
  box-shadow: var(--shadow-card);
}

.portfolio-panel--glass {
  background: rgba(255, 252, 247, 0.54);
  border-color: rgba(255, 255, 255, 0.34);
  box-shadow: 0 10px 24px rgba(33, 24, 18, 0.05);
  backdrop-filter: blur(18px);
}

.portfolio-panel--warm {
  background: linear-gradient(135deg, rgba(255, 255, 255, 0.58), rgba(255, 246, 234, 0.36));
}

.portfolio-section-marker {
  display: none;
}

@media (min-width: 960px) {
  .portfolio-section-marker {
    position: absolute;
    top: 0.95rem;
    left: calc(-1 * var(--timeline-content-offset) + var(--timeline-rail-left) - 0.5rem);
    display: flex;
    justify-content: center;
    width: 1rem;
    z-index: 1;
  }
}

@media (max-width: 959px) {
  :root {
    --timeline-content-offset: 0rem;
  }
}

@media (max-width: 720px) {
  :root {
    --content-gutter-mobile: 1.5rem;
    --section-space-md: clamp(3.2rem, 9vw, 4rem);
    --section-space-lg: clamp(4.3rem, 11vw, 5.2rem);
    --section-space-xl: clamp(4.2rem, 13vw, 5.6rem);
  }

  .portfolio-title {
    font-size: clamp(2.2rem, 10vw, 3.25rem);
    letter-spacing: -0.05em;
  }

  .portfolio-copy {
    line-height: 1.8;
  }
}
''';
