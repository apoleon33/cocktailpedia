import 'package:flutter/material.dart';

/// Interface to manage every widget that needs to handle a loading for any reason.
abstract class DisplayLoading {
  /// The content that need to be displayed while anything is loading.
  /// Generally with a use of [Shimmer].
  Widget buildLoading(BuildContext context);

  /// The actual content to display once the content is loaded.
  Widget buildLoadingEnded(BuildContext context);
}
