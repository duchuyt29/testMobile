import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../../shared/styles/text_style/text_style.dart';
import '../../../../resource/assets_constant/images_constants.dart';
import '../../../../shared/widgets/image_widget/fcore_image.dart';
import '../controllers/profile_controller.dart';

class ProfilePage extends GetView<ProfileController> {
  ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        title: Text(
          'workplace.workgroup.profile'.tr,
          style: AppTextStyle.heavy(fontSize: 24),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(top: 3, left: 2),
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              GestureDetector(
                onTap: Get.back,
                child: FCoreImage(
                  ImageConstants.workplaceWorkgroupcLogo,
                  width: 40,
                  height: 40,
                ),
              ), //Positioned
              const Positioned(
                top: 0,
                right: 0,
                left: 20,
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  child: Text('5+'),
                ), //CircularAvatar
              ), //Positioned
            ], //<Widget>[]
          ),
        ), //Stac
      ),
      body: SafeArea(
        bottom: false,
        child: _buildBodyContent(),
      ),
    );
  }

  Widget _buildBodyContent() {
    return DefaultTabController(
      length: 2,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 230,
            backgroundColor: Colors.white,
            title: Column(
              children: [
                FCoreImage(
                  ImageConstants.avatar,
                  height: 120,
                  width: 120,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text('Nguyễn Văn A', style: AppTextStyle.bold(fontSize: 18)),
                Text('ID1143643584'.tr,
                    style:
                        AppTextStyle.regular(color: const Color(0xff8F9BB3))),
                Text('Chuyên gia lập trình'.tr,
                    style:
                        AppTextStyle.regular(color: const Color(0xff8F9BB3))),
                Text('Khối sản xuất số 1'.tr,
                    style:
                        AppTextStyle.regular(color: const Color(0xff8F9BB3))),
              ],
            ),
            bottom: TabBar(
              indicatorColor: Colors.purple,
              indicatorWeight: 5,
              labelStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              labelColor: const Color(0xff493083),
              tabs: [
                Tab(
                  text: 'workplace.workgroup.individual'.tr,
                ),
                Tab(
                  text: 'workplace.workgroup.peronnel'.tr,
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      _buildInforPeronal(),
                      _buildIdentification(),
                      _buildHousehold(),
                      _buildCurrentAddress(),
                      _buildSocial(),
                      _buildInforRelave(),
                      _buildSocialPolitics(),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      _buildInforEmployee(),
                      _buildBankAccount(),
                      _buildTaxInfor(),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInforPeronal() {
    return Column(children: [
      Row(
        children: [
          Text(
            'Thông tin cá nhân',
            style: AppTextStyle.regular(
                color: const Color(0xff493083), fontSize: 18),
          ),
        ],
      ),
      Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'workplace.workgroup.fullname'.tr,
              style: AppTextStyle.regular(
                color: const Color(0xff858C94),
              ),
            ),
            Text(
              'Nguyễn Văn A',
              style: AppTextStyle.regular(),
            ),
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'workplace.workgroup.dateOfBirth'.tr,
              style: AppTextStyle.regular(
                color: const Color(0xff858C94),
              ),
            ),
            Text(
              '11/11/2022',
              style: AppTextStyle.regular(),
            ),
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'workplace.workgroup.gender'.tr,
              style: AppTextStyle.regular(
                color: const Color(0xff858C94),
              ),
            ),
            Text(
              'Nam',
              style: AppTextStyle.regular(),
            ),
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'workplace.workgroup.phoneNumber'.tr,
              style: AppTextStyle.regular(
                color: const Color(0xff858C94),
              ),
            ),
            Text(
              '0987654321',
              style: AppTextStyle.regular(),
            ),
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'workplace.workgroup.married'.tr,
              style: AppTextStyle.regular(
                color: const Color(0xff858C94),
              ),
            ),
            Text(
              'Độc thân',
              style: AppTextStyle.regular(),
            ),
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.only(top: 5, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'workplace.workgroup.email'.tr,
              style: AppTextStyle.regular(
                color: const Color(0xff858C94),
              ),
            ),
            Text(
              'hahahah@gmail.com',
              style: AppTextStyle.regular(),
            ),
          ],
        ),
      ),
      Container(
        height: 10,
        color: Color.fromARGB(255, 231, 231, 231),
      )
    ]);
  }

  Widget _buildIdentification() {
    return Column(children: [
      Container(
        padding: const EdgeInsets.only(top: 20, bottom: 5),
        child: Row(
          children: [
            Text(
              'Giấy tờ tùy thân',
              style: AppTextStyle.regular(
                  color: const Color(0xff493083), fontSize: 18),
            ),
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'workplace.workgroup.kindOfPaper'.tr,
              style: AppTextStyle.regular(
                color: const Color(0xff858C94),
              ),
            ),
            Text(
              'CCCD',
              style: AppTextStyle.regular(),
            ),
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'workplace.workgroup.dateRanger'.tr,
              style: AppTextStyle.regular(
                color: const Color(0xff858C94),
              ),
            ),
            Text(
              '11/11/2022',
              style: AppTextStyle.regular(),
            ),
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'workplace.workgroup.numberOfPaper'.tr,
              style: AppTextStyle.regular(
                color: const Color(0xff858C94),
              ),
            ),
            Text(
              '14164647373',
              style: AppTextStyle.regular(),
            ),
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'workplace.workgroup.placeRanger'.tr,
              style: AppTextStyle.regular(
                color: const Color(0xff858C94),
              ),
            ),
            Text(
              'HN',
              style: AppTextStyle.regular(),
            ),
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.only(top: 5, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'workplace.workgroup.note'.tr,
              style: AppTextStyle.regular(
                color: const Color(0xff858C94),
              ),
            ),
            Text(
              '',
              style: AppTextStyle.regular(),
            ),
          ],
        ),
      ),
      Container(
        height: 10,
        color: Color.fromARGB(255, 231, 231, 231),
      )
    ]);
  }

  Widget _buildHousehold() {
    return Column(children: [
      Container(
        padding: const EdgeInsets.only(top: 20, bottom: 5),
        child: Row(
          children: [
            Text(
              'Hộ khẩu thường trú',
              style: AppTextStyle.regular(
                  color: const Color(0xff493083), fontSize: 18),
            ),
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'workplace.workgroup.city'.tr,
              style: AppTextStyle.regular(
                color: const Color(0xff858C94),
              ),
            ),
            Text(
              'HN',
              style: AppTextStyle.regular(),
            ),
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'workplace.workgroup.distric'.tr,
              style: AppTextStyle.regular(
                color: const Color(0xff858C94),
              ),
            ),
            Text(
              'Xuân Phương',
              style: AppTextStyle.regular(),
            ),
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'workplace.workgroup.ward'.tr,
              style: AppTextStyle.regular(
                color: const Color(0xff858C94),
              ),
            ),
            Text(
              'Di Ái',
              style: AppTextStyle.regular(),
            ),
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.only(top: 5, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'workplace.workgroup.street'.tr,
              style: AppTextStyle.regular(
                color: const Color(0xff858C94),
              ),
            ),
            Text(
              '',
              style: AppTextStyle.regular(),
            ),
          ],
        ),
      ),
      Container(
        height: 10,
        color: Color.fromARGB(255, 231, 231, 231),
      )
    ]);
  }

  Widget _buildCurrentAddress() {
    return Column(children: [
      Container(
        padding: const EdgeInsets.only(top: 20, bottom: 5),
        child: Row(
          children: [
            Text(
              'Hộ khẩu thường trú',
              style: AppTextStyle.regular(
                  color: const Color(0xff493083), fontSize: 18),
            ),
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'workplace.workgroup.city'.tr,
              style: AppTextStyle.regular(
                color: const Color(0xff858C94),
              ),
            ),
            Text(
              'HN',
              style: AppTextStyle.regular(),
            ),
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'workplace.workgroup.distric'.tr,
              style: AppTextStyle.regular(
                color: const Color(0xff858C94),
              ),
            ),
            Text(
              'Xuân Phương',
              style: AppTextStyle.regular(),
            ),
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'workplace.workgroup.ward'.tr,
              style: AppTextStyle.regular(
                color: const Color(0xff858C94),
              ),
            ),
            Text(
              'Di Ái',
              style: AppTextStyle.regular(),
            ),
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.only(top: 5, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'workplace.workgroup.street'.tr,
              style: AppTextStyle.regular(
                color: const Color(0xff858C94),
              ),
            ),
            Text(
              '',
              style: AppTextStyle.regular(),
            ),
          ],
        ),
      ),
      Container(
        height: 10,
        color: Color.fromARGB(255, 231, 231, 231),
      )
    ]);
  }

  Widget _buildSocial() {
    return Column(children: [
      Container(
        padding: const EdgeInsets.only(top: 20, bottom: 5),
        child: Row(
          children: [
            Text(
              'Mạng xẫ hội',
              style: AppTextStyle.regular(
                  color: const Color(0xff493083), fontSize: 18),
            ),
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'workplace.workgroup.social'.tr,
              style: AppTextStyle.regular(
                color: const Color(0xff858C94),
              ),
            ),
            Text(
              'Nguyễn Văn A',
              style: AppTextStyle.regular(),
            ),
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.only(top: 5, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'workplace.workgroup.link'.tr,
              style: AppTextStyle.regular(
                color: const Color(0xff858C94),
              ),
            ),
            Text(
              '',
              style: AppTextStyle.regular(),
            ),
          ],
        ),
      ),
      Container(
        height: 10,
        color: Color.fromARGB(255, 231, 231, 231),
      )
    ]);
  }

  Widget _buildInforRelave() {
    return Column(children: [
      Container(
        padding: const EdgeInsets.only(top: 20, bottom: 5),
        child: Row(
          children: [
            Text(
              'Thông tin nhân thân',
              style: AppTextStyle.regular(
                  color: const Color(0xff493083), fontSize: 18),
            ),
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'workplace.workgroup.relationship'.tr,
              style: AppTextStyle.regular(
                color: const Color(0xff858C94),
              ),
            ),
            Text(
              'Vợ',
              style: AppTextStyle.regular(),
            ),
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'workplace.workgroup.fullname'.tr,
              style: AppTextStyle.regular(
                color: const Color(0xff858C94),
              ),
            ),
            Text(
              'ABC',
              style: AppTextStyle.regular(),
            ),
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'workplace.workgroup.gender'.tr,
              style: AppTextStyle.regular(
                color: const Color(0xff858C94),
              ),
            ),
            Text(
              'Nam',
              style: AppTextStyle.regular(),
            ),
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'workplace.workgroup.year'.tr,
              style: AppTextStyle.regular(
                color: const Color(0xff858C94),
              ),
            ),
            Text(
              '2009',
              style: AppTextStyle.regular(),
            ),
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'workplace.workgroup.phoneNumber'.tr,
              style: AppTextStyle.regular(
                color: const Color(0xff858C94),
              ),
            ),
            Text(
              '0987654321',
              style: AppTextStyle.regular(),
            ),
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.only(top: 5, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'workplace.workgroup.address'.tr,
              style: AppTextStyle.regular(
                color: const Color(0xff858C94),
              ),
            ),
            Text(
              '',
              style: AppTextStyle.regular(),
            ),
          ],
        ),
      ),
      Container(
        height: 10,
        color: Color.fromARGB(255, 231, 231, 231),
      )
    ]);
  }

  Widget _buildSocialPolitics() {
    return Column(children: [
      Container(
        padding: const EdgeInsets.only(top: 20, bottom: 5),
        child: Row(
          children: [
            Text(
              'Thông tin chính trị - Xã hội',
              style: AppTextStyle.regular(
                  color: const Color(0xff493083), fontSize: 18),
            ),
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'workplace.workgroup.nationality'.tr,
              style: AppTextStyle.regular(
                color: const Color(0xff858C94),
              ),
            ),
            Text(
              'VN',
              style: AppTextStyle.regular(),
            ),
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'workplace.workgroup.nation'.tr,
              style: AppTextStyle.regular(
                color: const Color(0xff858C94),
              ),
            ),
            Text(
              'Kinh',
              style: AppTextStyle.regular(),
            ),
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'workplace.workgroup.religion'.tr,
              style: AppTextStyle.regular(
                color: const Color(0xff858C94),
              ),
            ),
            Text(
              '',
              style: AppTextStyle.regular(),
            ),
          ],
        ),
      ),
    ]);
  }

  Widget _buildInforEmployee() {
    return Column(children: [
      Row(
        children: [
          Text(
            'Thông tin nhân sự',
            style: AppTextStyle.regular(
                color: const Color(0xff493083), fontSize: 18),
          ),
        ],
      ),
      Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'workplace.workgroup.employeeCode'.tr,
              style: AppTextStyle.regular(
                color: const Color(0xff858C94),
              ),
            ),
            Text(
              'ID325',
              style: AppTextStyle.regular(),
            ),
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'workplace.workgroup.employeeEmail'.tr,
              style: AppTextStyle.regular(
                color: const Color(0xff858C94),
              ),
            ),
            Text(
              'hhhh@gmail.com',
              style: AppTextStyle.regular(),
            ),
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'workplace.workgroup.headOfDepartman'.tr,
              style: AppTextStyle.regular(
                color: const Color(0xff858C94),
              ),
            ),
            Text(
              'NAM',
              style: AppTextStyle.regular(),
            ),
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'workplace.workgroup.status'.tr,
              style: AppTextStyle.regular(
                color: const Color(0xff858C94),
              ),
            ),
            Text(
              'Chính thức',
              style: AppTextStyle.regular(),
            ),
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'workplace.workgroup.unit'.tr,
              style: AppTextStyle.regular(
                color: const Color(0xff858C94),
              ),
            ),
            Text(
              'Khối 2',
              style: AppTextStyle.regular(),
            ),
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'workplace.workgroup.location'.tr,
              style: AppTextStyle.regular(
                color: const Color(0xff858C94),
              ),
            ),
            Text(
              'Nhân viên',
              style: AppTextStyle.regular(),
            ),
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'workplace.workgroup.title'.tr,
              style: AppTextStyle.regular(
                color: const Color(0xff858C94),
              ),
            ),
            Text(
              'Nhân viên lập trình',
              style: AppTextStyle.regular(),
            ),
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'workplace.workgroup.rank'.tr,
              style: AppTextStyle.regular(
                color: const Color(0xff858C94),
              ),
            ),
            Text(
              '',
              style: AppTextStyle.regular(),
            ),
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'workplace.workgroup.dateJoin'.tr,
              style: AppTextStyle.regular(
                color: const Color(0xff858C94),
              ),
            ),
            Text(
              '11/11/111',
              style: AppTextStyle.regular(),
            ),
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'workplace.workgroup.endProbation'.tr,
              style: AppTextStyle.regular(
                color: const Color(0xff858C94),
              ),
            ),
            Text(
              '22/22/222',
              style: AppTextStyle.regular(),
            ),
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.only(top: 5, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'workplace.workgroup.dateOut'.tr,
              style: AppTextStyle.regular(
                color: const Color(0xff858C94),
              ),
            ),
            Text(
              '',
              style: AppTextStyle.regular(),
            ),
          ],
        ),
      ),
      Container(
        height: 10,
        color: Color.fromARGB(255, 231, 231, 231),
      )
    ]);
  }

  Widget _buildBankAccount() {
    return Column(children: [
      Container(
        padding: const EdgeInsets.only(top: 20, bottom: 5),
        child: Row(
          children: [
            Text(
              'Tài khoản ngân hàng',
              style: AppTextStyle.regular(
                  color: const Color(0xff493083), fontSize: 18),
            ),
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'workplace.workgroup.numberBank'.tr,
              style: AppTextStyle.regular(
                color: const Color(0xff858C94),
              ),
            ),
            Text(
              '123456789',
              style: AppTextStyle.regular(),
            ),
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'workplace.workgroup.branch'.tr,
              style: AppTextStyle.regular(
                color: const Color(0xff858C94),
              ),
            ),
            Text(
              'HN2',
              style: AppTextStyle.regular(),
            ),
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.only(top: 5, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'workplace.workgroup.bank'.tr,
              style: AppTextStyle.regular(
                color: const Color(0xff858C94),
              ),
            ),
            Text(
              '',
              style: AppTextStyle.regular(),
            ),
          ],
        ),
      ),
      Container(
        height: 10,
        color: Color.fromARGB(255, 231, 231, 231),
      )
    ]);
  }

  Widget _buildTaxInfor() {
    return Column(children: [
      Container(
        padding: const EdgeInsets.only(top: 20, bottom: 5),
        child: Row(
          children: [
            Text(
              'Thông tin thuế',
              style: AppTextStyle.regular(
                  color: const Color(0xff493083), fontSize: 18),
            ),
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'workplace.workgroup.taxCode'.tr,
              style: AppTextStyle.regular(
                color: const Color(0xff858C94),
              ),
            ),
            Text(
              '123456789',
              style: AppTextStyle.regular(),
            ),
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.only(top: 5, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'workplace.workgroup.dateRanger'.tr,
              style: AppTextStyle.regular(
                color: const Color(0xff858C94),
              ),
            ),
            Text(
              '',
              style: AppTextStyle.regular(),
            ),
          ],
        ),
      ),
    ]);
  }
}
