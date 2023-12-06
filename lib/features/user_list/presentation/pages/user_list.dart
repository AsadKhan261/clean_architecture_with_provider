
import 'package:clean_architecture_with_provider/core/utils/globals/globals.dart';
import 'package:clean_architecture_with_provider/features/user_list/presentation/manager/user_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserListView extends StatefulWidget {
  const UserListView({super.key});

  @override
  State<UserListView> createState() => _UserListViewState();
}




class _UserListViewState extends State<UserListView> {
  UserListProvider userListProvider = sl();
  @override
  initState() {
    super.initState();
    userListProvider.getUserList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: const Text('User List',style: TextStyle(
            color: Colors.black,
          ),),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: ChangeNotifierProvider.value(
          value: userListProvider,
          child: Consumer<UserListProvider>(builder: (_, provider, __) {
            if(provider.loadingUserList.value){
              return const Center(child: CircularProgressIndicator(),);
            }else{
             return SizedBox(
               height: MediaQuery.of(context).size.height/1.4,
               child: ListView.builder(
                   itemCount: provider.fakeApi!.entries.length,
                   itemBuilder: (context, i) {
                     return ListTile(
                       title: Text(provider.fakeApi!.entries[i].Auth),
                       subtitle: Text(provider.fakeApi!.entries[i].Category),
                     );
                   }),
             );
            }
          }),
        ));
  }
}
