butt~ Max External

To compile

1. download the c74support libfiles, currently at https://github.com/Cycling74/max-sdk-base wherever you want, and copy the path to this SDK
2. create a build folder, enter it, and run cmake with the following attributes
-DSDK=path_to_sdk
-DCMAKE_OSX_ARCHITECTURES="arm64;x86_64" (if you want universal binaries on Mac() OR just -A x64 (for windows to compile in x64) 
-DCMAKE_BUILD_TYPE=Release (if you want optimised code)
..
3. then run cmake --build .

(you can sign the binaries the usual way after)