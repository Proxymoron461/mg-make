#!/bin/bash

extended="false"

if [[ $1 == "-e" ]]; then
    extended="true"
    shift
fi

if ls | grep -q "$1$" ; then
    echo "A folder/file with this name already exists in this directory!"
    echo "Please try again with a different name."
    exit 1
fi

if [[ -z $1 ]] ; then
    echo "No project name provided!"
    exit 1
elif [[ ! "$1" =~ ^[a-zA-Z0-9]*$ ]] ; then
    echo "Invalid project name given!"
    exit 1
fi

mkdir $1
cd $1
dotnet new mgdesktopgl
dotnet new sln

if [[ $extended == "true" ]] ; then
    printf "\n\n"
    echo "Adding package MonoGame.Extended..."
    dotnet add package MonoGame.Extended
fi

printf "\n\n"
echo "Running the blank project in the background to check it works. Press the ESC key to exit."

dotnet run &
