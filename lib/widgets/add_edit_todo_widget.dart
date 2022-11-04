import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:simple_todo_app_with_provider/shared/theme.dart';
import 'package:simple_todo_app_with_provider/widgets/custom_text_field.dart';

class AddEditTodoWidget extends StatelessWidget {
  AddEditTodoWidget({Key? key}) : super(key: key);

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController deadlineController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                    initialDate:DateTime.now(),
                    firstDate:DateTime(1900),
                    lastDate: DateTime(2100));

                deadlineController.text = DateFormat('dd MMMM yyyy').format(date!);
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
                'ADD TODO',
                style: buttonTextStyle,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
