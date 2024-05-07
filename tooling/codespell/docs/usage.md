# Codespell Usage

Codespell is a tool for fixing common misspellings in text files. This document provides instructions on how to use Codespell locally and how to update the ignore list.

## Running Codespell Locally

To run Codespell locally, run the following command:

```sh
pnpm spellcheck
```

If you encounter any issues with running the above command due to not having one or more of the necessary dependencies required to run Codespell installed properly, please manually install whichever dependencies were prompted as not being installed properly by the above command.

The list of dependencies that may not be installed correctly include:

- `apt-get` or Homebrew
- Python
- Pip
- Codespell
- `pnpm`

Running a generic Codespell command follows this format:

```sh
codespell [options] [files/directories]
```

Replace `[options]` with any desired options (see the "Options" section below), and `[files/directories]` with the specific files or directories you want to check.

For example, to check all files in the current directory and automatically fix spelling mistakes, run:

```sh
codespell --write-changes .
```

### Options

Codespell supports various options to customise its behavior. Here are some commonly used options:

- `--write-changes`: Automatically fix spelling mistakes in the files.
- `--interactive=<value>`: Set the interactive mode for handling corrections (0: no interactivity, 1: prompt for confirmation on single suggestions, 2: prompt to choose for multiple suggestions, 3: both 1 and 2).
- `-L <words>`, `--ignore-words-list=<words>`: Ignore the specified comma-separated list of words.
- `-I <file>`, `--ignore-words=<file>`: Ignore the words listed in the specified file (one word per line).
- `--skip=<patterns>`: Skip files or directories matching the specified comma-separated list of glob patterns.
- `--check-filenames`: Check file names for spelling mistakes.
- `--check-hidden`: Check hidden files and directories (starting with `.`).

For a complete list of options, run `codespell -h`.

## Updating the Ignore List

Codespell allows you to maintain a list of words to ignore during spell checking. This list can be provided as a comma-separated list with the `--ignore-words-list` option or as a file with one word per line using the `-I` or `--ignore-words` option. We're maintaining a file named `ignore-these-words.txt` in the `./tooling/codespell` directory as our ignore list.

To update the ignore list file (`ignore-these-words.txt`):

1. Open the `ignore-these-words.txt` file with your IDE.
2. Add or remove words as needed, with one word per line.
3. Save the file.

The updated `ignore-these-words.txt` file will be used the next time Codespell runs in our CI pipeline or locally.