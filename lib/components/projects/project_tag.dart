import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class ProjectTag extends StatelessComponent {
  const ProjectTag({
    required this.label,
    super.key,
  });

  final String label;

  @override
  Component build(BuildContext context) {
    return span(classes: 'project-tag', [Component.text(label)]);
  }
}
