import 'app_exporter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const {{app_name.pascalCase()}}());
}
