part of 'microservices_screen.dart';

extension MicroserviceExtension on MicroservicePage {
  Widget _buildItemMicroservice({
    required String title,
    required String image,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: Container(
        height: 100,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: InkWell(
          onTap: onTap,
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              // borderRadius: BorderRadius.only(
              //   bottomRight: Radius.circular(20),
              // ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FCoreImage(
                    image,
                    height: 40,
                    width: 40,
                  ),
                  const SizedBox(height: 5),
                  RichText(
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      text: title,
                      style: AppTextStyle.heavy(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildListType({
    required String title,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            title,
            textAlign: TextAlign.left,
            style: AppTextStyle.heavy(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ),
        ...children,
      ],
    );
  }
}
