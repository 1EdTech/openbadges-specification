---
title: "Course"
docType: "segment"
status: "PublicDraft"
author: "1Edtech Consortium"
lastUpdated: 2026-07-02
description: "Evidence Course example for TrustEd Credential 1.0 implementations"
---

#### Pass an course

This example describes a TrustEd Credential of a learner that has passed the Course
`Introduction to Data Science`, issued by the `Example University` institution.
The course is graded by a letter grade, being a `C` the minimum for passing. It
also defines a midterm and final exams, graded by a percertange, requiring a 60%
for passing.

The learned did well, because it passed the midterm exam with a 88%, the final
exam with a 91%, and course with an `A`. The credential also
links to the completion report, located at
`https://example.edu/evidence/students/12345/intro-data-science-completion.pdf`.

```obv3p0
{
  "@context": [
    "https://www.w3.org/ns/credentials/v2",
    "https://purl.imsglobal.org/spec/ob/v3p0/context-3.0.3.json"
  ],
  "id": "https://example.edu/credentials/3732",
  "type": ["VerifiableCredential", "OpenBadgeCredential"],
  "name": "Introduction to Data Science - Course Completion",
  "description": "Awarded to learners who successfully complete the Introduction to Data Science course, including a midterm exam, a final exam, and an overall final grade.",
  "image": {
    "id": "https://example.edu/badges/intro-data-science.png",
    "type": "Image",
    "caption": "Introduction to Data Science course badge"
  },
  "awardedDate": "2026-06-15T00:00:00Z",
  "issuer": {
    "id": "https://example.edu/issuers/1",
    "type": ["Profile"],
    "name": "Example University",
    "url": "https://example.edu",
    "email": "credentials@example.edu"
  },
  "validFrom": "2026-06-15T00:00:00Z",
  "credentialSubject": {
    "id": "did:example:ebfeb1f712ebc6f1c276e12ec21",
    "type": ["AchievementSubject"],
    "achievement": {
      "id": "https://example.edu/achievements/intro-data-science",
      "type": ["Achievement"],
      "achievementType": "Course",
      "name": "Introduction to Data Science",
      "description": "A one-semester course covering the fundamentals of data collection, cleaning, statistical analysis, and visualization.",
      "criteria": {
        "narrative": "To earn this badge, the learner must complete all course modules, pass a midterm exam, pass a final exam, and achieve an overall final grade of C or higher."
      },
      "fieldOfStudy": "Data Science",
      "creditsAvailable": 3.0,
      "resultDescription": [
        {
          "id": "https://example.edu/achievements/intro-data-science/results/midterm-exam",
          "type": ["ResultDescription"],
          "name": "Midterm Exam",
          "resultType": "Percent",
          "valueMin": "0",
          "valueMax": "100",
          "requiredValue": "60"
        },
        {
          "id": "https://example.edu/achievements/intro-data-science/results/final-exam",
          "type": ["ResultDescription"],
          "name": "Final Exam",
          "resultType": "Percent",
          "valueMin": "0",
          "valueMax": "100",
          "requiredValue": "60"
        },
        {
          "id": "https://example.edu/achievements/intro-data-science/results/final-grade",
          "type": ["ResultDescription"],
          "name": "Final Grade",
          "resultType": "LetterGrade",
          "allowedValue": ["A", "B", "C", "D", "F"],
          "requiredValue": "C"
        }
      ]
    },
    "result": [
      {
        "type": ["Result"],
        "resultDescription": "https://example.edu/achievements/intro-data-science/results/midterm-exam",
        "value": "88"
      },
      {
        "type": ["Result"],
        "resultDescription": "https://example.edu/achievements/intro-data-science/results/final-exam",
        "value": "91"
      },
      {
        "type": ["Result"],
        "resultDescription": "https://example.edu/achievements/intro-data-science/results/final-grade",
        "value": "A"
      }
    ]
  },
  "evidence": [
    {
      "id": "https://example.edu/evidence/students/12345/intro-data-science-completion.pdf",
      "type": ["Evidence"],
      "name": "Course Completion Record",
      "description": "A signed record confirming successful completion of Introduction to Data Science, including exam scores and final grade.",
      "genre": "Transcript"
    }
  ]
}
```

In this example:

- It uses `Percent` and `LetterGrade` from the `ResultType` enum for the three results — if you'd rather grade the exams with letter grades too (not just the final grade), just change their `resultType` and add an `allowedValue` list like the final grade has.
- `resultType`: `LetterGrade` is the enumerated `ResultType` value; `allowedValue` gives the possible grades and `requiredValue` the passing threshold.
- `requiredValue`/`valueMin`/`valueMax` on the `ResultDescription` are optional — they express the passing bar/scale, not the individual's actual score (that lives on `Result.value`).
- The `Evidence.id` is the link to the file; if you want a human-readable link description on top of the raw file link, add a `narrative` (Markdown) property.
