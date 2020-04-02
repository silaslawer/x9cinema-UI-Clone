import 'package:flutter/material.dart';
import 'package:x9cinema/utils/colors.dart';

class SelectChip extends StatefulWidget {
  final List<String> reportList;
  final Function(String) onSelectionChanged;

  SelectChip(this.reportList, {this.onSelectionChanged});

  @override
  _SelectChipState createState() => _SelectChipState();
}

class _SelectChipState extends State<SelectChip> {
  String selectedChoice = "";


  @override
  void initState() {
    super.initState();

    selectedChoice = widget.reportList[0];
  }

  _buildChoiceList1() {
    // List<Widget> choices = List();
    print("USER:::::${widget.reportList.length}");
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: widget.reportList == null ? 0 : widget.reportList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              selectedChoice = widget.reportList[index];
              widget.onSelectionChanged(selectedChoice);
            },
            child: Container(width: selectedChoice == widget.reportList[index] ? MediaQuery.of(context).size.width/3 : null,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: selectedChoice == widget.reportList[index]
                        ? Color(colorRed)
                        : Colors.transparent),
                padding: const EdgeInsets.all(15.0),
                child: Center(
                    child: Text(
                  widget.reportList[index],
                  style: TextStyle(
                      fontSize: 15,
                      color: selectedChoice == widget.reportList[index]
                          ? Color(colorWhite)
                          : Color(colorBlack),fontFamily: 'Proxima Nova',fontWeight: FontWeight.bold),
                ))),
          );
        });
    //return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: _buildChoiceList1(),
    );
  }
}
