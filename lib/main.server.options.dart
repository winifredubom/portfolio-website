// dart format off
// ignore_for_file: type=lint

// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/server.dart';
import 'package:portfolio_site/components/hero/hero_badge.dart' as _hero_badge;
import 'package:portfolio_site/components/hero/hero_intro.dart' as _hero_intro;
import 'package:portfolio_site/components/hero/scroll_hint.dart'
    as _scroll_hint;
import 'package:portfolio_site/app.dart' as _app;

/// Default [ServerOptions] for use with your Jaspr project.
///
/// Use this to initialize Jaspr **before** calling [runApp].
///
/// Example:
/// ```dart
/// import 'main.server.options.dart';
///
/// void main() {
///   Jaspr.initializeApp(
///     options: defaultServerOptions,
///   );
///
///   runApp(...);
/// }
/// ```
ServerOptions get defaultServerOptions => ServerOptions(
  clientId: 'main.client.dart.js',

  styles: () => [
    ..._hero_badge.HeroBadge.styles,
    ..._hero_intro.HeroIntro.styles,
    ..._scroll_hint.ScrollHint.styles,
    ..._app.App.styles,
  ],
);
