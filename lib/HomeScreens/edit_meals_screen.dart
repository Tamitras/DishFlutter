import 'package:flutter/material.dart';
import 'package:food_manager/Utilities/app_utils.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:reorderables/reorderables.dart';

import '../Constants/app_constants.dart';

class EditMealsScreen extends StatefulWidget {
  const EditMealsScreen({Key? key}) : super(key: key);

  @override
  State<EditMealsScreen> createState() => _EditMealsScreenState();
}

class _EditMealsScreenState extends State<EditMealsScreen> {
  var utils = AppUtils();
  var nameController = TextEditingController();
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
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Let's add some of the \nawesome food!",
                  style: utils.largeTitleBoldTextStyle(
                    color: blueColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 20,
              ),
              Wrap(
                spacing: 20.0,
                runSpacing: 20.0,
                children: [
                  for (int i = 0; i < 2; i++)
                    Column(
                      children: [
                        Container(
                          width: 160,
                          height: 160,
                          decoration: BoxDecoration(
                            color: blueColor,
                            image: const DecorationImage(
                              image: AssetImage(
                                "assets/dp.png",
                              ),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              width: 40,
                              height: 40,
                              margin: const EdgeInsets.only(top: 20, right: 20),
                              decoration: BoxDecoration(
                                color: backgroundColor,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.delete_forever,
                                size: 20,
                                color: blueColor,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 10,
                          width: 160,
                          child: LiquidLinearProgressIndicator(
                            value: 0.7,
                            valueColor:
                                const AlwaysStoppedAnimation(Colors.red),
                            backgroundColor: backgroundColor,
                            borderColor: Colors.red,
                            borderWidth: 2.0,
                            borderRadius: 12.0,
                            direction: Axis.horizontal,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 10,
                          width: 160,
                          child: LiquidLinearProgressIndicator(
                            value: 0.7,
                            backgroundColor: backgroundColor,
                            borderColor: blueColor,
                            borderWidth: 2.0,
                            borderRadius: 12.0,
                            direction: Axis.horizontal,
                          ),
                        ),
                      ],
                    ),
                  Container(
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                      color: blueColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.add,
                        size: 80,
                        color: backgroundColor,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 50,
                decoration: BoxDecoration(
                  color: blueColor.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Artificial Intelligence",
                      style: utils.smallTitleTextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Checkbox(
                      activeColor: backgroundColor,
                      value: artificialIntelligence,
                      onChanged: (val) {
                        artificialIntelligence = val!;
                        setState(() {});
                      },
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/alarm.png",
                    scale: 20,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Expanded(
                    child: Text(
                      "An artificial intelligence analyzes the photos and helps determine the ingredients. The more photos are uploaded, the higher the chance that can be assisted (pre-filled) in generating the recipe (BETA).",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 20,
                child: LiquidLinearProgressIndicator(
                  value: 0.7,
                  valueColor: const AlwaysStoppedAnimation(Colors.red),
                  backgroundColor: backgroundColor,
                  borderColor: Colors.red,
                  borderWidth: 2.0,
                  borderRadius: 12.0,
                  direction: Axis.horizontal,
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
                onTap: () {},
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
