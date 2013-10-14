# Development features

Advanced and not so advanced development features and examples of support.

 - Functional style
  - Map, filter, iter
   - Support: Any lisp, Java 8, Python 3, C#
 - Closures, lambda
  - Support: Clojure, Java 8, C#, JavaScript
 - Debugging snapshots and reverse exploration
  - Support: [GDB](https://sourceware.org/gdb/onlinedocs/gdb/Checkpoint_002fRestart.html)
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
 
# Interop classification

 - Native, JVM, .NET VM
 - Boundary: JNI, HTTP, AJAX, JSON, Python extension methods
 - Multitarget:
  - Compilers for Java to JavaScript
  - C# to JavaScript etc
  - Clojure / ClojureScript
  
= Problems
 - Type declaration ugliness
  - C (pointers and shit, memory allocation)
   - Alleviated by GC library
  - Java
   - Generics redundancy
 - IDE robustness, setup, debugging, toolchain support
   - Experimental/non-mainstream languages
   - Clojure is improving
    - Live reload helps in VimClojure and LightTable
    - Debugging with tracing and debug macros
   - ClojureScript
    - Less mature in-browser debugging than pure JavaScript
   - To-JavaScript compilers
    - CoffeeScript solutions?
    - Solution: One-to-one debugging with line numbers
    - Solution: Pretty-print compilation
    
