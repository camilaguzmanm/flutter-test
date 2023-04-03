import 'package:flutter/material.dart';
import 'package:flutter_technical_test/models/ui_models/ui_colors.dart';
import 'package:flutter_technical_test/views/scaffolds/Background.dart';
import 'package:flutter_technical_test/views/screens/posts_view.dart';
import 'package:flutter_technical_test/views/widgets/custom_text_file_widget.dart';

import '../../models/static_data.dart';
import '../../models/ui_models/ui_size_converter.dart';
import '../../services/api_posts.dart';
import '../widgets/add_button_widget.dart';

class AddPostView extends StatefulWidget {
  const AddPostView({Key? key}) : super(key: key);

  static const routeName = '/AddPost';

  @override
  createState() => AddPostState();
}

class AddPostState extends State<AddPostView> {
  String tag = 'AddPostView';
  int _selectedIndex = 2;

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController userIdController = TextEditingController();
  bool isDisabled = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    titleController.addListener(_updateSubmitButton);
    descriptionController.addListener(_updateSubmitButton);
    userIdController.addListener(_updateSubmitButton);
  }

  void _updateSubmitButton() {
    if (_formKey.currentState != null) {
      setState(() {
        isDisabled = !_formKey.currentState!.validate();
      });
    }
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    userIdController.dispose();
    super.dispose();
  }

  void _onItemSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switchFromBottomNavigation(index, context);
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      title: 'Agregar post',
      selectedIndex: _selectedIndex,
      onItemSelected: _onItemSelected,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          onChanged: () {
            setState(() {
              _updateSubmitButton();
            });
          },
          child: Column(
            children: [
              CustomTextField(
                hintText: 'Título',
                controller: titleController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Añade un título';
                  }
                  if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                    return 'Por favor, ingresa solo letras';
                  }
                  return null;
                },
                errorColor: primaryColor2,
              ),
              spaceBetween(),
              CustomTextField(
                hintText: 'Descripción',
                controller: descriptionController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Añade una descripción';
                  }
                  return null;
                },
                errorColor: primaryColor2,
              ),
              spaceBetween(),
              CustomTextField(
                hintText: 'Usuario',
                keyboardType: TextInputType.number,
                controller: userIdController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Añade un id de usuario';
                  }
                  if (!RegExp(r'^\d+$').hasMatch(value)) {
                    return 'Por favor, ingresa solo números';
                  }
                  return null;
                },
                errorColor: primaryColor2,
              ),
              spaceBetween(),
              AddButtonWidget(
                width: 150,
                height: 40,
                labelText: 'Agregar',
                isEnabled: !isDisabled,
                actionsToDo: () async {
                  if (!isDisabled) {
                    titleContent = titleController.text;
                    descriptionContent = descriptionController.text;
                    userIdContent = int.parse(userIdController.text);

                    Map<String, dynamic> postData = {
                      'title': titleContent,
                      'body': descriptionContent,
                      'userId': userIdContent,
                    };
                    await createPost(postData);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PostsView()),
                    );
                  } else {
                    null;
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox spaceBetween() {
    return SizedBox(
      height: relativeHeight(iosValue: 30, androidValue: 30),
    );
  }
}
