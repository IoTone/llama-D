# Overview

This is a quick and dirty Dlang wrapper around llama-cpp (the most famous C++ project in the world at this moment).  Improve it, fix it, use it, and eventually a hero will offer to maintain it, make it into a proper Dlang module.

I was hunting on Dub code repositories, and was shocked to see there is no library made for D.  Here you go in 2024.

## Approach

There are well documented ways to make bindings to C and C++ in D.  A pure ground up D-centric way is superior perhaps, but many of these libraries coming from C/C++ have 4-10 years of investment in a code base and a rewrite only makes sense if that is the ethos of your community (go).  

This first attempt will just use built-in tools for library gen.  An alternative might be use dpp or ctod.  I tried ctod but it seems to be incorrect in handling of typedefs so I rule it out. 

## References

- https://github.com/ggerganov/llama.cpp
- Inspired by: Zig bindings which are mentioned in the upstream project.  Why?  What is the zig relationship to llama-cpp? https://github.com/Deins/llama.cpp.zig
- https://wiki.dlang.org/Bindings
- https://dlang.org/spec/interfaceToC.html
- https://github.com/atilaneves/dpp
- ctod

## Building

Because this D module wraps a C library, you the reader will need to build the library through means available on your platform.  It appears the library will build with clang, gcc, or probably some other variant not mentioned.

From a posix compliant shell, run sh setup-deps.sh to grab and build llama-cpp.  For simplicity, it is assumed you have make and cuBLAS.  If this is not the came, do some proper cmake magic and send a pull request.  

### Windows Notes

Since we don't provide a VS build or a fancy cmake build (that might be a good idea in the future), it is recommended that you use a POSIX shell like a ConEMU or similar to build.  This implies that you will have a Clang or gcc installed as well.  Install it before you get started.

On windows you may need to rename your library to libllama.lib.

### Building the D library

We recommend a Dlang compiler based on DMD v2.076.1 or later.

dub build --compiler=ldc2

(or whatever compiler you have ... D is complicated on the options for compilers)
## Testing

dub test --compiler=ldc2

## Examples


```
// TODO
```

## Status

Here is what is in the list of things to do:

- [ ] add porting of headers for gguf (hopefully this is not messy)
- [ ] Get a first cut of llama.h port to D
- [ ] Add linking to libllama.lib/.a/.so
- [ ] Write a dummy tester to verify that it runs
- [ ] Add a full fledged command line equivalent to what is in main.cpp in llama
- [ ] publish to dub
- [ ] Add a regex transformer script to run this through a better pipeline than manually porting ... this is a few thousand lines of code to hand port.
- [ ] Add a "build" script
- [ ] test and verify on linux
- [ ] test and verify on windows
- [ ] figure out a better way to detect platform settings and alt #ifdefs
- [ ] cmake or some other build?