import 'package:flutter/material.dart';

enum Verdict { likelyTrue, likelyFalse, misleading, unverified }

extension VerdictExtension on Verdict {
  String get label {
    switch (this) {
      case Verdict.likelyTrue:
        return 'Likely True';
      case Verdict.likelyFalse:
        return 'Likely False';
      case Verdict.misleading:
        return 'Misleading';
      case Verdict.unverified:
        return 'Unverified';
    }
  }

  Color get color {
    switch (this) {
      case Verdict.likelyTrue:
        return Colors.green.shade700;
      case Verdict.likelyFalse:
        return Colors.red.shade700;
      case Verdict.misleading:
        return Colors.orange.shade700;
      case Verdict.unverified:
        return Colors.grey.shade700;
    }
  }

  IconData get icon {
    switch (this) {
      case Verdict.likelyTrue:
        return Icons.check_circle;
      case Verdict.likelyFalse:
        return Icons.cancel;
      case Verdict.misleading:
        return Icons.warning_rounded;
      case Verdict.unverified:
        return Icons.help;
    }
  }
}

class Claim {
  final String text;
  final Verdict verdict;
  final String explanation;

  Claim({
    required this.text,
    required this.verdict,
    required this.explanation,
  });
}

class Evidence {
  final String sourceName;
  final String url;
  final bool supports;
  final String snippet;

  Evidence({
    required this.sourceName,
    required this.url,
    required this.supports,
    required this.snippet,
  });
}

class AnalysisResult {
  final Verdict overallVerdict;
  final int confidenceScore;
  final String explanation;
  final List<Claim> claims;
  final List<Evidence> evidence;

  AnalysisResult({
    required this.overallVerdict,
    required this.confidenceScore,
    required this.explanation,
    required this.claims,
    required this.evidence,
  });
}
