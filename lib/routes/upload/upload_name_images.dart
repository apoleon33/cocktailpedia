import 'dart:convert';
import 'dart:io';

import 'package:cocktailpedia/util/cocktail.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:cocktailpedia/util/base_64_image.dart';

/// This is the first page, where the user will be able to tell his name (google account soon?), the name of the cocktail, and pics of the cocktail
class UploadPage extends StatefulWidget {
  const UploadPage({super.key});

  @override
  State<StatefulWidget> createState() => _UploadPageState();

  /// Smooth transition from bottom to top when clicking on the "Add" button.
  static Route createRoute() => PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const UploadPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          const curve = Curves.ease;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      );
}

class _UploadPageState extends State<UploadPage> {
  final Padding divider = const Padding(padding: EdgeInsets.all(16));

  String cocktailName = "";
  List<String>? images;
  String authorName = "";
  String description = "";

  void _getImages() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.image, allowMultiple: true);

    if (result != null) {
      List<File> files = result.paths.map((path) => File(path!)).toList();

      setState(() {
        images = files
            .map((File file) => base64Encode(file.readAsBytesSync()))
            .toList();
      });

      if (kDebugMode) print(images?.map((e) => e.decodeBase64Image()).toList());
    } else {
      // User canceled the picker
    }
  }

  void _changePage() {
    final Cocktail cocktail = Cocktail(
      name: cocktailName,
      ingredients: [],
      image: images!.map((e) => e.decodeBase64Image()).toList(),
      author: authorName,
      description: description,
    );
    print("description: ${cocktail.description}");

    // redirect to next page and send the cocktail
  }

  bool get _formIsCompleted =>
      authorName != "" && cocktailName != "" && images != null;

  void _removeImage(int index) async {
    setState(() {
      // use of "!" but it should be safe because of the condition
      images!.remove(images![index]);
    });
  }

  void _addImage(List<String> newImages) async {
    setState(() {
      images!.addAll(newImages);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text("New cocktail"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: FilledButton.tonal(
              onPressed: (_formIsCompleted) ? _changePage : null,
              child: const Text("next"),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              onChanged: (String value) {
                setState(() {
                  cocktailName = value;
                });
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Cocktail name',
              ),
            ),
            divider,
            ((images != null)
                ? SmallImageCarousel(
                    images!.map((e) => e.decodeBase64Image()).toList(),
                    onRemoveButtonPressed: (int index) async {
                      _removeImage(index);
                    },
                    onAddButtonPressed: (List<String> newImages) async {
                      _addImage(newImages);
                    },
                  )
                : Container(
                    height: 150,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondaryContainer,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "No images uploaded",
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            const Padding(padding: EdgeInsets.all(4)),
                            OutlinedButton.icon(
                              onPressed: _getImages,
                              icon: const Icon(Icons.upload),
                              label: const Text("Upload photos"),
                            ),
                          ],
                        )
                      ],
                    ),
                  )),
            divider,
            TextField(
              onChanged: (String value) {
                setState(() {
                  authorName = value;
                });
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Author',
              ),
            ),
            divider,
            TextField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              minLines: 2,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Description',
              ),
              onChanged: (String text) {
                setState(() {
                  description = text;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SmallImageCarousel extends StatefulWidget {
  final List<Image> images;
  final void Function(int index) onRemoveButtonPressed;
  final void Function(List<String>) onAddButtonPressed;

  const SmallImageCarousel(
    this.images, {
    super.key,
    required this.onRemoveButtonPressed,
    required this.onAddButtonPressed,
  });

  @override
  State<StatefulWidget> createState() => _SmallImageCarouselState();
}

class _SmallImageCarouselState extends State<SmallImageCarousel> {
  final BorderRadius borderRadius = BorderRadius.circular(16);
  final double imageHeight = 200;
  final double screenRatio = 0.5625; //9:16

  @override
  Widget build(BuildContext context) => SizedBox(
        height: imageHeight,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            ...widget.images.map(
              (e) => Padding(
                padding: const EdgeInsets.only(right: 8, left: 8),
                child: ClipRRect(
                  borderRadius: borderRadius,
                  child: Stack(
                    children: [
                      Container(
                        width: imageHeight * screenRatio,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: e.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: imageHeight * screenRatio,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox.shrink(),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: SizedBox(
                                width: 32.0,
                                height: 32.0,
                                child: IconButton.filledTonal(
                                  iconSize: 16.0,
                                  onPressed: () {
                                    widget.onRemoveButtonPressed(
                                        widget.images.indexOf(e));
                                  },
                                  icon: const Icon(Icons.remove),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8, left: 8),
              child: InkWell(
                onTap: () async {
                  FilePickerResult? result = await FilePicker.platform
                      .pickFiles(type: FileType.image, allowMultiple: true);

                  if (result != null) {
                    List<File> files =
                        result.paths.map((path) => File(path!)).toList();

                    setState(() {
                      widget.onAddButtonPressed(
                        files
                            .map((File file) =>
                                base64Encode(file.readAsBytesSync()))
                            .toList(),
                      );
                      // Probably an easier way to do
                      widget.images.addAll(files
                          .map((File file) =>
                              base64Encode(file.readAsBytesSync()))
                          .map((e) => e.decodeBase64Image())
                          .toList());
                    });
                  } else {
                    // User canceled the picker
                  }
                },
                borderRadius: borderRadius,
                child: Container(
                  width: imageHeight * screenRatio,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondaryContainer,
                    borderRadius: borderRadius,
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Icon(Icons.add), Text("Add")],
                  ),
                ),
              ),
            )
          ],
        ),
      );
}
