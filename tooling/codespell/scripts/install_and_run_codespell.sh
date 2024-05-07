#!/bin/bash

# Check the operating system
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    os="linux"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    os="macos"
elif [[ "$OSTYPE" == "cygwin" ]]; then
    os="windows"
elif [[ "$OSTYPE" == "msys" ]]; then
    os="windows"
elif [[ "$OSTYPE" == "win32" ]]; then
    os="windows"
elif [[ "$OSTYPE" == "freebsd"* ]]; then
    os="freebsd"
else
    echo "Unsupported operating system: $OSTYPE"
    exit 1
fi

# Check if Python and pip are installed
if ! command -v python3 &> /dev/null; then
    echo "Python is not installed. Installing Python..."
    if [[ "$os" == "linux" ]]; then
        sudo apt-get update || { echo "Error updating package lists"; exit 1; }
        sudo apt-get install -y python3 python3-pip || { echo "Error installing Python and pip"; exit 1; }
    elif [[ "$os" == "macos" ]]; then
        brew install python3 || { echo "Error installing Python with Homebrew"; exit 1; }
    elif [[ "$os" == "windows" ]]; then
        echo "Please install Python manually from https://www.python.org/downloads/"
        exit 1
    fi
fi

if ! command -v pip3 &> /dev/null; then
    echo "pip is not installed. Installing pip..."
    if [[ "$os" == "linux" ]]; then
        sudo apt-get install -y python3-pip || { echo "Error installing pip"; exit 1; }
    elif [[ "$os" == "macos" ]]; then
        python3 -m ensurepip || { echo "Error ensuring pip is installed with Python"; exit 1; }
    elif [[ "$os" == "windows" ]]; then
        echo "Please install pip manually from https://pip.pypa.io/en/stable/installing/"
        exit 1
    fi
fi

# Check if Codespell is installed
if ! command -v codespell &> /dev/null; then
    echo "Codespell is not installed. Installing Codespell..."
    pip3 install codespell || { echo "Error installing Codespell"; exit 1; }
fi

# Run Codespell
pnpm spellcheck:setup || { echo "Error running Codespell. Pnpm may not be installed"; exit 1; }