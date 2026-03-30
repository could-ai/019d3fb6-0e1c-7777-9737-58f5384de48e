import '../models/fake_news_models.dart';

class AnalyzerService {
  /// Simulates a backend AI multi-source verification process
  static Future<AnalysisResult> analyzeContent(String input) async {
    // Simulate network and AI processing delay
    await Future.delayed(const Duration(seconds: 3));

    final lowerInput = input.toLowerCase();
    
    // Simple mock logic to demonstrate different UI states
    bool isFake = lowerInput.contains('fake') || lowerInput.contains('alien') || lowerInput.contains('hoax');
    bool isTrue = lowerInput.contains('official') || lowerInput.contains('science') || lowerInput.contains('proven');

    if (isFake) {
      return AnalysisResult(
        overallVerdict: Verdict.likelyFalse,
        confidenceScore: 12, // Low confidence in the truthfulness
        explanation: "Multiple trusted sources contradict the core claims made in this text. The narrative relies on fabricated quotes and unverified images.",
        claims: [
          Claim(
            text: "Aliens landed in Central Park yesterday.",
            verdict: Verdict.likelyFalse,
            explanation: "No public records, news outlets, or official statements corroborate this event."
          ),
          Claim(
            text: "The military has cordoned off the area.",
            verdict: Verdict.likelyFalse,
            explanation: "Live traffic cameras and local reports show normal civilian activity in Central Park."
          ),
        ],
        evidence: [
          Evidence(
            sourceName: "Reuters Fact Check",
            url: "https://reuters.com",
            supports: false,
            snippet: "Reports of extraterrestrial activity in New York are part of a viral marketing campaign for an upcoming movie."
          ),
          Evidence(
            sourceName: "NYPD Official Statement",
            url: "https://nyc.gov",
            supports: false,
            snippet: "There are no military operations or unusual incidents occurring in Central Park."
          ),
        ]
      );
    }

    if (isTrue) {
      return AnalysisResult(
        overallVerdict: Verdict.likelyTrue,
        confidenceScore: 92,
        explanation: "The core claims in this text are well-supported by multiple independent and official sources.",
        claims: [
          Claim(
            text: "The new space telescope captured images of a distant galaxy.",
            verdict: Verdict.likelyTrue,
            explanation: "NASA officially released these images on their public portal."
          ),
        ],
        evidence: [
          Evidence(
            sourceName: "NASA Press Release",
            url: "https://nasa.gov",
            supports: true,
            snippet: "The James Webb Space Telescope has successfully transmitted its first deep-field images."
          ),
        ]
      );
    }

    // Default to Misleading to show a mix of true/false claims
    return AnalysisResult(
      overallVerdict: Verdict.misleading,
      confidenceScore: 55,
      explanation: "While the text contains some factual elements, key details have been exaggerated or taken out of context to present a skewed narrative.",
      claims: [
        Claim(
          text: "The new policy will increase taxes by 50%.",
          verdict: Verdict.likelyFalse,
          explanation: "The 50% figure applies only to a specific corporate bracket, not general income tax."
        ),
        Claim(
          text: "The bill was passed on Tuesday.",
          verdict: Verdict.likelyTrue,
          explanation: "Congressional records confirm the bill passed the House on Tuesday."
        ),
        Claim(
          text: "Millions will lose their homes.",
          verdict: Verdict.unverified,
          explanation: "Projections vary wildly; no consensus among economists supports this exact claim."
        ),
      ],
      evidence: [
        Evidence(
          sourceName: "Associated Press",
          url: "https://apnews.com",
          supports: false,
          snippet: "The tax increase is capped at 15% for individuals, contradicting viral claims of a 50% hike."
        ),
        Evidence(
          sourceName: "GovTrack",
          url: "https://govtrack.us",
          supports: true,
          snippet: "H.R. 1234 passed on Tuesday with a vote of 215-210."
        ),
        Evidence(
          sourceName: "Economic Policy Institute",
          url: "https://epi.org",
          supports: false,
          snippet: "Housing market impact is expected to be minimal in the short term, though long-term effects are debated."
        ),
      ],
    );
  }
}
