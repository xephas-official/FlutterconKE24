
# Step2: (Live Coding) `hello_world` Brick (Template) Creation

## How's the `hello` brick in [Step 1](./1_intro.md) made? by Creating our own `hello_world` brick to do the same

This is a simple brick that we can use to understand how bricks are made, so that we can base on that to create our own bricks.

Step are on this [Creating Bricks guide](https://docs.brickhub.dev/mason-new)

1 - Create a new brick using the `mason new` command, this will create a new folder with the brick files and folders
Syntax: `mason new <your_brick_name>` (e.g `hello_world`)

```bash
mason new hello_world
```

2 - The above command creates a folder `hello_world` in the root of the project, with the following files and folders:

```bash
✓ Generated 5 file(s). (22ms)
  created hello_world/brick.yaml
  created hello_world/README.md
  created hello_world/CHANGELOG.md
  created hello_world/LICENSE
  created hello_world/__brick__/HELLO.md
```

More info on the [Brick Structure](https://docs.brickhub.dev/brick-structure)

- `brick.yaml` (main focus for set up) - This is the configuration file for the brick, it contains the name, description, and version of the brick, and then it's also used for setting up the brick and its questions, this includes defining variables and their data types, and also the default values. (Open it to see the content) - In it, the key section is the `vars` section, where we define the variables that will be used in the brick, and their data types, and default values. In this example we use `username` and `country` as variables, and their default values are `Cephas` and `Uganda` respectively.

2ii) Update the `brick.yaml` file in the root of the brick folder to include the following content: take note of the formatting, its similar to that of `pubspec.yaml` file

```yaml
vars:
  username:
    type: string
    description: What do your friends call you?
    default: Xephas
    prompt: What is your name?
    
  country:
    type: string
    description: Where are you from?
    default: Uganda
    prompt: Which country are you from?
```

- `README.md` - This is the documentation for the brick, it contains information about the brick, how to use it, and any other relevant information.
- `CHANGELOG.md` - This is the changelog for the brick, it contains information about the changes made to the brick in each version.
- `LICENSE` - This is the license file for the brick, it contains the license under which the brick is distributed.
- `__brick__` (main focus for output) - This is the folder that contains the `templates` for the brick, it contains the files and folders that will be generated when the brick is used. In other words, it contains the output of the brick. (In this case, create a file `HELLOWORLD.md`) and this is what will be output when the brick is used.

2ii) - Update the `HELLO.md` file in the `__brick__` folder to include the following content: It uses the mustache template language to define the output of the brick, and it contains the variables that we defined in the `brick.yaml` file.

```markdown
# Welcome to Fluttercon Kenya 2024

Here are your details:

- Username: {{username}}! 👋
- Country: {{country}} 🌍
```

For More Info on the:

- [Mustache Template Language](https://mustache.github.io/mustache.5.html)
- [Brick Syntax](https://docs.brickhub.dev/brick-syntax)

3 - All Set, now we can use the brick to generate the output file in our workspace - i.e. `fluttercon_ke_app` folder in this case

3i) Add the `hello_world` brick to the workspace, by adding it to the `mason.yaml` file in the root of the project

- Here we add it locally, by providing the path to the brick folder in the `mason.yaml` file

```yaml
bricks:
  hello_world:
    path: ../hello_world
```

or from Github

```yaml
  hello_world:
    git:
      url: https://github.com/xephas-official/FlutterconKE24.git
      path: hello_world
```

- Then run the `mason get` command to add the brick to the workspace, this is similar to running `flutter pub get` to add a package to a flutter project

```bash
mason get
```

- To confirm that the brick has been added to the workspace, you can run the `mason ls` command to list all the bricks in the workspace

```bash
mason ls
```

3ii) Generate the output file from the brick, by running the `mason make` command with the brick name

```bash
mason make hello_world
```

- Output
The above brick creates a file `HELLOWORLD.md` in the root of the project, with the name  and country we provided in the command

```markdown
# Welcome to Fluttercon Kenya 2024

Here are your details:

- Username: Brian Cephas! 👋
- Country: Kenya 🌍
```
