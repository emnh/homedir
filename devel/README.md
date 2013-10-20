# Project idea

## Polyglobetrotter
 - Heroku maximum polyglot template: C, Java, C#, F#, Clojure, Python.
 - Front page showing unit test results.
   - Calling from one language to another, using various cross-language boundaries.
   - Sharing/converting data.
   - Use JSON as common object format, or compilation to "literals".
 - Integrated JSBin, fork it, use CodeMirror as editor.
 - Load github project.
 - Debugging support.
 - Code analysis.
 - All in one VM: V8 + JSIL + MONO IKVM.NET.

## Web platform axiom

The browser OS. Everything compiles to JavaScript. V8 is a good VM.
If JS doesn't cut it, hand-optimized C extensions are the solution.

# Development features

Advanced and not so advanced development features and examples of support.

- Functional style
 - Map, filter, iter
 - Support: Any lisp, Java 8, Python 3, C#
- Closures, lambda
 - Support: Clojure, Java 8, C#, JavaScript
- Debugging snapshots and reverse exploration
 - Support: [GDB checkpoint](https://sourceware.org/gdb/onlinedocs/gdb/Checkpoint_002fRestart.html)
 - Support: [GDB reverse exploration](http://www.sourceware.org/gdb/wiki/ProcessRecord/Tutorial)
 - Support: [Java : Chronon Time Travelling](http://chrononsystems.com/products/chronon-time-travelling-debugger) (Commercial)
 - Support: [JavaScript: Trace GL](https://trace.gl/index.html) (Commercial)
 - Partial support: [Intellitrace](http://msdn.microsoft.com/en-us/magazine/ee336126.aspx). Doesn't look very detailed.
 - Support: Snapshots with any debugger in a virtual machine
- Customizable debugger
 - Support: [Pharo](http://www.pharo-project.org/home)
- Live debugging and reload
 - Clojure IDEs: VimClojure, LightTable, live-cljs
 - Wisp (ClojureScript in JS) (http://jeditoolkit.com/try-wisp/)
 - Javascript, debuggers like Chrome dev tools
 - [Pharo](http://www.pharo-project.org/home)
 - [cljs in cljs](http://www.clojurescript.net/)
 - [YinYang](http://research.microsoft.com/en-us/people/smcdirm/liveprogramming.aspx?iedz00)
 - [Choc: JS Interactive learning tool](https://github.com/fullstackio/choc)
- Full static type inference
 - Support: F#, ML, Haskell
- Custom debugger visualization
 - Support: ?
- Literate programming
 - (CoffeeScript example)[https://gist.github.com/jashkenas/3fc3c1a8b1009c00d9df]
 - More of a style than support, but easier in concise languages like Clojure and Python
 - The intent is to be able to read/browse the program linearly from A to Z through a series of examples and docs, just like a book
 - Can be implemented as test cases with adequate visualization of results, together with browseable serialization of code execution and code coverage
- Zero environment/IDE setup cost
 - JSBin
 - [Cloud 9 IDE](https://c9.io/): Node.js / Python / Ruby / PHP
 - Cloud hosting, such as Heroku projects with plug-in reload from GitHub

# Compiler as a service / Try it online
 - [IDEOne Multi-language](http://ideone.com/)
 - [CompileOnline Multi-language](http://www.compileonline.com/)
 - [Himera ClojureScript](http://himera.herokuapp.com)
 - [Try Clojure](http://tryclj.com/)
 - [Try Haskell](http://tryhaskell.org/)
 - [Try Linux in x86 JS emulator](http://bellard.org/jslinux/index.html)
 
# Language Interop 

 - Native, JVM, .NET VM
 - Boundary: JNI, HTTP, AJAX, JSON, Python extension methods, Python
 - (Transcompiler)[http://en.wikipedia.org/wiki/Transcompiler]: Java,C#,Clojure -> JavaScript etc
 - Shared VM: Python / Jython / IronPython. Clojure on JVM, Clojure on .NET, ClojureScript.
 - [JSIL: .NET to JavaScript](http://jsil.org)
 - [StackOverflow: JS JVM implementation](http://stackoverflow.com/questions/12316557/javascript-jvm-implementation)
 - [Doppio: JVM to JavaScript](http://plasma-umass.github.io/doppio/about.html)
 - [x86 JS emulator](http://bellard.org/jslinux/index.html) and [source code](https://github.com/levskaya/jslinux-deobfuscated).
 - [FunScript: F# JS](http://funscript.info/)
 - [WebSharper: F# JS and Web Framework](http://websharper.com/home)
 - [Skulpt: Python JS implementation](http://www.skulpt.org/)
 - [List of languages that compile to JS](https://github.com/jashkenas/coffee-script/wiki/List-of-languages-that-compile-to-JS)

# JS Debugging / Visualization
 - [Esprima: JS Parser in JS](htps://github.com/ariya/esprima)
 - [MetaJS: JS debugger in JS](https://github.com/int3/metajs), [Demo](http://int3.github.io/metajs/#)
 - [JS WebGL tracer (not free)](https://trace.gl/)
  
# Problems

 - Type declaration ugliness
  - C: Pointers and shit, memory allocation. Alleviated by GC library.
  - Java: Generics redundancy
 - IDE robustness, setup, debugging, toolchain support
  - Mostly a problem with experimental/non-mainstream languages, lacking IDE support.
  - Clojure: Improving. Live reload helps in VimClojure and LightTable. Debugging with tracing and debug macros.
  - ClojureScript: Less mature in-browser debugging than pure JavaScript.
 - Debug opacity
  - To-JavaScript compilers: [JS source maps](http://www.html5rocks.com/en/tutorials/developertools/sourcemaps/). Pretty-print compilation.
  - Code generation: Debugging and tracing back to code generator. Should be okay manually for isolated parts.
  - [Intellij IDEA File Watchers / Transpilers](https://www.jetbrains.com/idea/webhelp/using-file-watchers.html)

# Visual programming
 - [Meemo: Image pipe visualization](http://meemoo.org/iframework/#gist/3124854) Useful for image/animation construction. Especially filter applications. And creating music.
