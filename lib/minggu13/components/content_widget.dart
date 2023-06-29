import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas_kelompok/minggu13/minggu13_provider.dart';

class ContentWidget extends StatelessWidget {
  const ContentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Minggu13Provider>(context);
    return Center(
      child: Container(
        child: prov.sedangProses
            ? Container()
            : prov.selesaiProses
                ? Tooltip(
                    message: 'Ayam Panggang',
                    child: Expanded(
                      child: Column(
                        children: [
                          Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras lacinia nulla quam, in consequat lacus sodales eu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Etiam vestibulum, lacus sit amet egestas finibus, arcu diam facilisis nisi, eget interdum est eros id leo. Sed ac orci vel ex ullamcorper euismod. Vestibulum rhoncus metus a sapien volutpat, sit amet maximus eros consequat. Aenean commodo risus neque, eget malesuada mi tincidunt sit amet. Mauris enim mauris, lobortis ut volutpat ut, placerat et eros. Nullam id consequat mauris, sed blandit diam. Duis commodo scelerisque nisl vel aliquet. Vestibulum maximus urna in leo elementum, vel elementum sapien tempor. Nam nisl dui, viverra commodo semper vel, dapibus vel augue. Suspendisse eleifend pretium dolor, a accumsan nulla commodo eget. Duis lobortis tempor turpis sed vehicula. Morbi vel augue nibh. Curabitur eu facilisis justo. Proin nec diam nisi. Donec consectetur suscipit nisl, in fringilla erat maximus ut. Praesent tincidunt tincidunt odio, non dignissim massa condimentum id. Proin venenatis vulputate mauris sit amet mattis. Donec eget neque vitae lorem varius pretium. Maecenas pretium consectetur dui, malesuada auctor elit posuere sit amet. Nunc blandit nisl sit amet lacus ullamcorper commodo. Pellentesque ultrices, quam ut euismod sodales, ex lectus hendrerit ante, at scelerisque odio enim ac neque. Nam bibendum ullamcorper magna, at sollicitudin tellus tempus vitae. Etiam lacinia, odio quis varius varius, mauris magna aliquet sapien, eu aliquam velit libero quis augue. Morbi id neque et velit pharetra blandit eget ac lacus. Donec in erat eu augue facilisis hendrerit. Maecenas ac lorem ac elit tristique pulvinar sit amet a risus. Maecenas tempor sem at rhoncus ultricies. Donec neque augue, fermentum eget nunc ut, faucibus rutrum ante. Quisque et ex id lorem posuere vulputate. Cras sed rhoncus mauris, quis vehicula arcu. Fusce sed ligula purus. In quis ipsum vitae diam ultrices blandit nec in lacus. Aliquam vel sagittis nisi. Proin dignissim nisi sed quam fermentum congue. Aliquam eget convallis erat. Nulla tempor iaculis arcu id suscipit. Nunc eu sagittis nunc. Aenean tempus eget leo non sodales. Donec vehicula nisl sed est faucibus consequat. Nunc suscipit eros id magna feugiat, at iaculis neque bibendum. Nunc dictum metus vel ex sollicitudin, vel iaculis arcu fringilla. Duis ornare semper dignissim. Donec vitae sem fermentum, blandit tortor rutrum, sollicitudin nisl. Morbi lacinia ex et dui aliquam, eu euismod libero suscipit. Phasellus nisi sapien, finibus nec dui quis, blandit commodo arcu. Ut porttitor mauris quis euismod vulputate. Nunc auctor fringilla diam quis ornare. Quisque congue, nibh non aliquam iaculis, velit nulla blandit est, eu varius risus velit nec nulla.",
                            textAlign: TextAlign.justify,
                            style: TextStyle(color: Colors.blue),
                          )
                        ],
                      ),
                    ))
                : Container(),
      ),
    );
  }
}
