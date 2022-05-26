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
