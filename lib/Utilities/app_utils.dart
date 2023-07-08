import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';

import '../Constants/app_constants.dart';

class AppUtils {
  mediumTitleTextStyle({color}) {
    return TextStyle(
      fontSize: 20,
      color: color,
    );
  }

  largeTitleBoldTextStyle({color, height}) {
    return TextStyle(
      fontSize: 23,
      height: height,
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  mediumTitleBoldTextStyle({color}) {
    return TextStyle(
      fontSize: 17,
      color: color,
      fontWeight: FontWeight.bold,
    );
  }

  smallTitleTextStyle({color}) {
    return TextStyle(
      fontSize: 14,
      color: color,
    );
  }

  xMediumTitleTextStyle({color}) {
    return TextStyle(
      fontSize: 17,
      color: color,
    );
  }

  xMediumTitleBoldTextStyle({color}) {
    return TextStyle(fontSize: 16, color: color, fontWeight: FontWeight.w600);
  }

  smallTitleBoldTextStyle({color}) {
    return TextStyle(
      fontSize: 14,
      color: color,
      fontWeight: FontWeight.bold,
    );
  }

  extraSmallTitleTextStyle({color}) {
    return TextStyle(
      fontSize: 12,
      color: color,
    );
  }

  xxLargeHeadingTextStyle({color}) {
    return TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w700,
      color: color,
    );
  }

  xLargeHeadingTextStyle({color}) {
    return TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  textField({controller, hintText, isObscure, prefixIcon, onChanged}) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: blueColor,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 53,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: blueColor,
              ),
            ),
            child: prefixIcon,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextFormField(
              controller: controller,
              onChanged: onChanged,
              style: const TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bigButton(
      {width,
      height,
      borderColor,
      onTap,
      borderWidth,
      borderRadius,
      containerColor,
      text,
      shadowColors,
      textColor,
      fontSize,
      fontWeight}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
              color: borderColor ?? Colors.transparent,
              width: borderWidth == null ? 2 : borderWidth.toDouble()),
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
          color: containerColor ?? Colors.white,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 0),
              color: shadowColors ?? Colors.black.withOpacity(0.2),
              blurRadius: 4,
            )
          ],
        ),
        child: Center(
          child: Text(
            text.toString(),
            style: TextStyle(
              color: textColor ?? Colors.black,
              fontSize: fontSize == null ? 13.0 : fontSize.toDouble(),
              fontWeight: fontWeight ?? FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  foodContainer(
      {context,
      image,
      foodImage,
      isFavourite,
      name,
      lastPrep,
      prepTime,
      onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 20),
        width: MediaQuery.of(context).size.width * 0.6,
        height: 220,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color: blueColor,
          ),
          image: DecorationImage(
            image: image,
            fit: BoxFit.cover,
          ),
        ),
        child: BlurryContainer(
          color: Colors.white.withOpacity(0.05),
          blur: 8,
          elevation: 6,
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.6,
                height: 110,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: foodImage,
                    fit: BoxFit.cover,
                  ),
                ),
                padding: const EdgeInsets.all(
                  10.0,
                ),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.favorite,
                      size: 20,
                      color: isFavourite ? Colors.red : Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    name,
                    style: mediumTitleBoldTextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Last Prepared",
                    style: smallTitleTextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    lastPrep,
                    style: smallTitleTextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Preparation Time",
                    style: smallTitleTextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    prepTime,
                    style: smallTitleTextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  fullFoodContainer(
      {context,
      image,
      foodImage,
      isFavourite,
      name,
      lastPrep,
      prepTime,
      onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color: blueColor,
          ),
          image: DecorationImage(
            image: image,
            fit: BoxFit.cover,
          ),
        ),
        child: BlurryContainer(
          color: Colors.white.withOpacity(0.05),
          blur: 8,
          elevation: 6,
          height: 120,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: foodImage,
                    fit: BoxFit.cover,
                  ),
                ),
                padding: const EdgeInsets.all(
                  10.0,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          name,
                          style: mediumTitleBoldTextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            color: backgroundColor,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.favorite,
                            size: 20,
                            color: isFavourite ? Colors.red : Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Last Prepared",
                          style: smallTitleTextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          lastPrep,
                          style: smallTitleTextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Preparation Time",
                          style: smallTitleTextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          prepTime,
                          style: smallTitleTextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
