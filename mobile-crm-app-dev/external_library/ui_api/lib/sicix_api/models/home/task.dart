import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:sicix/shared/services/path_service.dart';

import '../common/reaction_model.dart';
import 'company_home.dart';
import 'group_home.dart';
import 'poll.dart';
import 'user.dart';
import 'viewers.dart';

part 'task.g.dart';

@JsonSerializable()
class Task {
  final DateTime? createDate;
  final DateTime? modifiedDate;
  final int? version;
  final int? status;
  final CompanyHome? companyId;
  final User? createBy;
  final User? updateBy;
  final int? id;
  @JsonKey(fromJson: _convertGroupHome)
  final int? groupId; // Bỏ đi vì danh sách trả về int, detail trả về object
  final int? workflowId;
  final int? activityId;
  final User? requestedBy;
  final String? name;
  String? description;
  final DateTime? startDate;
  final DateTime? deadline;
  final String? type;
  final bool? important;
  final bool? temp;
  final String? state;
  final int? parentId;
  final List<dynamic>? attachments;
  final bool? showMore;
  final bool? useDelegate;
  final bool? showTitle;
  final String? referenceUrl;
  final int? referenceId;
  final DateTime? publishDate;
  ReactionModel? reaction;
  final List<Poll>? polls;
  bool? follow;
  Viewers? viewers;
  String? commentCount;
  final List<String>? tags;

  @JsonKey(ignore: true)
  bool isMore = false;
  @JsonKey(ignore: true)
  final List<String> owerVideos = [];

  Task({
    this.createDate,
    this.modifiedDate,
    this.version,
    this.status,
    this.companyId,
    this.createBy,
    this.updateBy,
    this.id,
    this.groupId,
    this.workflowId,
    this.activityId,
    this.requestedBy,
    this.name,
    this.description,
    this.startDate,
    this.deadline,
    this.type,
    this.important,
    this.temp,
    this.state,
    this.parentId,
    this.attachments,
    this.showMore,
    this.useDelegate,
    this.showTitle,
    this.referenceUrl,
    this.referenceId,
    this.publishDate,
    this.reaction,
    this.polls,
    this.follow,
    this.viewers,
    this.commentCount,
    this.tags,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    final task = _$TaskFromJson(json);
    // if (Platform.isIOS) {
    //   task.description = task.description?.replaceAll('<video',
    //       '<iframe  controls preload=\"none\" allowfullscreen="" controls="controls" autoplay="false" frameborder="0" scrolling="no"');
    //   task.description = task.description?.replaceAll('</video>', '</iframe>');
    // }

    final exp = RegExp(r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+');
    final matches = exp.allMatches(task.description ?? '');

    matches.forEach((match) {
      final link = task.description?.substring(match.start, match.end) ?? '';
      if (link.contains(PathService.storagePath)) {
        task.owerVideos.add(link);
      }
    });

    task.description = task.description?.replaceAll('\n', '');
    task.description = task.description?.replaceAll('<br>', '');

    // Bỏ fix chiều cao của thẻ div
    task.description = task.description?.replaceAllMapped(
      RegExp(r'(<div[^>]+)(height:)', caseSensitive: false),
      (match) => '${match.group(1)}_${match.group(1)}',
    );
    return task;
  }

  Map<String, dynamic> toJson() => _$TaskToJson(this);

  int getTotelVote() {
    return polls?.fold(
            0,
            (previousValue, poll) =>
                (previousValue ?? 0) + poll.getTotelVote()) ??
        0;
  }

  // Đánh dấu đã đọc với data local và trả về true/fasle có tăng hay không
  bool increaseViewer() {
    if (viewers == null) {
      viewers = Viewers(view: 1, hasView: true);
      return true;
    } else if (!(viewers?.hasView ?? false)) {
      viewers!.hasView = true;
      viewers!.view = viewers!.view == null ? 1 : (viewers!.view! + 1);
      return true;
    }
    return false;
  }

  String getDescription(bool isMax) {
    if (isMax) {
      final summary = getSummary();
      return parse(summary).outerHtml;
    }

    printInfo(info: owerVideos.toString());

    return description ?? '';
  }

  String getSummary() {
    return convertHtmlContent(description ?? '', 200);
  }

  String convertHtmlContent(String contentHtml, int max) {
    final summary = StringBuffer();
    final content = StringBuffer();

    final doc = parse(contentHtml);
    final tags = doc.body?.children ?? [];
    if (tags.isEmpty) {
      if (contentHtml.length > max) {
        isMore = true;
        return '<p>${contentHtml.substring(0, max)}...</p>';
      }
      return '<p>$contentHtml</p>';
    } else {
      for (final tag in tags) {
        if (tag.text.length > max) {
          summary.write(convertHtmlContent(tag.innerHtml, max));
          isMore = true;
          return summary.toString();
        } else {
          summary.write(tag.outerHtml);
          content.write(tag.text);
          max = max - tag.text.length;
        }
      }
    }

    return summary.toString();
  }
}

int? _convertGroupHome(dynamic group) {
  if (group == null) {
    return null;
  } else if (group is int) {
    return group;
  } else if (group is Map<String, dynamic>) {
    try {
      final groupHome = GroupHome.fromJson(group);
      return groupHome.id;
    } catch (e) {
      debugPrint('Post task convert group ${e.toString()}');
    }
  }
  return null;
}
