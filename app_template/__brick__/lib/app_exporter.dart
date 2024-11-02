export 'package:flutter/material.dart';

//? ---- App Dependencies -----
{{#dependencies}}
//* {{..snakeCase()}}
export 'package:{{..snakeCase()}}/{{..snakeCase()}}.dart';
{{/dependencies}}

//? ---- App Folders -----
{{#folders}}
//* {{..snakeCase()}}
export '{{..snakeCase()}}/exporter.dart';
{{/folders}}

//* {{app_name.snakeCase()}}
export 'app/exporter.dart';

// * global
export 'global/exporter.dart';

//* {{features_folder.snakeCase()}}
export '{{features_folder.snakeCase()}}/exporter.dart';
