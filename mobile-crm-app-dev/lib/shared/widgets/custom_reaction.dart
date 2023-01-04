import 'package:flutter/material.dart';
import 'package:ui_api/sicix_api/models/common/reaction_model.dart';

class Reactions {
  Reactions({
    required this.type,
    required this.avatarUrl,
  });

  final String type;
  final String avatarUrl;
}

class FacePile extends StatefulWidget {
  FacePile({
    Key? key,
    this.contents,
    this.faceSize = 20,
    this.facePercentOverlap = 0.5,
  }) : super(key: key);

  final ReactionModel? contents;

  final double faceSize;
  final double facePercentOverlap;

  @override
  FacePileState createState() => FacePileState();
}

class FacePileState extends State<FacePile>
    with SingleTickerProviderStateMixin {
  final _visibleUsers = <Reactions>[];
  var users = <Reactions>[];

  void addReaction() {
    users = [];
    if (widget.contents != null) {
      if (widget.contents?.angry != null && widget.contents?.angry != 0) {
        users.add(Reactions(
            type: Reaction.angry.key, avatarUrl: Reaction.angry.avatarUrl));
      }
      if (widget.contents?.care != null && widget.contents?.care != 0) {
        users.add(Reactions(
            type: Reaction.care.key, avatarUrl: Reaction.care.avatarUrl));
      }
      if (widget.contents?.haha != null && widget.contents?.haha != 0) {
        users.add(Reactions(
            type: Reaction.haha.key, avatarUrl: Reaction.haha.avatarUrl));
      }
      if (widget.contents?.like != null && widget.contents?.like != 0) {
        users.add(Reactions(
            type: Reaction.like.key, avatarUrl: Reaction.like.avatarUrl));
      }
      if (widget.contents?.love != null && widget.contents?.love != 0) {
        users.add(Reactions(
            type: Reaction.love.key, avatarUrl: Reaction.love.avatarUrl));
      }
      if (widget.contents?.sad != null && widget.contents?.sad != 0) {
        users.add(Reactions(
            type: Reaction.sad.key, avatarUrl: Reaction.sad.avatarUrl));
      }
      if (widget.contents?.wow != null && widget.contents?.wow != 0) {
        users.add(Reactions(
            type: Reaction.wow.key, avatarUrl: Reaction.wow.avatarUrl));
      }
    }
  }

  void reloadReaction() {
    addReaction();
    _syncUsersWithPile();
  }

  @override
  void initState() {
    super.initState();
    addReaction();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _syncUsersWithPile();
    });
  }

  @override
  void didUpdateWidget(FacePile oldWidget) {
    super.didUpdateWidget(oldWidget);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _syncUsersWithPile();
    });
  }

  void _syncUsersWithPile() {
    _visibleUsers.clear();
    setState(() {
      final newUsers = users.where(
        (user) =>
            _visibleUsers.where((visibleUser) => visibleUser == user).isEmpty,
      );

      for (final newUser in newUsers) {
        _visibleUsers.add(newUser);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final facesCount = _visibleUsers.length;

        double facePercentVisible = 1.0 - widget.facePercentOverlap;

        final maxIntrinsicWidth = facesCount > 1
            ? (1 + (facePercentVisible * (facesCount - 1))) * widget.faceSize
            : widget.faceSize;

        late double leftOffset;
        if (maxIntrinsicWidth > constraints.maxWidth) {
          leftOffset = 0;
          facePercentVisible =
              ((constraints.maxWidth / widget.faceSize) - 1) / (facesCount - 1);
        } else {
          leftOffset = (constraints.maxWidth - maxIntrinsicWidth) / 2;
        }

        if (constraints.maxWidth < widget.faceSize) {
          // There isn't room for a single face. Show nothing.
          return const SizedBox();
        }

        return SizedBox(
          height: widget.faceSize,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              for (var i = 0; i < facesCount; i += 1)
                AnimatedPositioned(
                  // key: ValueKey(_visibleUsers[i].type),
                  top: 0,
                  height: widget.faceSize,
                  left: leftOffset + (i * facePercentVisible * widget.faceSize),
                  width: widget.faceSize,
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeInOut,
                  child: AppearingAndDisappearingFace(
                    user: _visibleUsers[i],
                    showFace: users.contains(_visibleUsers[i]),
                    faceSize: widget.faceSize,
                    onDisappear: () {
                      setState(() {
                        _visibleUsers.removeAt(i);
                      });
                    },
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

class AppearingAndDisappearingFace extends StatefulWidget {
  const AppearingAndDisappearingFace({
    Key? key,
    required this.user,
    required this.faceSize,
    required this.showFace,
    required this.onDisappear,
  }) : super(key: key);

  final Reactions user;
  final double faceSize;
  final bool showFace;
  final VoidCallback onDisappear;

  @override
  _AppearingAndDisappearingFaceState createState() =>
      _AppearingAndDisappearingFaceState();
}

class _AppearingAndDisappearingFaceState
    extends State<AppearingAndDisappearingFace>
    with SingleTickerProviderStateMixin {
  late AnimationController _scaleController;
  late Animation _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _scaleController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500))
      ..addStatusListener((status) {
        if (status == AnimationStatus.dismissed) {
          widget.onDisappear();
        }
      });
    _scaleAnimation = CurvedAnimation(
      parent: _scaleController,
      curve: Curves.elasticOut,
    );

    _syncScaleAnimationWithWidget();
  }

  @override
  void didUpdateWidget(AppearingAndDisappearingFace oldWidget) {
    super.didUpdateWidget(oldWidget);

    _syncScaleAnimationWithWidget();
  }

  void _syncScaleAnimationWithWidget() {
    if (widget.showFace &&
        !_scaleController.isCompleted &&
        _scaleController.status != AnimationStatus.forward) {
      _scaleController.forward();
    } else if (!widget.showFace &&
        !_scaleController.isDismissed &&
        _scaleController.status != AnimationStatus.reverse) {
      _scaleController.reverse();
    }
  }

  @override
  void dispose() {
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.faceSize,
      height: widget.faceSize,
      child: Center(
        child: AnimatedBuilder(
          animation: _scaleAnimation,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: AvatarCircle(
                user: widget.user,
                size: widget.faceSize,
                nameLabelColor: const Color(0xFF222222),
                backgroundColor: const Color(0xFF888888),
              ),
            );
          },
        ),
      ),
    );
  }
}

class AvatarCircle extends StatefulWidget {
  const AvatarCircle({
    Key? key,
    required this.user,
    this.size = 48,
    required this.nameLabelColor,
    required this.backgroundColor,
  }) : super(key: key);

  final Reactions user;
  final double size;
  final Color nameLabelColor;
  final Color backgroundColor;

  @override
  _AvatarCircleState createState() => _AvatarCircleState();
}

class _AvatarCircleState extends State<AvatarCircle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size,
      height: widget.size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: widget.backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 5,
            offset: const Offset(0, 3),
          )
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Image.asset(
            widget.user.avatarUrl,
          ),
        ],
      ),
    );
  }
}

// class User {
//   const User({
//     required this.id,
//     required this.firstName,
//     required this.avatarUrl,
//   });

//   final String id;
//   final String firstName;
//   final String avatarUrl;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is User && runtimeType == other.runtimeType && id == other.id;

//   @override
//   int get hashCode => id.hashCode;
// }
