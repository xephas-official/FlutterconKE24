# Creating a Full App Template (`app_template`)

In this section, we'll take a look at how to create a full app template using Mason. We'll create a brick for a simple Flutter project that will be the foundation of our app template.

## TL:DR; Code is in the [app_template](../app_template) folder

So this follows the same steps as the previous bricks (`hello_world` and `app_feature`), and also defines it's variables in the `brick.yaml` file, and then uses the `__brick__` folder to define the output of the brick.

> You can add your own variables to the `brick.yaml` file to customize the app template to your needs.

## The `setup.dart` file

Located in in the [../app_template/__brick__/lib folder](../app_template/__brick__/lib/setup.dart)

This is a simple but yet powerful dart file that generates the structure of our app template using the variables defined in the [brick.yaml](../app_template/brick.yaml) file. It creates the folders, features, dependencies, and dev_dependencies for the app template.

It also generates the `main.dart` file that will be the entry point of our app.

Additionally, `it's self-destructive`, meaning that it deletes itself after generating the app template.

## Usaging this `app_template` Brick

### 1a) Add the Brick to your Project

Add the `app_template` brick to the workspace, by adding it to the `mason.yaml` file in the root of the project

- Here we add it locally, by providing the path to the brick folder in the `mason.yaml` file

```yaml
bricks:
  app_template:
    path: ../app_template
```

or from Github

```yaml
  app_template:
    git:
      url: https://github.com/xephas-official/FlutterconKE24.git
      path: app_template
```

### 1b) Create a JSON file in the root of your project e.g `app_data.json`

This will have all the required features for the app template, and then use that to generate the app template. We prefer using a _json file to generate the app templacte to avoid errors since the brick contains many variables, and any existing files will be overwritten_

> This is also known as a `config` file, and it's used to provide the data for the app template. See More on cofig files [here](https://docs.brickhub.dev/mason-make#-config-file)

Below is the structure of the `app_data.json` JSON file:

```json
{
  "app_name": "",
  "json_file_name": "",
  "folders": [],
  "features": [],
  "dependencies": [],
  "dev_dependencies": [],
  "features_folder": ""
}
```

- `app_name`: Name of the app you want to create. e.g `fluttercon_ke_app`.
- `json_file_name`: Name of the JSON file containing the app data. e.g `app_data.json`.
- `folders:` List of folders you want to create for the app. Meanwhile `app` and `global` folders are created by default and they contain the app and global themes, constants, and utilities. So be sure to exclude them and you can add more folders like `data`, `screens`, and `routes` etc.
- `features`: List of features (or screens) you want to add to the app. e.g `onboard, home, auth (login, register, forgot password), profile, settings, and about.` etc.
- `dependencies`: List of dependencies (packages) you want to add to the app. Any from [pub.dev](https://pub.dev) can be added here.
- `dev_dependencies`: List of development dependencies (packages) you want to add to the app. Any from [pub.dev](https://pub.dev) can be added here.
- `features_folder`: Name of the folder where you want to store your app features since we are using the FDD (Feature Driven Development) approach. e.g `screens` or `features` or any other name you prefer.

Example:

```json
{
    "app_name": "fluttercon_ke_app",
    "json_file_name": "app_data.json",
    "folders": [
        "data",
        "screens",
        "routes"
    ],
    "features": [
        "onboard",
        "home",
        "auth",
        "profile",
        "settings",
        "about"
    ],
    "dependencies": [
        "go_router",
        "url_launcher",
        "uuid",
        "gap",
        "google_fonts",
        "animations",
        "cached_network_image",
        "cupertino_icons",
        "restart_app",
        "flextras",
        "flutter_svg",
        "provider"
    ],
    "dev_dependencies": [
        "build_runner",
        "very_good_analysis"
    ],
    "features_folder": "screens"
}
```

### 2) Generate the Template (Brick)

To use this brick, run the following command in your terminal (But at the root of your project):

```bash
mason make app_template -c app_data.json --on-conflict overwrite; dart run lib/setup.dart
```

Syntax: `mason make <your_brick_name> -c <your_json_file_name> --on-conflict overwrite`; `dart run lib/setup.dart`

This will generate the app template in your workspace, and then run the `setup.dart` file to generate the app template while overwriting any existing files.

## Tada! 🎉 All Set, Happy Coding
