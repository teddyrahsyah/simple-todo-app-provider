import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:simple_todo_app_with_provider/models/todo_model.dart';
import 'package:simple_todo_app_with_provider/providers/todo_list_provider.dart';
import 'package:simple_todo_app_with_provider/shared/theme.dart';
import 'package:simple_todo_app_with_provider/widgets/custom_text_field.dart';
import 'package:simple_todo_app_with_provider/widgets/info_widget.dart';
import 'package:uuid/uuid.dart';

class AddEditTodoWidget extends StatefulWidget {
  final TodoModel? todo;
  final bool isAddButton;

  const AddEditTodoWidget({Key? key, this.todo, required this.isAddButton})
      : super(key: key);

  @override
  State<AddEditTodoWidget> createState() => _AddEditTodoWidgetState();
}

class _AddEditTodoWidgetState extends State<AddEditTodoWidget> {
  final TextEditingController titleController = TextEditingController();

  final TextEditingController descriptionController = TextEditingController();

  final TextEditingController deadlineController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (widget.todo != null) {
      titleController.text = widget.todo!.title;
      descriptionController.text = widget.todo!.description;
      deadlineController.text = widget.todo!.deadline;
    }

    Widget formSection() {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 24),
        child: Column(
          children: [
            CustomTextField(
              labelText: "Title",
              controller: titleController,
              margin: const EdgeInsets.only(bottom: 16),
            ),
            CustomTextField(
              labelText: "Description",
              controller: descriptionController,
              maxLines: 20,
              margin: const EdgeInsets.only(bottom: 16),
            ),
            CustomTextField(
              labelText: "Deadline",
              controller: deadlineController,
              suffixIcon: Icon(
                Icons.date_range,
                color: white,
              ),
              onTap: () async {
                FocusScope.of(context).requestFocus(FocusNode());

                // Show date picker
                DateTime? date = DateTime(1900);
                date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100),
                  builder: (context, child) {
                    return Theme(
                      data: Theme.of(context).copyWith(
                        colorScheme: ColorScheme.light(
                          primary: primary, // header background color
                          onPrimary: accent, // header text color
                          onSurface: black, // body text color
                        ),
                        textButtonTheme: TextButtonThemeData(
                          style: TextButton.styleFrom(
                            primary: Colors.red, // button text color
                          ),
                        ),
                      ),
                      child: child!,
                    );
                  }

                );

                deadlineController.text =
                    DateFormat('dd MMMM yyyy').format(date!);
              },
            ),
          ],
        ),
      );
    }

    return Container(
      height: MediaQuery.of(context).size.height - 100,
      padding: const EdgeInsets.only(left: 24, top: 16, bottom: 24, right: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            width: 80,
            height: 6,
            decoration: BoxDecoration(
                color: white, borderRadius: BorderRadius.circular(3)),
          ),
          formSection(),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: white,
                  onPrimary: primary,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
              child: Text(
                widget.isAddButton ? "ADD TODO" : "EDIT TODO",
                style: buttonTextStyle,
              ),
              onPressed: () {
                if (titleController.text.isEmpty ||
                    descriptionController.text.isEmpty ||
                    deadlineController.text.isEmpty) {
                  showDialog(
                    context: context,
                    builder: (context) => const InfoWidget(
                        title: "Error!",
                        content: "Please enter all form"),
                  );
                } else {
                  if (widget.todo != null) {
                  } else {
                    // add new todo
                    const uuid = Uuid();

                    context.read<TodoListProvider>().addTodo(
                          TodoModel(
                            id: uuid.v4(),
                            title: titleController.text,
                            description: descriptionController.text,
                            deadline: deadlineController.text,
                          ),
                        );
                  }
                  Navigator.pop(context);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
