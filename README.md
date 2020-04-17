# mg-make
A shell script for creating MonoGame projects on (Ubuntu) Linux.

## Dependencies
It has the following dependencies:
- `msbuild`: which can be installed using `apt-get install msbuild`. (See below.)
- `dotnet`: install instructions can be found at: https://dotnet.microsoft.com/download.
- The CSharp MonoGame Template: which can be installed using `dotnet new -i "MonoGame.Template.CSharp"`
- Microsoft.NetCore.App, version 2.0.0: which can be installed via the .NET 2.1 SDK, with the command `apt-get install dotnet-sdk-2.1`
- MonoGame: install instructions can be found at: https://www.monogame.net/documentation/.
- `git`: which can be installed using `apt-get install git`.

I had some difficulties installing `msbuild` and having to fix broken packages, so I would recommend installing it before all the above, with `apt-get install msbuild`. Of course, you may not have these issues!

While this script is primarily a note-to-self, if anyone else finds it helpful, go nuts! It has *no warranty whatsoever*.

## Usage instructions
`./mg-make [ -e -g ] PROJECT_NAME`

Use the `-e` flag to add MonoGame.Extended to the project!

Use the `-g` flag to initialise a git repository in the project directory.

Replace PROJECT_NAME with your project name - e.g. `./mg-make Test`.

From the **current directory**, it will create a subdirectory called Test, and a new .NET project and solution with the same name!
