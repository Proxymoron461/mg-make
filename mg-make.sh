#!/bin/bash

extended="false"
gitrepo="false"

# Go through all options, including ones that can be combined.
while [[ $1 =~ ^- ]] ; do
    for (( i=1; i<${#1}; i++ )); do case "${1:i:1}" in
        "e")
            extended="true"
            ;;
        "g")
            gitrepo="true"
            ;;
        *)
            echo "Unknown option: ${1:i:i+1}."
            exit 1
            ;;
    esac; done
shift; done

# Check file doesn't already exist.
for file in ./*; do
    if [[ $1 == ${file#./} ]] ; then
        echo "A folder/file with this name already exists in this directory!"
        echo "Please try again with a different name."
        exit 1
    fi
done

# Check project names are valid
if [[ -z $1 ]] ; then
    echo "No project name provided!"
    exit 1
elif [[ ! "$1" =~ ^[a-zA-Z0-9]*$ ]] ; then
    echo "Invalid project name given!"
    exit 1
fi

# Go to new directory and create project
if mkdir $1 && cd $1 > /dev/null ; then
    echo "Created and moved into new directory."
fi
if dotnet new mgdesktopgl > /dev/null ; then
    echo "Successfully created .NET project."
fi
if dotnet new sln > /dev/null ; then
    echo "Successfully created .NET project solution."
fi

# Add MonoGame.Extended if desired
if [[ $extended == "true" ]] ; then
    if dotnet add package MonoGame.Extended > /dev/null ; then
        echo "Successfully added MonoGame.Extended to project."
    fi
fi

# Add git repo if desired
if [[ $gitrepo == "true" ]] ; then
    if git init > /dev/null ; then
        echo "Successfuly added git repository."
    fi
    if touch .gitignore > /dev/null ; then
        echo "Successfully added .gitignore file."
    fi
fi

# Run the project!
echo "Running the blank project in the background to check it works.\nPress the ESC key to exit."
dotnet run &

