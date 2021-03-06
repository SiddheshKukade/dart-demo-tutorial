A sample command-line application with an entrypoint in `bin/`, library code
in `lib/`, and example unit test in `test/`.

# Dart Project Structure [CONSOLE-FULL TEMPLATE]
### there nothing like dart project exist there is only dart package refer project as package
- `.dart_tool`  , .packages, pubspec.yaml , pubspec.lock files are associated with the packages
- `lib` folder is realted to the libraries 
- `analysis_options.yaml` is related to the dart linting
- `bin` - reserverd for command line apps just like this one 
- `.vscode` is for vscode configurations 
- `.README.md` , .gitignore , CHANGELOG.md , are for git source control 

# Packages in dart 
- Dart Package is main component of the dart ecosystem 
- (Pub.dev)[https://www.pub.dev] - a site where everyone comes and uploades thier own dart packages
- You can use existing packages to implement common features like database connections & state management ,etc.
- Application Pacakge is the package the will not be uploaded on the pub.dev 
- Library Pacakge is the package that will be uploaded on the pub.dev
- Dart also has a pakcage manager that holds the job to manage all these pacakges which is known as `pub`
- 'pubspec.yml' is like  `package.json` if you are coming from node js it is responsible for
    - organizing the functionalities , and version of the pacakges 
    - We have to metion the `name` of the package sdk versio `dependancies` and `dev-dependacies` 
    - also contains a list of external packages that our packages depends on 
    - you can more infor about pacakges on (pub.dev)[https://pub.dev]
    - ex. `pedantic` package is related to the linting topic and the  `test` packages is related to testing topic.
- `pubspec.lock` and `pubspec.yaml` are genreated automatically when we run `dart pub get `
- `.dart_tool/pub/package_cofig.json ` file contains the imports for the packages that are used in our project here is an example is 
```js
  {
      "name": "_fe_analyzer_shared",
      "rootUri": "file:///C:/Users/User/AppData/Local/Pub/Cache/hosted/pub.dartlang.org/_fe_analyzer_shared-40.0.0",
      "packageUri": "lib/",
      "languageVersion": "2.12"
    },
    // Our Pacakge is also listed on the bottom
    {
      "name": "first",
      "rootUri": "../",
      "packageUri": "lib/",
      "languageVersion": "2.16"
    }
```
- `.packages` file is deprecated version of the `.dart_tool/pub/pacakge_config.json` file
- `pubspec.lock` file mainly links to the exact version of the package here's how it looks : 
```yml
packages:
  _fe_analyzer_shared:
    dependency: transitive
    description:
      name: _fe_analyzer_shared
      url: "https://pub.dartlang.org"
    source: hosted
    version: "40.0.0"
  analyzer:
    dependency: transitive
    description:
      name: analyzer
      url: "https://pub.dartlang.org"
    source: hosted
    version: "4.1.0"
```
<hr/>

## Packages vs Libraries
- Pacakge can contain one or more libraries 
- `lib` folder contains code publicly accessible to everyone meaning that if you upload your package on pub.dev then others can only use it's `lib `folder only other folders like `bin` will not be accessible 
- `lib` folder contains the implemetation for the package which is  publicly accessible once it is uplaoded on pub.dev 

<hr/>

# Dart Linting 
- used to check for warnings and errors
- `pedantic` is one of the popular linting package contains the linting rules used by google for creating thier apps.
- `analysis_options.yaml` is responsible for the specidifying the rules for linting
- to see the depedancy code go to the vs code `DEPENDACIES` section
- 
![image](https://user-images.githubusercontent.com/65951872/170520357-f1bb1730-1d50-40f9-84c0-6815d3b94a88.png)

- `very-good-analyzer ` is also another linting pacakage used by <b>very-good ventures </b>

# Dart Tests 
- Ideally for every feature and Functionality we should have a test checking functionality to prove it's robusness.
- `/test` folder in dart contains all the testing code.
- Unit tests can be executed from code editor or from the dart cli
- `dart test` is command to run all the tests.

# Execution and Compilation of Dart Programs 
## Dart Running Workflew
### Dev Phase :
- Fast & Stable Developement Workflow
- Quick Analayzer & Reformatting tools
- Fast Compilation and Recompilation
- Code Optimization Techniques
- Intuitive Debugging tools

### Prod Phase :
- Focused primarily on UX 
- Fast Startup time
- Usefulness , reliability, stability
- Good-lookingness , Interactivity
- Testing in real world scenarios

### Dart VM - Provides the execution environment for the dart apps , for production dart also uses a strip down version of dart vm for improved performance
- any code inside the vm runs on an isolated environment
- it is also known as isolated dart universe 
- it has it's own heap memory for it;s own thread of control for mutators and helper threads
- heap is a garbage collector managed memory storage for all the objects allocated by the    programs
- garbage collector reclaims memory which was allocted to program but it is no longer referenced.

#### Dart VM Executes the Source code in 2 ways : 
1. from `source ` by using `JIT/AOT` compiler
 - 1.1 Running the source code from JIT Compiler
    - use `dart run ` command
      -  the code goes to the dart vm but dart VM can only run kernel binaries `(.dill files)` [contains serialed kernal abstract syntax as well as kernel AST] kernel AST is based on intermediatery language such as dart  
      - ![image](https://user-images.githubusercontent.com/65951872/170646710-ca81978e-65b7-43ea-8789-e08224fc856b.png)
      - After running `dart run ` command : 
      ![image](https://user-images.githubusercontent.com/65951872/170647028-d52c0720-9ffb-4584-a6f2-96e19ad7a525.png)
 - 1.2 Running from source code using AOT Compiler :
      - mainly used for prod env 
       ![image](https://user-images.githubusercontent.com/65951872/170648047-8a92fff5-6671-4ab0-a0df-3e15b2819970.png)
        ![image](https://user-images.githubusercontent.com/65951872/170648193-fac15aeb-f5d1-4171-bdeb-d8faa0be8fd1.png)
      - tfa removes unreachable methods 
      - replaces indirect virtual function calls to direct function calls.
      - AOT is based on JIT but with added optimizations. 
      - to use AOT Compiler `dart compile exe .\bin\<YOUR_PROJECT_NAME>.dart`                     

2. from Snapshots (jit, aot or kernel snapshots) 
![image](https://user-images.githubusercontent.com/65951872/170609184-56244f45-1349-48a3-8d11-c30f7ef2120a.png)

### Snapshot : 
  - What is snapshot - it just contains efficient representation of the entities that are allocated to the dart VM heap memory. this heap is traversed just before calling the main function.
  - It is optimized for faster startup times so insted of parsing the whole source again  
  - basically the heap data is serialized in the snapshot file and it is then deserialized to heap memory again by the Dart VM to run it faster. 
    - 3 types of snapshot :
    1. JIT Snapshot - contains all parsed ,classes and code during our training run
      - training run - `dart compile jit-snapshot .\bin\first.dart` and `dart run .\bin\<YOUR_PROJECT_NAME>.dart` is faster than `dart run ` [50 % Time improvement.] 
    2. AOT Snapshot - Not uses training run . uses standard AOT Compilation approach so that the VM can directly run the snapshot without having to redo to the compilations and optimizations.
    - difference between AOT Compilation & AOT Snapshot Compilation 
    - ![image](https://user-images.githubusercontent.com/65951872/170652218-23974ef9-b446-4b75-97c3-95afa53e5960.png)
    - ![image](https://user-images.githubusercontent.com/65951872/170652299-67049e42-07cd-405b-b20e-e4474a14fd7d.png)
 
    3. Kernel Snapshot - portable around all cpu ; dart vm still needs to compile this 

3. to see the corresponding kernel file : 
  `dart compile kernel .\bin\<YOUR_PROJECT_NAME>.dart` 

4. Once this kernel binary is loaded in VM then it is parsed into various programming entities like Classes , Fields , Procedure , libraries ,etc.

5. this process is done in a LAZY way it parses basic information first and each pointer then points to the kernel binary so that later on it can continue parsing hence the name Just In Time Compiler. 


# Dart Pacakges 
### Dart Package is just a library containing   `pubspec.yml` file . it supports the follwing fields in it: 
![image](https://user-images.githubusercontent.com/65951872/170663146-a0a6efb9-500a-4d5b-9b53-c0b3e61b5c14.png)

## Types of dependancies : 
1. Immediate Dependancies
2. Transitive Dependancies
3. Regular Dependacies - used for both prod and dev environment
4. Dev Dependacies - only be used during the developement phase
### Ex . if you pacakge depends on a and a -> b and b-> c (-> means depends on) then a is immediate depedancy and b and c are transitive dependacies.

# Dart Community uses semantic versioning for packages refer (semver.org)[https://www.semver.org]
## Ways to specify version constriats 
1. Caret Syntax ^ `ex . ^1.2.3 , ^0.1.2`
2. traditional syntax =  `ex.  >=1.2.3 <2.0.0 , >=0.1.2 <0.2.0`

### Don't use caret syntax for SDK Constraint instead use traditional method 

## Alternatives for pub.dev 
- hosted pacakges on HTTP Servers 
- git packages
- path packages - multiple realted pacakages ,ex. creating big app that depends on smaller pakcages
- sdk source - packages that came along with the SDKs [currently flutter is only supported here ]

### Packages are stored on a special folder on local machine which can be specified via setting PUB_CACHE Environment variable
#### you can see this path on `package_config.json` file.