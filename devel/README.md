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
 - Partial support: [Intellitrace](http://msdn.microsoft.com/en-us/magazine/ee336126.aspx). Doesn't look very detailed.
 - Support: Snapshots with any debugger in a virtual machine
- Customizable debugger
 - Support: [Pharo](http://www.pharo-project.org/home)
- Live debugging and reload
 - Support: Clojure IDEs: VimClojure, LightTable, live-cljs
 - Support: Javascript, debuggers like Chrome dev tools
 - Support: [Pharo](http://www.pharo-project.org/home)
- Full static type inference
 - Support: F#, ML, Haskell
- Custom debugger visualization
 - Support: ?
- Literal programming
 - More of a style than support, but easier in concise languages like Clojure and Python
 - The intent is to be able to read/browse the program linearly from A to Z through a series of examples and docs, just like a book
 - Can be implemented as test cases with adequate visualization of results, together with browseable serialization of code execution and code coverage
- Zero environment/IDE setup cost
 - JSBin
 - Cloud hosting, such as Heroku projects with plug-in reload from GitHub
 
# Interop classification

- Native, JVM, .NET VM
- Boundary: JNI, HTTP, AJAX, JSON, Python extension methods, Python
- Multitarget:
 - Compilers for Java to JavaScript
 - C# to JavaScript etc
 - Clojure / ClojureScript
 - Python / YJy
  
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
