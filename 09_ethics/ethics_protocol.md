# Ethics Protocol

**Session 9**

## 1. Overview

This ethics protocol evaluates the ethical, legal, and organizational considerations associated with the development of a Machine Learning artifact for classifying Peruvian regulatory and institutional PDF documents.

The artifact performs binary document classification:

- `1`: Relevant.
- `0`: Not relevant.

The model is intended to support preliminary regulatory-document prioritization before detailed review by legal, compliance, risk, technology, or regulatory specialists.

The research does not directly collect information from human participants. The principal research materials are institutional PDF documents obtained from public or authorized sources.

Nevertheless, ethical risks remain regarding:

- Data ownership.
- Copyright and redistribution.
- Personal information contained in institutional documents.
- Labeling subjectivity.
- Automation bias.
- False-positive and false-negative predictions.
- Institutional-source bias.
- Model transparency.
- Accountability.
- Misuse of model outputs.
- Long-term storage and access control.

The research team adopts a human-in-the-loop approach. The model must not replace professional legal, regulatory, compliance, or risk judgment.

---

## 2. Research Question

The principal research question is:

> Can a Machine Learning artifact based on multilingual semantic embeddings classify Peruvian regulatory and institutional PDF documents as relevant or not relevant for preliminary regulatory monitoring?

The ethical review also considers the following supporting question:

> How can the artifact reduce manual review effort without creating unacceptable risks of omission, misclassification, misuse, or excessive reliance on automated predictions?

---

## 3. Ethical Framework

The research is guided by the following ethical principles:

1. Respect for autonomy.
2. Beneficence.
3. Non-maleficence.
4. Justice.
5. Transparency.
6. Accountability.
7. Privacy and data protection.
8. Human oversight.
9. Proportionality.
10. Reproducibility.

These principles are adapted to a document-classification research context.

The research also follows a risk-based approach in which the level of control should be proportional to the possible consequences of a classification error.

Because the artifact may support regulatory-monitoring activities, human review is required before any high-impact organizational decision.

---

## 4. Ethical Scope

The ethics protocol covers:

- Collection of institutional PDF documents.
- Dataset labeling.
- Document preprocessing.
- Text extraction.
- Storage of original and processed files.
- Model training.
- Model evaluation.
- Prediction of new PDF documents.
- Publication of code.
- Distribution of data.
- Communication of model performance.
- Human use of classification results.

The protocol does not provide legal authorization to redistribute third-party documents.

Copyright, licensing, and institutional terms of use must be reviewed separately.

---

# 5. Key Ethical Considerations

## 5.1 Participant and Data Autonomy

### Does the research involve human participants?

The current project does not directly recruit, interview, survey, observe, or experiment on human participants.

The primary units of analysis are institutional PDF documents.

Therefore, traditional informed consent from research participants is not directly applicable.

### How is autonomy protected?

Autonomy is protected by:

- Avoiding the collection of unnecessary personal information.
- Using institutional documents rather than personal profiles.
- Restricting the model to document-level relevance classification.
- Preventing use of the model for evaluating individuals.
- Requiring human review before organizational action.
- Clearly communicating that predictions are probabilistic.
- Allowing analysts to override the model decision.
- Documenting intended and prohibited uses.

### Personal information within documents

Some institutional documents may contain:

- Names.
- Signatures.
- Professional roles.
- Institutional email addresses.
- Public-official information.
- Contact details.
- Metadata.

Even when such information is publicly available, it should not be used for profiling or evaluation of individuals.

The model should classify document relevance, not personal characteristics.

### Data minimization

Only information required for document classification should be retained.

The project should avoid creating unnecessary fields related to:

- Individual identity.
- Personal behavior.
- Demographic characteristics.
- Political views.
- Health information.
- Financial information about individuals.

---

## 5.2 Beneficence

The research seeks to produce positive outcomes by:

- Reducing repetitive manual document screening.
- Supporting faster identification of potentially relevant documents.
- Improving consistency in preliminary classification.
- Helping specialists prioritize documents for detailed review.
- Demonstrating a reproducible academic Machine Learning pipeline.
- Supporting research on Spanish-language institutional documents.
- Encouraging human-centered use of Artificial Intelligence.
- Identifying limitations before possible institutional deployment.

The expected benefit is operational support rather than autonomous regulatory decision-making.

### Intended social and organizational benefit

The artifact may help regulatory-monitoring teams focus their limited time on documents that are more likely to be relevant.

Potential beneficiaries include:

- Researchers.
- Compliance analysts.
- Risk analysts.
- Legal teams.
- Information-management teams.
- Technology teams.
- Students studying Legal NLP or RegTech.

---

## 5.3 Non-Maleficence

The research must minimize foreseeable harm.

Potential harms include:

- Missing a relevant document.
- Prioritizing an irrelevant document.
- Misinterpreting the probability output.
- Treating model output as a legal conclusion.
- Publishing documents without redistribution permission.
- Exposing personal information.
- Reinforcing institutional or topic bias.
- Producing misleading confidence from a small test set.
- Reusing the model for unauthorized purposes.

### False negatives

A false negative occurs when a relevant document is classified as not relevant.

This is the most significant operational risk because an important document may not receive timely review.

Mitigation measures include:

- Prioritizing recall during model selection.
- Periodically reviewing samples classified as not relevant.
- Maintaining manual monitoring of official institutional sources.
- Using uncertainty thresholds.
- Retraining when new topics or institutions are introduced.
- Testing with hard-negative and borderline documents.
- Never using the model as the only monitoring mechanism.

### False positives

A false positive occurs when a non-relevant document is classified as relevant.

This creates additional manual work but is generally less harmful than overlooking an important document.

Mitigation measures include:

- Allowing analyst correction.
- Logging false positives.
- Adding corrected examples during retraining.
- Reviewing probability thresholds.
- Monitoring the volume of unnecessary alerts.

### Automation bias

Users may over-trust a prediction because the system displays a high probability.

Mitigation measures include:

- Displaying a warning that the result is a prediction.
- Avoiding language such as “legally valid” or “officially relevant.”
- Requiring human confirmation.
- Documenting the limitations of the probability score.
- Providing access to the original PDF.
- Developing future explanation features.


---

# 6. Risk Assessment

## Risk 1: False negative classification

A relevant document may be incorrectly classified as not relevant.

- **Likelihood:** [ ] Low [x] Medium [ ] High
- **Severity:** [ ] Low [ ] Medium [x] High

### Mitigation

- Prioritize recall.
- Maintain human review.
- Audit non-relevant predictions.
- Test hard negatives.
- Use uncertainty warnings.
- Do not replace official regulatory monitoring.
- Retrain with newly identified errors.

---

## Risk 2: Automation bias

Users may treat the output as authoritative.

- **Likelihood:** [ ] Low [x] Medium [ ] High
- **Severity:** [ ] Low [x] Medium [ ] High

### Mitigation

- Clearly label outputs as predictions.
- Require human confirmation.
- Document limitations.
- Avoid legal-conclusion language.
- Provide the original document for review.
- Train users before institutional use.

---

## Risk 3: Copyright or unauthorized redistribution

PDF documents may be publicly accessible but still subject to copyright or terms-of-use restrictions.

- **Likelihood:** [ ] Low [x] Medium [ ] High
- **Severity:** [ ] Low [x] Medium [ ] High

### Mitigation

- Verify redistribution permissions.
- Avoid uploading PDFs directly to GitHub without review.
- Publish a source manifest when redistribution is uncertain.
- Preserve attribution.
- Separate the code license from dataset permissions.
- Remove any restricted document from public releases.

---

## Risk 4: Exposure of personal information

Institutional documents may contain names, signatures, email addresses, or contact information.

- **Likelihood:** [x] Low [ ] Medium [ ] High
- **Severity:** [ ] Low [x] Medium [ ] High

### Mitigation

- Review documents before public distribution.
- Avoid extracting personal information as model features.
- Do not use the model for individual profiling.
- Restrict access to documents containing sensitive information.
- Remove unnecessary personal metadata from distributed manifests.
- Follow applicable data-protection requirements.

---

## Risk 5: Institutional and topic bias

The model may perform better for institutions and topics strongly represented in training.

- **Likelihood:** [ ] Low [ ] Medium [x] High
- **Severity:** [ ] Low [x] Medium [ ] High

### Mitigation

- Report class and topic distributions.
- Expand underrepresented topics.
- Add documents from more institutions.
- Conduct institution-based validation.
- Conduct topic-level error analysis.
- Avoid claims beyond the training scope.
- Monitor model performance after dataset updates.

---

## Risk 6: Misleading performance interpretation

Perfect test metrics may be interpreted as proof that the model is error-free.

- **Likelihood:** [ ] Low [x] Medium [ ] High
- **Severity:** [ ] Low [x] Medium [ ] High

### Mitigation

- State that the test set contains 27 documents.
- Report that SVM and Random Forest were tied.
- Perform cross-validation.
- Perform external validation.
- Report confidence intervals when possible.
- Document the risk of source-specific learning.
- Avoid describing the model as perfect.

---

## Risk 7: Dataset-label subjectivity

Relevance labels may reflect the research team’s interpretation.

- **Likelihood:** [ ] Low [ ] Medium [x] High
- **Severity:** [ ] Low [x] Medium [ ] High

### Mitigation

- Document the labeling criteria.
- Use two or more reviewers in future versions.
- Calculate inter-annotator agreement.
- Resolve disagreements with a domain specialist.
- Preserve borderline cases for error analysis.
- Allow label corrections.

---

## Risk 8: Exclusion of image-based documents

Documents without extractable text are excluded, potentially creating format-related bias.

- **Likelihood:** [ ] Low [x] Medium [ ] High
- **Severity:** [ ] Low [x] Medium [ ] High

### Mitigation

- Document all excluded files.
- Add OCR in future versions.
- Evaluate scanned documents separately.
- Avoid claiming coverage of all PDF formats.
- Maintain the exclusion report.

---

## Risk 9: Model misuse

The model could be reused for tasks outside the research scope.

- **Likelihood:** [ ] Low [x] Medium [ ] High
- **Severity:** [ ] Low [ ] Medium [x] High

### Mitigation

- Publish prohibited uses.
- Use a model card.
- Apply repository licensing.
- Require human oversight.
- Avoid releasing sensitive data.
- Include warnings in the interface and README.

---

# 7. Risk Matrix

| Risk | Likelihood | Severity | Overall priority |
|---|---|---|---|
| False negative | Medium | High | High |
| Automation bias | Medium | Medium | Medium |
| Unauthorized redistribution | Medium | Medium | Medium |
| Personal information exposure | Low | Medium | Low–Medium |
| Institutional/topic bias | High | Medium | High |
| Misleading performance interpretation | Medium | Medium | Medium |
| Label subjectivity | High | Medium | High |
| Image-based document exclusion | Medium | Medium | Medium |
| Model misuse | Medium | High | High |

High-priority risks require explicit controls before institutional deployment.

---

# 8. Consent and Disclosure

## Information Provided to Participants

Traditional participant information is not applicable because no human participants were recruited.

However, users of the model must be informed of the following:

- The system performs probabilistic classification.
- The model may produce errors.
- The output is not legal advice.
- The output is not an official regulatory interpretation.
- Human review is required.
- The model was trained with a limited dataset.
- Some topics and institutions are underrepresented.
- Scanned PDFs may not be processed correctly.
- Prediction probabilities are not guarantees.
- Predictions may be logged for audit and improvement.

---

## Consent Method

No participant-consent procedure is required for the current document-based study because no individuals are directly recruited.

If future research includes:

- Interviews.
- Surveys.
- User-behavior tracking.
- Expert annotation.
- Usability testing.
- Feedback linked to identifiable individuals.

then informed consent must be obtained before data collection.

The consent process should explain:

- Research purpose.
- Data collected.
- Voluntary participation.
- Withdrawal rights.
- Data retention.
- Confidentiality.
- Intended publication.
- Contact information.
- Potential risks and benefits.

---

## Expert Labeling and Review

If specialists participate in future labeling or model evaluation, they should be informed that:

- Their decisions may be recorded.
- Their labels may be compared.
- Their comments may be used for dataset improvement.
- Participation is voluntary unless performed as an assigned institutional role.
- Individual performance should not be evaluated from the labeling task without separate authorization.

---

# 9. Transparency and Disclosure

The following information should be publicly documented:

- Research objective.
- Dataset composition.
- Data sources.
- Label definitions.
- Preprocessing steps.
- Exclusion criteria.
- Duplicate-removal process.
- Embedding model.
- Classifier.
- Evaluation metrics.
- Test-set size.
- Known limitations.
- Intended uses.
- Prohibited uses.
- Human-oversight requirements.

The project documents these elements through:

```text
datasheet.md
model_card.md
reproducibility_audit.md
systematic_review.md
gap_analysis.md
README.md
```

---

# 10. Data Protection

## Data Storage

During development, the data is stored in:

```text
Google Drive
```

The working project structure is:

```text
Modelo_ML/
├── Data/
├── cache/
├── modelos/
└── resultados/
```

The GitHub repository stores the source code and documentation.

The original PDF dataset should not be uploaded to GitHub until redistribution rights and data-protection conditions are verified.

---

## Data Security

Recommended security controls include:

- Google-account authentication.
- Restricted Drive-folder access.
- Strong account passwords.
- Multi-factor authentication.
- Restricted sharing permissions.
- Avoiding public links for unreviewed data.
- Separation of code and source documents.
- Avoiding credentials inside notebooks.
- Avoiding tokens in GitHub.
- Periodic access review.
- Backup of manifests and documentation.
- Encryption provided by the storage platform.
- Local device security.

The repository must not include:

- Passwords.
- Access tokens.
- API keys.
- Personal credentials.
- Private institutional links.
- Confidential documents.

---

## Access Control

Access should follow the principle of least privilege.

Suggested access levels:

| Role | Recommended access |
|---|---|
| Researcher | Read and write |
| Supervisor | Read or review |
| External evaluator | Read-only access to authorized materials |
| General public | Code and approved metadata only |
| Model user | Prediction interface and approved model files |

---

## Data Retention

Recommended retention period:

```text
Five years after completion of the academic project
```

This period may be adjusted according to:

- University policy.
- Research-program requirements.
- Legal obligations.
- Publication requirements.
- Source-document permissions.

The research team should retain:

- Source manifest.
- Dataset version.
- Labels.
- Exclusion reports.
- Duplicate reports.
- Final code.
- Final model.
- Evaluation results.
- Ethics documentation.

Temporary Colab files may be deleted after each session if persistent copies are stored securely.

---

## Data Disposal

At the end of the retention period, data should be reviewed.

Disposal may include:

- Deleting unauthorized PDF copies.
- Removing temporary files.
- Revoking public links.
- Deleting cached embeddings when no longer needed.
- Removing old model files.
- Removing access permissions.
- Preserving only legally distributable metadata and documentation.

Deletion should be documented when institutional policy requires it.

GitHub history and permanent repositories must be considered before publishing information that may later require removal.

---

## Data Breach or Unauthorized Access

If unauthorized access is detected:

1. Restrict access immediately.
2. Revoke affected links or credentials.
3. Identify the exposed files.
4. Inform the project supervisor.
5. Evaluate whether personal or restricted information was involved.
6. Follow institutional incident-reporting procedures.
7. Document corrective actions.
8. Review access controls.

---

# 11. Human Oversight

Human oversight is mandatory.

The model should support the following process:

```text
Model prediction
→ analyst review
→ acceptance or correction
→ detailed regulatory analysis
```

The model must not:

- Automatically discard official documents.
- Automatically determine legal applicability.
- Automatically assign sanctions.
- Automatically declare compliance or non-compliance.
- Prevent a specialist from reviewing a document.

Analysts should be able to:

- Review the original PDF.
- View the predicted class.
- View the probability.
- Override the result.
- Record correction feedback.
- Request retraining or review.

---

# 12. Accountability

Responsibility remains with the human users and the institution applying the model.

The model developer is responsible for:

- Documenting the pipeline.
- Reporting known limitations.
- Avoiding misleading claims.
- Maintaining version records.
- Correcting identified errors.
- Protecting data under the developer’s control.

The operational user is responsible for:

- Interpreting predictions appropriately.
- Maintaining human review.
- Avoiding prohibited uses.
- Reporting errors.
- Following institutional procedures.
- Verifying the official document source.

The model itself cannot be considered accountable.

---

# 13. Ethical Use Conditions

The model may be used when:

- The purpose is preliminary document prioritization.
- The documents are legally accessible.
- Human oversight is present.
- Predictions are not treated as legal conclusions.
- The model version is documented.
- Errors can be corrected.
- Access is appropriately controlled.
- The use remains within the documented scope.

The model must not be used when:

- It is the only regulatory-monitoring mechanism.
- Human review is removed.
- The model evaluates individuals.
- The dataset contains unauthorized confidential documents.
- Results are used as legal advice.
- The use involves surveillance.
- The use involves credit decisions.
- The model is applied to unrelated topics without validation.
- Predictions are represented as guaranteed facts.

---

# 14. Ethical Review of Model Performance

The current selected model obtained:

| Metric | Value |
|---|---:|
| Accuracy | 1.0000 |
| Precision | 1.0000 |
| Recall | 1.0000 |
| F1-score | 1.0000 |
| ROC-AUC | 1.0000 |

These values were obtained from a test set of:

```text
27 documents
```

Ethically, these values must be communicated with caution.

They do not demonstrate:

- Perfect real-world performance.
- Complete regulatory coverage.
- Equal performance across topics.
- Equal performance across institutions.
- Reliability for future regulations.
- Production readiness.

Additional validation is required before high-impact use.

---

# 15. Institutional Review

## Current status

- [ ] IRB or Ethics Committee approval obtained
- [ ] Approval date: Not applicable or pending confirmation
- [ ] Reference number: Not available

### Current interpretation

Formal ethics-committee approval has not been reported for this project.

The current study uses publicly accessible institutional documents and does not directly involve human participants.

This may qualify as low-risk or non-human-subject research, depending on the university’s policies.

However, only the corresponding university or ethics committee can formally determine whether review or exemption is required.

### Required action

Before final submission, the research team should confirm with the supervisor whether the project requires:

- Formal ethics approval.
- Ethics exemption.
- Faculty review.
- Data-protection review.
- No formal review.

The final status should not be marked as approved unless written confirmation exists.

---

# 16. Ethical Monitoring Plan

Ethical monitoring should continue throughout the project.

The research team should review:

- New data sources.
- Label corrections.
- Prediction errors.
- Complaints or access requests.
- Copyright concerns.
- Personal information.
- Changes to model scope.
- New institutional users.
- Public distribution decisions.
- Evidence of model drift.

A review should be triggered when:

- A major dataset update occurs.
- New institutions are added.
- The model is deployed outside the academic environment.
- Human-participant testing begins.
- A data incident occurs.
- The model is used for higher-impact decisions.
- A new use case is proposed.

---

# 17. Ethics Checklist

## Data and privacy

- [x] Research does not directly recruit human participants.
- [x] Primary research materials are institutional documents.
- [x] Personal profiling is outside the scope.
- [x] Data-minimization principles are documented.
- [ ] Every PDF has been reviewed for personal information.
- [ ] Redistribution permissions have been confirmed.
- [ ] Final dataset license has been assigned.

## Model use

- [x] Human oversight is required.
- [x] Legal advice is prohibited.
- [x] Final compliance decisions are prohibited.
- [x] Individual evaluation is prohibited.
- [x] Known limitations are documented.
- [ ] External validation has been completed.
- [ ] Institution-based validation has been completed.

## Transparency

- [x] Dataset datasheet created.
- [x] Model card created.
- [x] Reproducibility audit created.
- [x] Performance limitations reported.
- [ ] Final README completed.
- [ ] Screening matrix completed.
- [ ] Ethics-review status confirmed with the supervisor.

---

# 18. Final Ethical Assessment

## Current ethical status

```text
Conditional approval for academic prototype use
```

### Justification

The project presents a relatively low direct risk to individuals because it processes institutional documents rather than participant data.

However, conditional controls remain necessary because of:

- Possible copyright restrictions.
- Personal information contained in documents.
- False-negative risk.
- Automation bias.
- Institutional-source bias.
- Subjective labels.
- Limited external validation.
- Potential misuse in compliance decisions.

The artifact may be used for academic demonstration and controlled research when:

- Human oversight is maintained.
- Data access is authorized.
- Limitations are disclosed.
- Predictions are not treated as legal conclusions.
- The dataset is not publicly redistributed without review.

The artifact should not be deployed as an autonomous regulatory-compliance system.

---

# 19. Sign-off

- **Researcher:** Research team
- **Date:** 2 August 2026
- **Ethical status:** Conditional approval for academic prototype use

- **Supervisor:** Pending completion
- **Date:** Pending completion

## Required conditions before final ethical sign-off

- [ ] Supervisor reviews this ethics protocol.
- [ ] Institutional-review requirement is confirmed.
- [ ] Dataset redistribution rights are reviewed.
- [ ] Personal-information review is completed.
- [ ] Final dataset-access conditions are documented.
- [ ] External-use warnings are included in the README.
- [ ] Human-oversight procedures are confirmed.
- [ ] Final model limitations are communicated.

---

# 20. References

European Commission. (2019). *Ethics Guidelines for Trustworthy AI*. High-Level Expert Group on Artificial Intelligence.

Gebru, T., Morgenstern, J., Vecchione, B., Vaughan, J. W., Wallach, H., Daumé III, H., and Crawford, K. (2021). Datasheets for Datasets. *Communications of the ACM, 64*(12), 86–92.

Mitchell, M., Wu, S., Zaldivar, A., Barnes, P., Vasserman, L., Hutchinson, B., Spitzer, E., Raji, I. D., and Gebru, T. (2019). Model Cards for Model Reporting. *Proceedings of the Conference on Fairness, Accountability, and Transparency*, 220–229.

National Commission for the Protection of Human Subjects of Biomedical and Behavioral Research. (1979). *The Belmont Report*.

Organisation for Economic Co-operation and Development. (2019). *OECD Principles on Artificial Intelligence*.
