import 'package:flutter/material.dart';
import 'package:mockoapp/screens/app_router.dart';
import 'package:mockoapp/view_models/moco_view_model.dart';
import 'package:provider/provider.dart';

class MockoPage extends StatelessWidget {
  const MockoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mocko info'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, RouteName.file);
              },
              icon: const Icon(
                Icons.navigate_next,
                size: 40,
              ))
        ],
      ),
      body: Consumer<MockoViewModel>(builder: (context, mockoViewModel, child) {
        if (mockoViewModel.errorForUI.isNotEmpty) {
          return Center(
            child: Text(mockoViewModel.errorForUI),
          );
        }
        var datalist = mockoViewModel.mockoModel;
        return mockoViewModel.mockoModel != null
            ? Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: datalist!.fields.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(right: 20, left: 20, top: 15),
                      child: Container(
                        width: double.infinity,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 15, left: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(width: 15),
                              SizedBox(
                                width: 200,
                                child: Text(
                                  datalist.fields[index].code,
                                  style: const TextStyle(
                                    color: Colors.green,
                                    fontSize: 22,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 200,
                                child: Text(
                                  datalist.fields[index].caption,
                                  style: const TextStyle(
                                    color: Colors.blue,
                                    fontSize: 22,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 200,
                                child: Text(
                                  '${datalist.fields[index].sort}',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              );
      }),
    );
  }
}
