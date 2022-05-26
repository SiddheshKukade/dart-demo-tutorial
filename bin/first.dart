import 'package:first/first.dart' as first;

//main function starts the execution of the code
void main(List<String> arguments) {
  try {
    print('Dart Developers : ${first.calculate()}! \n '
        'Args sum yo : ${arguments.fold<int>(0, (previousValue, element) => previousValue + int.parse(element))}');
  } catch (e) {
    print("Error : Plese provide at least one integer");
  }
}
// fold Reduces a collection to a single value by iteratively combining each element of the collection with an existing value
//dart run - runs the bin file containing the name same as of our project if you move the bin file you can't run the project  but you can still run file from the cli by providing the path to it.
// you can provide arguments by running the project form the terminal 

//dev setup 
// devtools 
// dart run --observe --pause-isolates-on-start 

