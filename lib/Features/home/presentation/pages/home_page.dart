import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_generator/Features/home/presentation/blocs/bloc/image_generator_bloc.dart';
import 'package:image_generator/injection_injectable_package.dart';

import '../../../../core/widgets/loading_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ImageGeneratorBloc imageGeneratorBloc = getIt<ImageGeneratorBloc>();

  TextEditingController textController = TextEditingController();

  GlobalKey<FormState> formState = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Generator"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: 360.w,
              height: 360.h,
              child: BlocBuilder<ImageGeneratorBloc, ImageGeneratorState>(
                bloc: imageGeneratorBloc,
                builder: (context, state) {
                  if (state.status == ImageGeneratorStatus.loaded) {
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          state.image.output[0],
                        ),
                      ),
                    );
                  } else if (state.status == ImageGeneratorStatus.loading) {
                    return const LoadingWidget();
                  } else if (state.status == ImageGeneratorStatus.error) {
                    return const Center(
                      child: Text("error"),
                    );
                  } else {
                    return const Center(
                      child: Text("Type below to generate an image"),
                    );
                  }
                },
              ),
            ),
            SizedBox(
              width: 330.w,
              child: Form(
                key: formState,
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Can not be empty";
                    }
                    return null;
                  },
                  controller: textController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      filled: true,
                      hintText: "A cat riding a dog walking through the snow",
                      hintStyle: TextStyle(
                          fontSize: 13.sp, fontWeight: FontWeight.w300)),
                ),
              ),
            ),
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              color: Theme.of(context).colorScheme.secondary,
              onPressed: () {
                if (formState.currentState!.validate()) {
                  imageGeneratorBloc.add(
                    GetImageEvent(text: textController.text),
                  );
                } else {
                  debugPrint("not valed");
                }
              },
              child: Text(
                "Generate",
                style: TextStyle(
                  fontSize: 16.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
