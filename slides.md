# Presentation Slides Flow

## Slide (Intro Video)

[Mason (Package of the Week) - Official Flutter YouTube Channel](https://youtu.be/qjA0JFiPMnQ?si=eQe2MbtnRKWBdEyO)

## Started Example: Using the hello brick template

We shall test this out in `fluttercon_ke_app` folder (So open it in terminal to run commands)

Step are on [this get started guide](https://docs.brickhub.dev/#quick-start-)

- Activate from [pub.dev](https://pub.dev) - This is done once to install mason globally

```bash
dart pub global activate mason_cli
```

- Initialize mason in the current workspace (`fluttercon_ke_app` folder in this case)
This creats a `.mason` folder and `mason.yaml` file in the root of the project

```bash
mason init
```

- 📦 Install your first brick (a brick is like a package you add to your flutter app) in the current workspace (the `hello` brick in this example)
This is added in the `mason.yaml` file
Syntax: `mason add <brick_name>`

```bash
mason add hello
```

- Alternatively, you can install the brick globally, using the `-g` flag, this is good for use in multiple projects
Syntax: `mason add -g <brick_name>`

```bash
mason add -g hello
```

- 🚧 Generate code from a brick
Syntax: `mason make <brick_name>`

```bash
mason make hello
```

- Output
The above brick creates a file `HELLO.md` in the root of the project, with the name we provided in the command, e.g if the name was `Cephas`, the file content would be `Hello Cephas! 👋`

## (Live Coding) Next Steps: How's the `hello` brick made? by Creating our own `hello_world` brick to do the same

This is a simple brick that we can use to understand how bricks are made, so that we can base on that to create our own bricks.

- Create a new brick using the `mason new` command, this will create a new folder with the brick files and folders
Syntax: `mason new <your_brick_name>`

```bash
mason new hello_world
```

## Now Switch Branch of this Github Repo to the next step - `1_hello_world`

## Sharing Bricks

### 1) Locally

### 2) Globally

#### a) Using Github

You can also let others to access your brick by publishing it on Github, and they can install it using the `mason.yaml` file in their project. This is good for team collaboration so that you don't have to keep sharing the brick files and folders, but rahter it can be got from Github.

For Example, here are bricks I use in my projects:

```yaml
bricks:
#a) start here incase the bricks tag is present in the mason.yaml file to add the path to our brick on github
  xephas_app:
    git:
      url: https://github.com/capps096github/Cephas-Bricks.git
      path: xephas_app
```

then run `mason get` to get the brick from Github

```bash
mason get
```

#### b) Using BrickHub (Recommended)

[Brickhub](https://brickhub.dev/)

## Creating a Feature-Based Brick

### Following the FDD approach (any other approach can be used)

We will follow the FDD (Feature Driven Development) approach to create a brick for a simple Flutter project this will be the foundation of our app template.

[FDD](https://en.m.wikipedia.org/wiki/Feature-driven_development) is a software development process that is driven by the features that the software will provide. It is a lightweight or Agile method for developing software.

a) Application on a single feature, building out that brick we can use to add a feature to our flutter app

b) We will create a brick for a simple Flutter project that will be the foundation of our app template.

### Common App Features

onboard, home, auth (login, register, forgot password), profile, settings, and about.

To create these features we shall follow syntax on [here](https://mustache.github.io/mustache.5.html#:~:text=Non%2DEmpty%20Lists,Output%3A)
