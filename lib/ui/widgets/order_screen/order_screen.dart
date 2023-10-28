// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intership_project/configuration/configuration.dart';
import 'package:intership_project/resources/resources.dart';
import 'package:intl/intl.dart';

import 'package:intership_project/ui/themes/app_colors.dart';
import 'package:intership_project/ui/themes/app_text_style.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
        ),
        backgroundColor: const Color(0xFFFBFBFB),
        elevation: 1,
        shadowColor: AppColors.gray5,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.black,
            size: 20,
          ),
        ),
        title: Text(
          'Ordering',
          style: AppTextStyle.header20SemiBold.copyWith(
            color: AppColors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const StepCounter(),
          CalendarWidget(),
          const SizedBox(height: 16),
          const Details(title: 'Sender details'),
          const SizedBox(height: 16),
          const Details(title: 'Recipient address'),
          const SizedBox(height: 16),
          const NextStepButtonWidget(),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class NextStepButtonWidget extends StatelessWidget {
  const NextStepButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      child: SizedBox(
        height: 52,
        child: Expanded(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              backgroundColor: AppColors.orange,
            ),
            child: Text(
              'Next step',
              style: AppTextStyle.text16Medium.copyWith(
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Details extends StatefulWidget {
  final String title;
  const Details({Key? key, required this.title}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  bool isAddAddressActive = true;
  bool isSelectAddressActive = false;

  void activateAddAddress() {
    setState(() {
      isAddAddressActive = true;
      isSelectAddressActive = false;
    });
  }

  void activateSelectAddress() {
    setState(() {
      isAddAddressActive = false;
      isSelectAddressActive = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isSender = widget.title == 'Sender details' ? true : false;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      child: ColoredBox(
        color: const Color(0xFFFFFFFF),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  '${widget.title}',
                  style: AppTextStyle.header16Bold
                      .copyWith(color: AppColors.black),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      activateAddAddress();
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(36),
                      ),
                      textStyle: AppTextStyle.text14Regular,
                      backgroundColor: isAddAddressActive
                          ? AppColors.orange
                          : AppColors.gray5,
                    ),
                    child: Text(
                      'Add address',
                      style: TextStyle(
                        color: isAddAddressActive
                            ? AppColors.white
                            : AppColors.gray2,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 7),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      activateSelectAddress();
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(36),
                      ),
                      textStyle: AppTextStyle.text14Regular,
                      backgroundColor: isSelectAddressActive
                          ? AppColors.orange
                          : AppColors.gray5,
                    ),
                    child: Text(
                      'Select address',
                      style: TextStyle(
                        color: isSelectAddressActive
                            ? AppColors.white
                            : AppColors.gray2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            if (isAddAddressActive) const AddAddressWidget(),
            if (isSelectAddressActive) SelectAddressWidget(isSender: isSender),
          ],
        ),
      ),
    );
  }
}

class AddAddressWidget extends StatefulWidget {
  const AddAddressWidget({Key? key}) : super(key: key);

  @override
  State<AddAddressWidget> createState() => _AddAddressWidgetState();
}

class _AddAddressWidgetState extends State<AddAddressWidget> {
  bool addressLine2 = false;
  String nameValue = '';
  String emailValue = '';
  String numberValue = '';
  String countryValue = '';
  String cityValue = '';
  String addressLine1Value = '';
  String addressLine2Value = '';
  String postcodeValue = '';
  bool isNameValid = true;
  bool isEmailValid = true;
  bool isPhoneValid = true;

  void validateNameInput(String value) {
    // Ваша логика проверки данных
    if (value.isEmpty || value.length >= 3) {
      setState(() {
        isNameValid = true;
      });
    } else {
      setState(() {
        isNameValid = false;
      });
    }
  }

  void validateEmailInput(String value) {
    // Ваша логика проверки данных
    RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
            .hasMatch(value)
        ? isEmailValid = true
        : isEmailValid = false;
    setState(() {});
  }

  void validatePhoneInpit(String value) {
    RegExp(r'(^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$)')
            .hasMatch(value)
        ? isPhoneValid = true
        : isPhoneValid = false;
    setState(() {});
  }

  void addAddressLine() {
    setState(() {
      addressLine2 = !addressLine2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Full name*',
              style: AppTextStyle.header14SemiBold.copyWith(
                color: const Color(0xFF323F4B),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        TextField(
          onChanged: (value) {
            validateNameInput(value);
            setState(() {
              nameValue = value;
            });
          },
          decoration: InputDecoration(
            errorText: isNameValid ? null : 'Name is too short',
            contentPadding: const EdgeInsets.all(12),
            prefixIcon: const Icon(
              Icons.person,
              size: 30,
              color: AppColors.gray1,
            ),
            hintText: 'Enter your full name',
            hintStyle: AppTextStyle.text14Regular.copyWith(
              color: AppColors.gray2,
            ),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(
                color: AppColors.gray3,
                width: 1.5,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.orange,
                width: 1.5,
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Text(
              'Email*',
              style: AppTextStyle.header14SemiBold.copyWith(
                color: AppColors.black,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        TextField(
          onChanged: (value) {
            validateEmailInput(value);
            setState(() {
              emailValue = value;
            });
          },
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            errorText: isEmailValid ? null : 'Please provide correct email',
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.orange,
                width: 1.5,
              ),
            ),
            contentPadding: const EdgeInsets.all(12),
            prefixIcon: const Icon(
              Icons.email,
              size: 30,
              color: AppColors.gray1,
            ),
            hintText: 'Enter your Email',
            hintStyle: AppTextStyle.text14Regular.copyWith(
              color: AppColors.gray2,
            ),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(
                color: AppColors.gray3,
                width: 1.5,
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Text(
              'Phone number*',
              style: AppTextStyle.header14SemiBold.copyWith(
                color: AppColors.black,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        TextField(
          onChanged: (value) {
            validatePhoneInpit(value);
            setState(() {
              numberValue = value;
            });
          },
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            errorText: isPhoneValid ? null : 'Please provide correct email',
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.orange,
                width: 1.5,
              ),
            ),
            contentPadding: const EdgeInsets.all(12),
            prefixIcon: const Icon(
              Icons.phone,
              size: 30,
              color: AppColors.gray1,
            ),
            hintText: 'Enter your phone number',
            hintStyle: AppTextStyle.text14Regular.copyWith(
              color: AppColors.gray2,
            ),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(
                color: AppColors.gray3,
                width: 1.5,
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        const Divider(
          thickness: 1.5,
          color: AppColors.gray5,
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Text(
              'Country*',
              style: AppTextStyle.header14SemiBold.copyWith(
                color: AppColors.black,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.orange,
                width: 1.5,
              ),
            ),
            contentPadding: const EdgeInsets.all(12),
            prefixIcon: const Icon(
              Icons.location_pin,
              size: 30,
              color: AppColors.gray1,
            ),
            hintText: 'Enter your country',
            hintStyle: AppTextStyle.text14Regular.copyWith(
              color: AppColors.gray2,
            ),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(
                color: AppColors.gray3,
                width: 1.5,
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Text(
              'City*',
              style: AppTextStyle.header14SemiBold.copyWith(
                color: AppColors.black,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.orange,
                width: 1.5,
              ),
            ),
            contentPadding: const EdgeInsets.all(12),
            prefixIcon: const Icon(
              Icons.location_city,
              size: 30,
              color: AppColors.gray1,
            ),
            hintText: 'Enter your city',
            hintStyle: AppTextStyle.text14Regular.copyWith(
              color: AppColors.gray2,
            ),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(
                color: AppColors.gray3,
                width: 1.5,
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Text(
              'Address line 1*',
              style: AppTextStyle.header14SemiBold.copyWith(
                color: AppColors.black,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.orange,
                width: 1.5,
              ),
            ),
            contentPadding: const EdgeInsets.all(12),
            prefixIcon: const Icon(
              Icons.push_pin,
              size: 30,
              color: AppColors.gray1,
            ),
            hintText: 'Enter your address line 1',
            hintStyle: AppTextStyle.text14Regular.copyWith(
              color: AppColors.gray2,
            ),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(
                color: AppColors.gray3,
                width: 1.5,
              ),
            ),
          ),
        ),
        addressLine2
            ? Column(
                children: [
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Text(
                        'Address line 2',
                        style: AppTextStyle.header14SemiBold.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.orange,
                          width: 1.5,
                        ),
                      ),
                      contentPadding: const EdgeInsets.all(12),
                      prefixIcon: const Icon(
                        Icons.push_pin,
                        size: 30,
                        color: AppColors.gray1,
                      ),
                      hintText: 'Enter your address line 2',
                      hintStyle: AppTextStyle.text14Regular.copyWith(
                        color: AppColors.gray2,
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        borderSide: BorderSide(
                          color: AppColors.gray3,
                          width: 1.5,
                        ),
                      ),
                    ),
                  )
                ],
              )
            : const SizedBox(height: 0),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
              onPressed: addAddressLine,
              child: Text(
                addressLine2 ? 'Remove address line -' : 'Add address line +',
                style: AppTextStyle.text16Medium.copyWith(
                  color: AppColors.orange,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Text(
              'Postcode*',
              style: AppTextStyle.header14SemiBold.copyWith(
                color: AppColors.black,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.orange,
                width: 1.5,
              ),
            ),
            contentPadding: const EdgeInsets.all(12),
            prefixIcon: const Icon(
              Icons.markunread_mailbox,
              size: 30,
              color: AppColors.gray1,
            ),
            hintText: 'Enter your postcode',
            hintStyle: AppTextStyle.text14Regular.copyWith(
              color: AppColors.gray2,
            ),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(
                color: AppColors.gray3,
                width: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SelectAddressWidget extends StatelessWidget {
  final bool isSender;
  const SelectAddressWidget({Key? key, required this.isSender})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final name =
        isSender ? Configuration.senderName : Configuration.recipientName;
    final country =
        isSender ? Configuration.senderCountry : Configuration.recipientCountry;
    final city =
        isSender ? Configuration.senderCity : Configuration.recipientCity;
    final address =
        isSender ? Configuration.senderStreet : Configuration.senderStreet;
    final postal = isSender
        ? Configuration.senderPostalCode
        : Configuration.recipientPostalCode;
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.orange,
                width: 1.5,
              ),
            ),
            contentPadding: const EdgeInsets.all(6),
            prefixIcon: const Icon(
              Icons.search,
              size: 25,
              color: AppColors.gray1,
            ),
            hintText: 'Search',
            hintStyle: AppTextStyle.text14Regular.copyWith(
              color: AppColors.gray2,
            ),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(
                color: AppColors.gray3,
                width: 1.5,
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(
              color: AppColors.gray3,
              width: 1.5,
            ),
            color: AppColors.black,
          ),
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$name',
                    style: AppTextStyle.header14SemiBold.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  Text(
                    '$country, $city, $address, $postal',
                    style: AppTextStyle.text14Regular.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  Images.iconsEdit,
                  width: 20,
                  height: 20,
                ),
                alignment: Alignment.topCenter,
              ),
            ],
          ),
        )
      ],
    );
  }
}

class CalendarWidget extends StatelessWidget {
  final ValueNotifier<DateTime?> _selectedDate = ValueNotifier(DateTime.now());
  CalendarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        child: SizedBox(
          height: 90,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    'Start date',
                    style: AppTextStyle.header14SemiBold.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              ValueListenableBuilder<DateTime?>(
                valueListenable: _selectedDate,
                builder: (context, value, child) {
                  return InkWell(
                    onTap: () async {
                      DateTime? date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2025),
                        currentDate: DateTime.now(),
                        initialEntryMode: DatePickerEntryMode.calendar,
                        initialDatePickerMode: DatePickerMode.day,
                        builder: (context, child) {
                          return Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: const ColorScheme.light(
                                primary: AppColors.black,
                                onSurface: AppColors.black,
                              ),
                            ),
                            child: child!,
                          );
                        },
                      );
                      _selectedDate.value = date;
                    },
                    child: ListTile(
                      visualDensity:
                          const VisualDensity(horizontal: -4, vertical: -4),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: const BorderSide(
                          color: AppColors.gray3,
                          width: 1.5,
                        ),
                      ),
                      leading: const Icon(
                        Icons.calendar_month,
                        color: AppColors.gray1,
                        size: 25,
                      ),
                      title: Text(value != null ? convertDate(value) : ''),
                      horizontalTitleGap: 0,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  String convertDate(DateTime dateTime) {
    return DateFormat('MMM dd, yyyy').format(dateTime);
  }
}

class StepCounter extends StatelessWidget {
  const StepCounter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 43,
      child: Center(
        child: Text(
          'Step 1',
          style: AppTextStyle.text16Regular,
        ),
      ),
    );
  }
}
