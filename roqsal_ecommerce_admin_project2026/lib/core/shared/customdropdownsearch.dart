import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';

class CustomDropdownSearch extends StatefulWidget {
  final String? title;
  final List<SelectedListItem> listdata;
  final TextEditingController dropdownSelectedName;
  final TextEditingController dropdownSelectedId;

  const CustomDropdownSearch(
      {super.key,
      this.title,
      required this.listdata,
      required this.dropdownSelectedName,
      required this.dropdownSelectedId});

  @override
  State<CustomDropdownSearch> createState() => _CustomDropdownSearchState();
}

class _CustomDropdownSearchState extends State<CustomDropdownSearch> {
  void showDropDownSearch(context) {
    DropDownState(
      DropDown(
        bottomSheetTitle: Text(
          widget.title!,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        submitButtonChild: const Text(
          'Done',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        data: widget.listdata ?? [],
        selectedItems: (List<dynamic> selectedList) {
          SelectedListItem selectedListItem = selectedList[0];
          widget.dropdownSelectedName.text = selectedListItem.name;
          widget.dropdownSelectedId.text = selectedListItem.value!;
          print(
              "============================== Start Selected Item ======================");
          print(widget.dropdownSelectedName.text);
          print(widget.dropdownSelectedId.text);
          print(
              "============================== End Selected Item ======================");
          /*List<String> list = [];
          for(var item in selectedList) {
            if(item is SelectedListItem) {
              list.add(item.name);
            }
          }


          showSnackBar(list.toString());*/
        },
        // enableMultipleSelection: true,
      ),
    ).showModal(context);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.dropdownSelectedName,
      cursorColor: Colors.black,
      //----------------------- Orginal -------------------------
      onTap: () //widget.isCitySelected()
          // ? () {
          {
        FocusScope.of(context).unfocus();
        // onTextFieldTap(){
        showDropDownSearch(context);
        //controller.showDropDownList(context);
      },
      //: null,
      decoration: InputDecoration(
          hintText: widget.dropdownSelectedName.text.isEmpty
              ? widget.title
              : widget.dropdownSelectedName.text,
          hintStyle: const TextStyle(fontSize: 14),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding:
          const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
          label: Container(
              margin: const EdgeInsets.symmetric(horizontal: 9),
              child: Text(widget.dropdownSelectedName.text.isEmpty
                  ? widget.title!
                  : widget.dropdownSelectedName.text!)),
          suffixIcon: InkWell(child: Icon(Icons.arrow_drop_down), onTap: (){}),
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
     /* decoration: InputDecoration(
        filled: true,
        fillColor: Colors.black12,
        contentPadding:
            const EdgeInsets.only(left: 8, bottom: 0, top: 0, right: 15),
        hintText: widget.dropdownSelectedName.text.isEmpty
            ? widget.title
            : widget.dropdownSelectedName.text,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
      ),*/
    );
  }
}
