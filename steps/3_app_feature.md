
# (Live Coding) Creating a Feature-Based Brick (`app_feature`)

Here's our first brick (`app_feature`), we shall use this to add features to our Flutter app

This is a simple brick that we can use to add features to our Flutter app, it will create a folder structure for the feature, and also add the necessary files and folders for the feature.
This is built on top of the `FDD (Feature Driven Development)` approach, where we focus on building features for the app.

## Following the FDD approach (any other approach can be used)

We will follow the `FDD (Feature Driven Development)` approach to create a brick for a simple Flutter project this will be the foundation of our app template.

[FDD](https://en.m.wikipedia.org/wiki/Feature-driven_development) is a software development process that is driven by the features that the software will provide. It is a lightweight or Agile method for developing software.

## TL:DR; Code is in the [app_feature](../app_feature) folder

## a) Application on a single feature, building out that brick we can use to add a feature to our flutter app

1 - Steps are the same as the [`hello_world` brick](./2_hello_world.md), but we shall create a folder structure for the feature, and also add the necessary files and folders for the feature. Below is the structure of the feature brick:

```bash
feature
├── components
│   └── component.dart
├── data
│   ├── models
│   │   └── model.dart
│   ├── providers.dart
│   └── services
│       └── service.dart
└── feature.dart
```

2 - So, Let's update the `brick.yaml` to capture details for a given feature. We will also use formatters to convert the case (e.g. from `Home` to `home`) as listed on the [BrickHub Docs](https://docs.brickhub.dev/brick-syntax#built-in-lambdas) Page about how to use case formatters.

```yaml
vars:
  feature:
    type: string
    description: Name of the feature you want to create
    default: Home
    prompt: What is the name of the feature?
```

3 - All Set, now we can use the brick to generate the output file in our workspace - i.e. `fluttercon_ke_app` folder in this case

3i) Add the `app_feature` brick to the workspace, by adding it to the `mason.yaml` file in the root of the project

- Here we add it locally, by providing the path to the brick folder in the `mason.yaml` file

```yaml
bricks:
  app_feature:
    path: ../app_feature
```

or from Github

```yaml
  app_feature:
    git:
      url: https://github.com/xephas-official/FlutterconKE24.git
      path: app_feature
```

- Then run the `mason get` command to add the brick to the workspace, this is similar to running `flutter pub get` to add a package to a flutter project

```bash
mason get
```

- To confirm that the brick has been added to the workspace, you can run the `mason ls` command to list all the bricks in the workspace

```bash
mason ls
```

- Now switch to lib folder so as to create the feature

```bash
cd lib
```

3ii) Generate the output file from the brick, by running the `mason make` command with the brick name

```bash
mason make app_feature
```

- Output
The above brick creates a folder structure for the `feature`, with the name we provided in the command. Also note that the feature name is converted to lowercase, and the spaces are replaced with underscores. This is because we are using the built-in lambdas (`.snakeCase()` and `.lowerCase()`) to format the `feature` name.

Below is the structure of the `feature` brick:

```bash
feature
├── components
│   └── component.dart
├── data
│   ├── models
│   │   └── model.dart
│   ├── providers.dart
│   └── services
│       └── service.dart
└── feature.dart
```
