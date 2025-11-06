import 'package:flutter/material.dart';

void main() {
  runApp(const TodoApp());
}


class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const TodoHomePage(),
    );
  }
}

class TodoHomePage extends StatefulWidget {
  const TodoHomePage({super.key});

  @override
  State<TodoHomePage> createState() => _TodoHomePageState();
}


class _TodoHomePageState extends State<TodoHomePage> {
   
   List<Map<String, String>> todos = [];

   final TextEditingController titleController = TextEditingController();
   final TextEditingController descriptionController = TextEditingController();

   void addtodos(){
    if(titleController.text.isEmpty || descriptionController.text.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(seconds: 1),
          backgroundColor: Colors.red,
          content: Text('Please enter both title and description'))
      );
      return;
    }
    setState(() {
      todos.add({
        'title': titleController.text,
        'description': descriptionController.text,
      });
      titleController.clear();
      descriptionController.clear();
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 1),
        backgroundColor: Colors.green,
        content: Text('Todo added successfully'))
    );

   }

  void clearTodo(){
    setState(() {
      todos.clear();
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 2),
        content: Text('All todos cleared'))
    );
   }

  void deleteTodo(int index){
    setState(() {
      todos.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 1),
        content: Text('Todo deleted'))
    );
   }

   void showEditMessage(){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 2),
        content: Text('bht mehnat se banaya hai ise edit krne ka option nhi hai'
        ))
    );
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration:BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF7C4DFF),
              Color(0xFF536DFE),
              Color(0xFF64FFDA),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      child: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 400,
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(255, 240, 105, 229).withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('To Do App',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: titleController,
                  maxLines: 1,
                  decoration: InputDecoration(
                   prefixIcon: Icon(Icons.title,
                   color: Colors.deepPurple),
                    labelText: 'Title',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      ),
                  ),
                ),
                SizedBox(height: 16.0),
                
                TextField( 
                  controller: descriptionController,
                  maxLines: 2,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.description,
                    color: Colors.deepPurple
                    ),
                    labelText: 'Description',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                 
                ),
                SizedBox(height: 16),
                 ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                    
                    elevation: 4,
                  ),
                  onPressed: addtodos, 
                  child: Text('Add Todo',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    ),
                  
                  ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      elevation: 4,
                    ),
                    onPressed: clearTodo, 
                    child: Text('Clear All Todos',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      ),
                    ),
                  ),
                  
                SizedBox(height: 24.0),
                 ListView.builder(
                  shrinkWrap: true,
                  itemCount: todos.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(todos[index]['title']!),
                        subtitle: Text(todos[index]['description']!),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit),
                              color: Colors.blue,
                              onPressed: showEditMessage,
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              color: Colors.red,
                              onPressed: () => deleteTodo(index),
                            ),
                            
                          ],
                        ),
                      ),
                    );
                  },
                ),
               
              ],),
              
          ),

        ),
        
      ),
      ),
    );
  }
}






