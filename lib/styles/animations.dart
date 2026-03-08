import 'package:jaspr/jaspr.dart';

class AnimationStyles extends StatelessComponent {
  const AnimationStyles({super.key});

  @override
  Component build(BuildContext context) {
    return Component.element(
      tag: 'style',
      children: [Component.text(_animationStylesCss)],
    );
  }
}

abstract final class AnimationClasses {
  static const String fadeIn = 'anim-fade-in';
  static const String slideUp = 'anim-slide-up';
  static const String revealOnScroll = 'anim-reveal-on-scroll';
  static const String staggerReveal = 'anim-stagger-reveal';
  static const String hoverLift = 'anim-hover-lift';
  static const String glowPulse = 'anim-glow-pulse';
  static const String floatingOrb = 'anim-floating-orb';
  static const String buttonGlow = 'anim-button-glow';
  static const String delay1 = 'anim-delay-1';
  static const String delay2 = 'anim-delay-2';
  static const String delay3 = 'anim-delay-3';
  static const String delay4 = 'anim-delay-4';
}

const String _animationStylesCss = '''
.anim-fade-in,
.anim-slide-up,
.anim-stagger-reveal > *,
.anim-reveal-on-scroll {
  --anim-duration: var(--motion-duration-md);
  --anim-ease: var(--motion-ease-emphasis);
  --anim-delay: 0ms;
  --anim-distance: var(--motion-distance-md);
}

.anim-delay-1 {
  --anim-delay: 80ms;
}

.anim-delay-2 {
  --anim-delay: 160ms;
}

.anim-delay-3 {
  --anim-delay: 240ms;
}

.anim-delay-4 {
  --anim-delay: 320ms;
}

.anim-fade-in {
  opacity: 0;
  animation: fade-in var(--anim-duration) var(--anim-ease) var(--anim-delay) forwards;
}

.anim-slide-up {
  opacity: 0;
  transform: translateY(var(--anim-distance));
  animation: slide-up var(--anim-duration) var(--anim-ease) var(--anim-delay) forwards;
}

.anim-stagger-reveal {
  --anim-stagger-step: 90ms;
}

.anim-stagger-reveal > * {
  opacity: 0;
  transform: translateY(var(--anim-distance));
  animation: slide-up var(--anim-duration) var(--anim-ease) forwards;
}

.anim-stagger-reveal > *:nth-child(1) {
  animation-delay: calc(var(--anim-delay) + (0 * var(--anim-stagger-step)));
}

.anim-stagger-reveal > *:nth-child(2) {
  animation-delay: calc(var(--anim-delay) + (1 * var(--anim-stagger-step)));
}

.anim-stagger-reveal > *:nth-child(3) {
  animation-delay: calc(var(--anim-delay) + (2 * var(--anim-stagger-step)));
}

.anim-stagger-reveal > *:nth-child(4) {
  animation-delay: calc(var(--anim-delay) + (3 * var(--anim-stagger-step)));
}

.anim-stagger-reveal > *:nth-child(5) {
  animation-delay: calc(var(--anim-delay) + (4 * var(--anim-stagger-step)));
}

.anim-stagger-reveal > *:nth-child(6) {
  animation-delay: calc(var(--anim-delay) + (5 * var(--anim-stagger-step)));
}

.anim-hover-lift {
  transition:
    transform var(--motion-duration-fast) var(--motion-ease-standard),
    box-shadow var(--motion-duration-fast) var(--motion-ease-standard),
    border-color var(--motion-duration-fast) var(--motion-ease-standard);
  will-change: transform;
}

.anim-hover-lift:hover {
  transform: translateY(-0.18rem);
  box-shadow: var(--shadow-lift);
}

.anim-glow-pulse {
  animation: glow-pulse 3.4s ease-in-out infinite;
}

.anim-floating-orb {
  animation: float-orb 13s ease-in-out infinite;
  will-change: transform;
}

.anim-button-glow {
  transition:
    transform var(--motion-duration-fast) var(--motion-ease-standard),
    box-shadow var(--motion-duration-fast) var(--motion-ease-standard),
    filter var(--motion-duration-fast) var(--motion-ease-standard);
}

.anim-button-glow:hover {
  transform: translateY(-0.14rem);
  box-shadow: var(--shadow-button-glow);
  filter: saturate(1.02);
}

@supports (animation-timeline: view()) {
  .anim-reveal-on-scroll.anim-fade-in,
  .anim-reveal-on-scroll.anim-slide-up,
  .anim-reveal-on-scroll.anim-stagger-reveal > * {
    animation-duration: 1ms;
    animation-fill-mode: both;
    animation-timeline: view();
  }

  .anim-reveal-on-scroll.anim-fade-in {
    animation-name: fade-in;
    animation-range: entry 12% cover 32%;
  }

  .anim-reveal-on-scroll.anim-slide-up {
    animation-name: slide-up;
    animation-range: entry 12% cover 34%;
  }

  .anim-reveal-on-scroll.anim-stagger-reveal > * {
    animation-name: slide-up;
  }

  .anim-reveal-on-scroll.anim-stagger-reveal > *:nth-child(1) {
    animation-range: entry 12% cover 32%;
  }

  .anim-reveal-on-scroll.anim-stagger-reveal > *:nth-child(2) {
    animation-range: entry 16% cover 36%;
  }

  .anim-reveal-on-scroll.anim-stagger-reveal > *:nth-child(3) {
    animation-range: entry 20% cover 40%;
  }

  .anim-reveal-on-scroll.anim-stagger-reveal > *:nth-child(4) {
    animation-range: entry 24% cover 44%;
  }

  .anim-reveal-on-scroll.anim-stagger-reveal > *:nth-child(5) {
    animation-range: entry 28% cover 48%;
  }

  .anim-reveal-on-scroll.anim-stagger-reveal > *:nth-child(6) {
    animation-range: entry 32% cover 52%;
  }
}

@keyframes fade-in {
  from {
    opacity: 0;
  }

  to {
    opacity: 1;
  }
}

@keyframes slide-up {
  from {
    opacity: 0;
    transform: translateY(var(--anim-distance));
  }

  to {
    opacity: 1;
    transform: translateY(0);
  }
}

@keyframes glow-pulse {
  0%,
  100% {
    box-shadow:
      0 0 0 1px rgba(234, 88, 12, 0.12),
      0 0 0 0 rgba(251, 146, 60, 0.08);
  }

  50% {
    box-shadow:
      0 0 0 1px rgba(234, 88, 12, 0.16),
      0 0 0 10px rgba(251, 146, 60, 0.12);
  }
}

@keyframes float-orb {
  0%,
  100% {
    transform: translate3d(0, 0, 0);
  }

  50% {
    transform: translate3d(0.4rem, -0.65rem, 0);
  }
}

@media (prefers-reduced-motion: reduce) {
  .anim-fade-in,
  .anim-slide-up,
  .anim-stagger-reveal > *,
  .anim-glow-pulse,
  .anim-floating-orb,
  .anim-button-glow,
  .anim-hover-lift {
    animation: none !important;
    transition: none !important;
    opacity: 1 !important;
    transform: none !important;
  }
}
''';
