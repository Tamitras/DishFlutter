import 'package:flutter/material.dart';
import 'package:reorderables/reorderables.dart';

import '../Constants/app_constants.dart';
import '../Utilities/app_utils.dart';

class EditRecipeScreen extends StatefulWidget {
  const EditRecipeScreen({Key? key}) : super(key: key);

  @override
  State<EditRecipeScreen> createState() => _EditRecipeScreenState();
}

class _EditRecipeScreenState extends State<EditRecipeScreen> {
  var utils = AppUtils();
  var nameController = TextEditingController();
  var qtyController = TextEditingController();
  var ingredientController = TextEditingController();
  var workStepController = TextEditingController();
  var completionTimeController = TextEditingController();
  bool artificialIntelligence = false;
  int ingredientsAmount = 1;
  int workSteps = 1;
  List<Widget>? _rows;

  @override
  void initState() {
    _rows = List<Widget>.generate(
        3,
        (int index) => Padding(
              key: ValueKey(index),
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                children: [
                  Expanded(
                    child: utils.textField(
                      hintText: "Name of work step",
                      isObscure: false,
                      controller: workStepController,
                      prefixIcon: Image.asset(
                        "assets/editMealsIcon.png",
                        color: blueColor,
                        scale: 18,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      workSteps--;
                      setState(() {});
                    },
                    child: Container(
                      width: 30,
                      height: 50,
                      decoration: BoxDecoration(
                        color: blueColor,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Icon(
                        Icons.delete_forever,
                        color: backgroundColor,
                        size: 25,
                      ),
                    ),
                  )
                ],
              ),
            ));
    nameController.text = "My Recipe 1";
    ingredientController.text = "Flour";
    qtyController.text = "20 g";
    workStepController.text = "Add flour 20 g in a bowl";
    completionTimeController.text = "40 Min";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void onReorder(int oldIndex, int newIndex) {
      setState(() {
        Widget row = _rows!.removeAt(oldIndex);
        _rows!.insert(newIndex, row);
      });
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: blueColor,
                    ),
                  ),
                  Text(
                    "Edit Recipe",
                    style: utils.largeTitleBoldTextStyle(
                      color: blueColor,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 200,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage(
                      "assets/backgroundimage.png",
                    ),
                    fit: BoxFit.cover,
                  ),
                  color: blueColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Name of Recipe",
                  style: utils.mediumTitleBoldTextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              utils.textField(
                controller: nameController,
                hintText: "Name",
                isObscure: false,
                prefixIcon: Image.asset(
                  "assets/tag.png",
                  color: blueColor,
                  scale: 18,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Ingredients",
                  style: utils.mediumTitleBoldTextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              for (int i = 0; i < ingredientsAmount; i++)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    children: [
                      Expanded(
                        child: utils.textField(
                          hintText: "Name",
                          controller: ingredientController,
                          isObscure: false,
                          prefixIcon: Image.asset(
                            "assets/editMealsIcon.png",
                            color: blueColor,
                            scale: 18,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: blueColor,
                            ),
                          ),
                          child: TextFormField(
                            controller: qtyController,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Qty",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          ingredientsAmount--;
                          setState(() {});
                        },
                        child: Container(
                          width: 30,
                          height: 50,
                          decoration: BoxDecoration(
                            color: blueColor,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Icon(
                            Icons.delete_forever,
                            color: backgroundColor,
                            size: 25,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  ingredientsAmount++;
                  setState(() {});
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: blueColor,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Add More Ingredients",
                        style: utils.smallTitleTextStyle(
                          color: blueColor,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.add,
                        color: blueColor,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Work Steps",
                  style: utils.mediumTitleBoldTextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              for (int i = 0; i < workSteps; i++)
                ReorderableColumn(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  onReorder: onReorder,
                  children: _rows!,
                ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  workSteps++;
                  setState(() {});
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: blueColor,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Add More Steps",
                        style: utils.smallTitleTextStyle(
                          color: blueColor,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.add,
                        color: blueColor,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Completion Time",
                  style: utils.mediumTitleBoldTextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: [
                    Expanded(
                      child: utils.textField(
                        hintText: "Total Minutes",
                        controller: completionTimeController,
                        isObscure: false,
                        prefixIcon: Image.asset(
                          "assets/clock.png",
                          color: blueColor,
                          scale: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              utils.bigButton(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 50.0,
                borderRadius: 10.0,
                containerColor: blueColor,
                onTap: () {
                  Navigator.pop(context);
                },
                text: "Save",
                fontSize: 18.0,
                textColor: Colors.white,
              ),
              const SizedBox(
                height: 150,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
