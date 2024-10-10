# LetsEat.sh

`letsEat.sh` is a simple bash script that suggests food ideas based on pre-defined meal lists. You can use it to get a random suggestion for breakfast, lunch, dinner, or even for the entire day. The meal suggestions are stored in plain text files, one for each meal, inside a `lists/` directory.

## Features

- **Interactive mode**: Choose a meal interactively from a menu.
- **Argument-based mode**: Get meal suggestions directly by passing specific options (e.g., `-breakfast`, `-lunch`).
- **Randomized suggestions**: Each time the script runs, it selects a random food idea from the corresponding list.
- **Supports multiple meals**: Can suggest food for breakfast, lunch, dinner, or all meals in one go.

## Prerequisites

- Bash or ZSH  <small>(Others may work, but the script was tested on these two)</small>
- [Whiptail](https://linux.die.net/man/1/whiptail) for interactive mode (included by default on many Linux distributions)

## Usage

### 1. Look over the Meal Lists

Navigate into the `lists/` directory look over the meal lists, remove or add suggestions as needed. Each file should contain one food item per line.

```
lists/
├── breakfast.list
├── lunch.list
└── dinner.list
```

### 2. Run the Script

#### Interactive Mode

Run `letsEat.sh` without any arguments to enter interactive mode and choose a meal:
```bash
./letsEat.sh
```
#### Argument-Based Mode

Alternatively, pass an argument to get a meal suggestion directly:
```bash
./letsEat.sh -breakfast
```

Available arguments:
- `-breakfast`: Get a breakfast suggestion.
- `-lunch`: Get a lunch suggestion.
- `-dinner`: Get a dinner suggestion.
- `-all`: Get suggestions for all meals in one go.
