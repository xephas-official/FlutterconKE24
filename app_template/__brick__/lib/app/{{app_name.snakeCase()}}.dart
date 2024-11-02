import '../app_exporter.dart';

  ///This is the root of our {{app_name.pascalCase()}} app
class {{app_name.pascalCase()}} extends StatelessWidget {
  /// constructor
  const {{app_name.pascalCase()}}({super.key});

  @override
  Widget build(BuildContext context) {
   
    return MaterialApp.router(
      // -- Router --
      // routerConfig: goRouter,

      // -- Theme --
      // color: appColor,
      // theme: appTheme,

      // -- Title --
      // title: {{app_name.camelCase()}}Title,
      // restorationScopeId: {{app_name.camelCase()}}AppId,

      // -- Debug Mode --
      debugShowCheckedModeBanner: false,

      // -- Bouncing Scroll Behavior --
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        physics: const BouncingScrollPhysics(),
        scrollbars: false,
      ),
    );
  }
}
