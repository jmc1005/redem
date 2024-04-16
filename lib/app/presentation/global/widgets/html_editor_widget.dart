import 'package:flutter/material.dart';
import 'package:quill_html_editor/quill_html_editor.dart';

import '../../../config/colors/app_colors.dart';

class HtmlEditorWidget extends StatefulWidget {
  const HtmlEditorWidget({
    super.key,
    required this.onTextChanged,
    required this.content,
    this.onFocusChanged,
  });

  final dynamic Function(String)? onTextChanged;
  final dynamic Function(bool)? onFocusChanged;
  final String content;

  @override
  State<HtmlEditorWidget> createState() => _HtmlEditorWidgetState();
}

class _HtmlEditorWidgetState extends State<HtmlEditorWidget> {
  late QuillEditorController controller;

  final customToolBarList = [
    ToolBarStyle.bold,
    ToolBarStyle.italic,
    ToolBarStyle.align,
    ToolBarStyle.color,
    ToolBarStyle.background,
    ToolBarStyle.listBullet,
    ToolBarStyle.listOrdered,
    ToolBarStyle.clean,
    ToolBarStyle.addTable,
    ToolBarStyle.editTable,
    ToolBarStyle.link,
    ToolBarStyle.redo,
    ToolBarStyle.undo,
    ToolBarStyle.underline,
  ];

  final _toolbarColor = Colors.grey.shade200;
  final _backgroundColor = Colors.white70;
  final _toolbarIconColor = Colors.black87;
  final _editorTextStyle = const TextStyle(
      fontSize: 18,
      color: Colors.black,
      fontWeight: FontWeight.normal,
      fontFamily: 'Roboto');
  final _hintTextStyle = const TextStyle(
    fontSize: 18,
    color: Colors.black38,
    fontWeight: FontWeight.normal,
  );

  bool _hasFocus = false;

  @override
  void initState() {
    controller = QuillEditorController();
    controller.onTextChanged((text) {
      debugPrint('listening to $text');
    });
    controller.onEditorLoaded(() {
      debugPrint('Editor Loaded :)');
    });

    super.initState();
  }

  @override
  void dispose() {
    /// please do not forget to dispose the controller
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    setHtmlText(widget.content);

    return SafeArea(
      child: SizedBox(
        height: 250,
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: const Color(0xFFE5E7EB),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              ToolBar(
                toolBarColor: _toolbarColor,
                padding: const EdgeInsets.all(8),
                iconSize: 20,
                iconColor: _toolbarIconColor,
                activeIconColor: Colors.greenAccent.shade400,
                controller: controller,
                toolBarConfig: customToolBarList,
              ),
              Expanded(
                child: QuillHtmlEditor(
                  hintText: 'Hint text goes here',
                  controller: controller,
                  minHeight: 500,
                  textStyle: _editorTextStyle,
                  hintTextStyle: _hintTextStyle,
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  hintTextPadding: const EdgeInsets.only(left: 20),
                  backgroundColor: _backgroundColor,
                  onEditingComplete: (s) => debugPrint('Editing completed $s'),
                  loadingBuilder: (context) {
                    return const Center(
                        child: CircularProgressIndicator(
                      strokeWidth: 1,
                      color: AppColors.secondary,
                    ));
                  },
                  onFocusChanged: (hasFocus) {
                    setState(() {});
                  },
                  onTextChanged: widget.onTextChanged,
                  onEditorCreated: () {
                    debugPrint('Editor has been loaded');
                    setHtmlText(widget.content);
                  },
                  onEditorResized: (height) =>
                      debugPrint('Editor resized $height'),
                  onSelectionChanged: (sel) =>
                      debugPrint('index ${sel.index}, range ${sel.length}'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getHtmlText() async {
    final String htmlText = await controller.getText();
    debugPrint(htmlText);
  }

  Future<void> setHtmlText(String text) async {
    await controller.setText(text);
  }

  Future<void> insertNetworkImage(String url) async {
    await controller.embedImage(url);
  }

  Future<void> insertVideoURL(String url) async {
    await controller.embedVideo(url);
  }

  Future<void> insertHtmlText(String text, {int? index}) async {
    await controller.insertText(text, index: index);
  }

  void clearEditor() => controller.clear();

  void enableEditor(bool enable) => controller.enableEditor(enable);

  void unFocusEditor() => controller.unFocus();
}
