import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_api/sicix_api/models/home/answer.dart';
import 'package:ui_api/sicix_api/models/home/poll.dart';
import 'package:ui_api/sicix_api/models/home/post_content.dart';

import '../../../../../resource/assets_constant/icon_constants.dart';
import '../../../../../shared/constants/colors.dart';
import '../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../shared/widgets/image_widget/fcore_image.dart';
import '../../../../../shared/widgets/widget_avatar.dart';

class HomePostPollsContentCell extends StatefulWidget {
  final PostContent content;
  final Function(int? postId, int? pollId, List<int>? anwers) onUpdatePoll;

  const HomePostPollsContentCell(
      {Key? key, required this.content, required this.onUpdatePoll})
      : super(key: key);

  @override
  State<HomePostPollsContentCell> createState() =>
      _HomePostPollsContentCellState();
}

class _HomePostPollsContentCellState extends State<HomePostPollsContentCell> {
  // List<Poll> polls = [];
  // bool isDone = false;

  @override
  void initState() {
    // polls = widget.content.task?.polls ?? [];
    // isDone =
    //     polls.any((poll) => poll.deadline?.isBefore(DateTime.now()) ?? false);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: (widget.content.task?.polls?.length ?? 0) + 1,
        separatorBuilder: (BuildContext context, int index) {
          if (index == (widget.content.task?.polls?.length ?? 0) - 1) {
            return Container();
          }
          return const Divider(height: 48);
        },
        itemBuilder: (BuildContext context, int index) {
          if (index == (widget.content.task?.polls?.length ?? 0)) {
            return _buildTotalVote();
          }
          return Container(
            // padding: const EdgeInsets.symmetric(horizontal: 24),
            child: _buildPoll(widget.content.task!.polls![index]),
          );
        },
      ),
    );
  }

  Widget _buildPoll(Poll poll) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: (poll.answers?.length ?? 0) + 1,
      separatorBuilder: (BuildContext context, int index) =>
          const SizedBox(height: 1),
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              poll.title ?? '',
              style: AppTextStyle.regular(),
            ),
          );
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAnswer(poll, poll.answers![index - 1]),
            _buildAnswerVote(poll, poll.answers![index - 1]),
          ],
        );
      },
    );
  }

  Widget _buildAnswer(Poll poll, Answer answer) {
    return InkWell(
      onTap: widget.content.isPollDone()
          ? null
          : () {
              setState(() {
                poll.updateVote(answer);
              });
              widget.onUpdatePoll(poll.refId, poll.id, poll.userAnswer);
            },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            widget.content.isPollDone()
                ? Container()
                : Container(
                    margin: const EdgeInsets.only(right: 16),
                    child: poll.isSeleted(answer)
                        ? FCoreImage(
                            poll.multiChoice == 0
                                ? IconConstants.icRadioOn
                                : IconConstants.icCheckboxOn,
                            width: 20,
                          )
                        : FCoreImage(
                            poll.multiChoice == 0
                                ? IconConstants.icRadioOff
                                : IconConstants.icCheckboxOff1,
                            width: 20,
                          ),
                  ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    width: 0.5,
                    color: AppColor.eightTextColorLight,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Container(
                        padding: const EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          children: [
                            Flexible(
                              flex: answer.count ?? 0,
                              child: Container(
                                color: AppColor.pollBackgroundColor,
                              ),
                            ),
                            Flexible(
                              flex: poll.getTotelVote() - (answer.count ?? 0),
                              child: Container(
                                color: AppColor.primaryBackgroundColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.all(8),
                      color: Colors.transparent,
                      child: Text(
                        answer.title ?? '',
                        style: AppTextStyle.regular(
                          color: AppColor.eightTextColorLight,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnswerVote(Poll poll, Answer answer) {
    return GestureDetector(
      onTap: () async {
        // TODO: missing api
        // await BottomSheetUtil.showBottomSheet(
        //   child: buildVotes(),
        // );
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(
            widget.content.isPollDone() ? 24 : 60, 0, 24, 12),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'home.poll.total.vote'.trArgs([(answer.count ?? 0).toString()]),
              style: AppTextStyle.regular(
                  fontSize: 14, color: AppColor.fourthTextColor),
            ),
            const SizedBox(width: 10),
            Text(
              answer.count == 0
                  ? '0%'
                  : '${((answer.count ?? 0) / poll.getTotelVote() * 100).toInt()}%',
              style: AppTextStyle.regular(
                  fontSize: 14, color: AppColor.fourthTextColor),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTotalVote() {
    return Container(
      margin: const EdgeInsets.fromLTRB(24, 0, 24, 0),
      child: Text(
        'home.poll.total.vote'.trArgs([widget.content.getTotelVote()]),
        style: AppTextStyle.regular(),
      ),
    );
  }

  Widget buildVotes() {
    return Container(
      height: 300,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Text(
                  'Lượt bình chọn',
                  style: AppTextStyle.heavy(),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: Get.back,
                    icon: FCoreImage(
                      IconConstants.iconClose,
                      color: AppColor.neutral1,
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, i) {
                // final item = controller.reactionCount.value.data![i];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  child: Row(
                    children: [
                      const WidgetAvatar(
                        size: 30,
                        isUrl: false,
                        name: '123123',
                        avatar: '',
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        '123123',
                        style: AppTextStyle.regular(fontSize: 18),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
