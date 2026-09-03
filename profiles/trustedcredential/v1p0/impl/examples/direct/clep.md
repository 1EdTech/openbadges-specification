---
title: "Direct assessment - CLEP"
docType: "segment"
status: "PublicDraft"
author: "1Edtech Consortium"
lastUpdated: 2026-07-06
description: "Direct Assessment - CLEP example for TrustEd Credential 1.0 implementations"
---

##### CLEP exam

The following example describes a credential for an excerpt of the
"College Algebra” CLEP (College-Level Examination Program) exam,
as it only describes three questions.

```obv3p0
{
  "@context": [
    "https://www.w3.org/ns/credentials/v2",
    "https://purl.imsglobal.org/spec/ob/v3p0/context-3.0.3.json",
    "https://purl.imsglobal.org/spec/ob-assessment/v2p0/context/"
  ],
  "id": "https://example.edu/credentials/clep-college-algebra/9f2c4a1e",
  "type": ["VerifiableCredential", "OpenBadgeCredential"],
  "issuer": {
    "id": "https://clep.collegeboard.org/issuers/clep-program",
    "type": ["Profile"],
    "name": "CLEP (College-Level Examination Program)",
    "url": "https://clep.collegeboard.org"
  },
  "validFrom": "2026-06-15T00:00:00Z",
  "name": "CLEP College Algebra",
  "description": "Awarded to test-takers who complete the CLEP College Algebra examination.",
  "credentialSubject": {
    "id": "did:example:d4f8a6b1c2e39047",
    "type": ["AchievementSubject"],
    "achievement": {
      "id": "https://clep.collegeboard.org/achievements/college-algebra",
      "type": ["Achievement"],
      "achievementType": "Assessment",
      "name": "CLEP College Algebra",
      "description": "The CLEP College Algebra examination assesses material that is usually taught in a one-semester college course in algebra, covering algebraic operations, equations and inequalities, functions, and their graphs.",
      "criteria": {
        "narrative": "Achieved by completing the CLEP College Algebra examination and earning a scaled score that meets or exceeds the score required by the receiving institution for credit."
      },
      "resultDescription": [
        {
          "id": "urn:uuid:2c9d4d6a-6f4e-4a7c-8f8b-3e6b5d1a9c02",
          "type": ["ResultDescription", "AssessmentResultDescription"],
          "name": "CLEP College Algebra Scaled Score",
          "resultType": "ScaledScore",
          "valueMin": "20",
          "valueMax": "80",
          "requiredValue": "50",

          "description": "A 90-minute, 60-question, multiple-choice examination covering linear equations and inequalities, functions and their graphs, algebra of functions, exponents, polynomials, rational expressions, and word problems drawn from a first-semester college algebra course. This excerpt illustrates three representative items from the Equations, Functions, and Exponents content areas.",
          "assessmentType": "Exam",
          "assessmentOutput": "Scaled score from 20 to 80, derived from the number of multiple-choice items answered correctly",
          "hasGroupParticipation": false,
          "hasGroupEvaluation": false,
          "evaluationMethod": "Raw score (number of correct responses out of 60 scored questions) is converted to a scaled score of 20-80 using CLEP's standard equating tables. No penalty is applied for incorrect answers.",
          "scoringMethodExampleDescription": "A test-taker who answers 42 of 60 scored items correctly receives a scaled score in the mid-50s, meeting the ACE-recommended credit-granting score of 50.",

          "sections": [
            {
              "type": "Section",
              "title": "College Algebra Exam Excerpt",
              "description": "Three representative multiple-choice items drawn from the Equations, Functions, and Exponents content areas of the CLEP College Algebra examination.",
              "required": "true",
              "questions": [
                {
                  "type": "TextQuestion",
                  "text": "Solve for x: 3x - 7 = 2x + 8",
                  "required": "true",
                  "characterLimit": 20
                },
                {
                  "type": "TextQuestion",
                  "text": "If f(x) = 2x^2 - 3, what is f(4)?",
                  "required": "true",
                  "characterLimit": 20
                },
                {
                  "type": "TextQuestion",
                  "text": "Simplify: x^5 / x^2",
                  "required": "true",
                  "characterLimit": 20
                }
              ]
            }
          ]
        }
      ]
    }
  }
}
```

In this example:

- `achievementType` is set as `"Assessment"`, fitting a CLEP exam better than Course or Certification — it's the credit-by-exam assessment itself, not a course of study.
- Result description defines `resultType` as `"ScaledScore"` with `valueMin`/`valueMax` of `"20"`/`"80"`, mirroring CLEP's actual scoring model (raw score converted to a 20–80 scale via equating tables) — a better fit than `RawScore` or `Percent`, which don't reflect how CLEP actually reports results.
- Result description defines `requiredValue` as `"50"`, reflecting the commonly cited ACE-recommended credit-granting score; real institutions can set their own thresholds, so this is illustrative.
- Result description is using `valueMin`/`valueMax` (continuous numeric range) rather than allowedValue (discrete ordered list) — consistent with the earlier established principle for numeric scales vs. letter/level scales.
- It only defines one Section (`"College Algebra Exam Excerpt"`) holding all three Question objects, since they're presented as a single excerpt rather than separate content-area groupings.
- All questions define their `type` as `"TextQuestion"`. The extension's Question.type enum only offers `ExternalQuestion`, `FileQuestion`, or `TextQuestion`. None of these natively models "multiple-choice," so `TextQuestion` (with a short characterLimit) is the closest fit for a brief typed/selected final answer.