import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:instadrunkapp/constants.dart';
import 'package:geolocator/geolocator.dart';

class LocationPicker extends StatefulWidget {
  final Function onChanged;

  LocationPicker({this.onChanged});

  @override
  _LocationPickerState createState() => _LocationPickerState();
}

class _LocationPickerState extends State<LocationPicker> {
  final addressTextController = TextEditingController();
  bool loading;

  _guessUserAddress() async {
    setState(() {
      loading = true;
    });

    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    final placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    final address =
        "${placemarks.first.street}, ${placemarks.first.subLocality}";

    addressTextController.text = address;
    widget.onChanged(address);

    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    loading = false;
  }

  @override
  void dispose() {
    addressTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: Container(
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  onChanged: widget.onChanged,
                  controller: addressTextController,
                  decoration: InputDecoration(
                      hintText: "Address",
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintStyle: TextStyle(color: kPrimaryColor)),
                ),
              ),
              loading
                  ? SizedBox(
                      child: CircularProgressIndicator(), width: 14, height: 14)
                  : GestureDetector(
                      child: Icon(Icons.location_on_outlined,
                          color: kPrimaryColor),
                      onTap: _guessUserAddress)
            ],
          ),
          margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, spreadRadius: 1.3, blurRadius: 1)
              ],
              borderRadius: BorderRadius.circular(20))),
    );
  }
}
