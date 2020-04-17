# mg-make
A shell script for creating MonoGame projects on (Ubuntu) Linux.

It has the following dependencies:
- `msbuild`: which can be installing using `apt-get install msbuild`. (See below.)
- `dotnet`: install instructions can be found at: https://dotnet.microsoft.com/download.
- The CSharp MonoGame Template: which can be installed using `dotnet new -i "MonoGame.Template.CSharp"`
- Microsoft.NetCore.App: which can be installed via the .NET 2.1 SDK, with the command `apt-get install dotnet-sdk-2.1`
- MonoGame: install instructions can be found at: https://www.monogame.net/documentation/.

I had some difficulties installing `msbuild` and having to fix broken packages, so I would recommend installing it before all the above, with `apt-get install msbuild`. Of course, you may not have these issues!

While this script is primarily a note-to-self, if anyone else finds it helpful, go nuts! It has *no warranty whatsoever*.

