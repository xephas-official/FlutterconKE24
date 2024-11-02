
# Step 1: Introduction

[Mason (Package of the Week) - Official Flutter YouTube Channel](https://youtu.be/qjA0JFiPMnQ?si=eQe2MbtnRKWBdEyO)

---

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
