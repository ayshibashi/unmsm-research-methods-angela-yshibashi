# Model Card: Regulatory PDF Relevance Classifier

**Session 7**

## 1. Model Details

### Basic Information

- **Model name:** Peruvian Regulatory PDF Relevance Classifier
- **Suggested short name:** PRPRC-SVM
- **Model type:** Supervised binary text-classification model
- **Final algorithm:** Linear Support Vector Machine
- **Developer:** Academic research team
- **Development environment:** Google Colab
- **Date created:** 2 August 2026
- **Version:** 1.0
- **Language:** Primarily Spanish
- **License:** Pending definition
- **Repository:** Project GitHub repository
- **Model status:** Research prototype

### Classification labels

| Label | Classification |
|---:|---|
| `0` | Not relevant |
| `1` | Relevant |

---

## 2. Model Description

The model classifies institutional or regulatory PDF documents according to their relevance to the monitoring topics defined in the research.

The topics considered relevant include:

- Payment systems.
- Risk management.
- Artificial intelligence.
- Personal-data protection.
- Digital transformation.

The model receives a PDF document and returns:

- Document name.
- Predicted classification.
- Binary label.
- Estimated relevance probability.
- Number of pages.
- Number of extracted words.
- Number of generated fragments.

Example output:

```text
Document: new_document.pdf
Classification: Relevant
Label: 1
Probability of relevance: 88.40%
Number of pages: 18
Number of words: 5,230
Number of fragments: 18
```

The model does not identify specific legal obligations, sanctions, compliance deadlines, responsible entities, or regulatory gaps.

Its purpose is to provide an initial filtering mechanism before detailed human review.

---

## 3. Model Pipeline

The complete classification process is:

```text
PDF document
→ text extraction
→ text validation and cleaning
→ document fragmentation
→ semantic embedding generation
→ document-level vector aggregation
→ binary classification
→ relevance probability
```

### Pipeline stages

1. The PDF is opened using PyMuPDF.
2. Text is extracted from every page.
3. Whitespace and formatting noise are normalized.
4. The document is validated according to the amount of extractable text.
5. The document is divided into overlapping fragments.
6. Each fragment is converted into a semantic embedding.
7. Fragment embeddings are averaged.
8. The resulting document vector is normalized.
9. The trained SVM model predicts the document class.
10. The classification and estimated probability are presented.

---

## 4. Selected Model

### Final model

The selected classifier is:

```text
Linear Support Vector Machine
```

The implementation uses:

```python
SVC(
    kernel="linear",
    probability=True,
    class_weight="balanced",
    random_state=42
)
```

### Selection procedure

Three algorithms were trained and compared:

- Logistic Regression.
- Linear SVM.
- Random Forest.

The models were ranked using:

1. F1-score.
2. Recall.
3. ROC-AUC.

Linear SVM and Random Forest obtained identical results in the current test set.

Linear SVM was selected because it appeared first after the automatic sorting of the comparison table.

This ordering should not be interpreted as evidence that SVM is conclusively superior to Random Forest.

---

## 5. Semantic Representation

### Embedding model

The document representations were generated using:

```text
sentence-transformers/paraphrase-multilingual-MiniLM-L12-v2
```

### Embedding characteristics

| Characteristic | Value |
|---|---|
| Model family | Sentence Transformers |
| Language coverage | Multilingual |
| Embedding dimension | 384 |
| Input unit | Document fragment |
| Fragment aggregation | Arithmetic mean |
| Final normalization | L2 normalization |
| Batch size | 16 |

### Fragmentation configuration

| Parameter | Value |
|---|---:|
| Fragment size | 350 words |
| Overlap | 50 words |
| Step | 300 words |

The same fragmentation and embedding procedures are applied during:

- Training.
- Testing.
- Prediction of new PDF documents.

---

# 6. Intended Use

## Primary Use Cases

The model is intended for:

- Preliminary classification of institutional PDF documents.
- Prioritization of documents for regulatory review.
- Academic research on document classification.
- Demonstration of semantic-embedding pipelines.
- Comparison of classical Machine Learning models.
- Support for regulatory-monitoring prototypes.
- Identification of potentially relevant documents before manual analysis.
- Classification of new PDFs that follow characteristics similar to the training data.

### Example workflow

```text
New institutional document
→ model classification
→ relevant document prioritized
→ specialist performs detailed review
```

The model should act as a decision-support tool rather than an autonomous decision-maker.

---

## Intended Users

The potential users include:

- Academic researchers.
- Data-science students.
- Machine Learning practitioners.
- Regulatory-monitoring teams.
- Risk-management analysts.
- Compliance analysts.
- Legal-technology researchers.
- Information-management teams.
- Financial-sector technology teams.

Users should understand that the output is probabilistic and requires human verification.

---

## Out-of-Scope Use Cases

The model should not be used for:

- Automated legal advice.
- Final compliance decisions.
- Determining whether a regulation is legally binding.
- Determining whether an organization complies with the law.
- Identifying official regulatory obligations without human review.
- Extracting authoritative compliance deadlines.
- Calculating fines or sanctions.
- Predicting judicial outcomes.
- Replacing lawyers, compliance specialists, or risk analysts.
- Credit-scoring decisions.
- Fraud detection.
- Customer profiling.
- Evaluation of individuals.
- Political surveillance.
- Institutional surveillance.
- Automatic rejection of documents without a human-control mechanism.
- Classification of scanned PDFs without OCR.
- Production deployment without external validation.
- Classification of topics not represented in the training dataset.
- Claiming complete coverage of the Peruvian regulatory ecosystem.

---

# 7. Training Data

## Data Source

The model was trained using a manually organized collection of publicly accessible institutional PDF documents.

The relevant documents were associated with areas such as:

- Banco Central de Reserva del Perú:
  - Payment systems.
- Superintendencia de Banca, Seguros y AFP:
  - Risk management.
- Presidencia del Consejo de Ministros:
  - Artificial intelligence.
  - Digital transformation.
  - Data-protection-related documents.
- Other institutional and technical documents used for the non-relevant class.

The original source URLs and download dates should be maintained in a separate dataset manifest.

---

## Data Characteristics

| Characteristic | Value |
|---|---:|
| Initial PDF documents | 150 |
| Initial relevant documents | 75 |
| Initial non-relevant documents | 75 |
| Documents excluded because of text extraction | 14 |
| Valid documents before duplicate removal | 136 |
| Duplicate records removed | 2 |
| Final unique documents | 134 |
| Training documents | 107 |
| Testing documents | 27 |
| Input features per document | 384 |
| Target classes | 2 |
| Main language | Spanish |

### Initial relevant-topic distribution

| Topic | Initial documents |
|---|---:|
| SBS risk management | 22 |
| BCRP payment systems | 21 |
| PCM digital transformation | 19 |
| PCM artificial intelligence | 8 |
| PCM data protection | 4 |
| Cyberdefense | 1 |
| **Total** | **75** |

### Valid relevant-topic distribution before duplicate removal

| Topic | Valid documents |
|---|---:|
| SBS risk management | 22 |
| BCRP payment systems | 21 |
| PCM digital transformation | 15 |
| PCM data protection | 4 |
| PCM artificial intelligence | 2 |
| Cyberdefense | 0 |
| **Total** | **64** |

The single Cyberdefense PDF was excluded because it did not contain extractable text. Therefore, the final model should not be considered validated for Cyberdefense documents.

---

## Time Period

The exact publication-period distribution of the PDF documents has not yet been formally summarized.

A future dataset version should include:

- Publication year.
- Download date.
- Issuing institution.
- Document type.
- Source URL.
- Regulatory status.

Until this metadata is completed, the dataset should not be presented as representing a defined historical or regulatory period.

---

## Labeling Procedure

Documents were labeled according to their folder location.

```text
Data/relevantes → label 1
Data/no_relevantes → label 0
```

The parent folder of each relevant PDF was used as its thematic category.

The labels reflect the research team’s interpretation of relevance to the selected monitoring topics.

They are not official classifications issued by BCRP, SBS, PCM, or another regulatory institution.

---

## Training and Test Split

The final clean dataset was divided using:

```text
80% training
20% testing
```

The implementation was:

```python
train_test_split(
    df_modelado_limpio,
    test_size=0.20,
    random_state=42,
    stratify=df_modelado_limpio["etiqueta"]
)
```

This produced:

| Partition | Documents |
|---|---:|
| Training | 107 |
| Testing | 27 |

The split was performed:

- After excluding documents without usable text.
- After removing exact duplicates.
- Before evaluating the models.
- With class stratification.
- With a fixed random seed.

---

# 8. Data Preprocessing

## Text Extraction

The primary PDF-text extraction method used:

```text
PyMuPDF
```

A second extraction attempt used:

```text
pypdf
```

The alternative method was applied only to documents whose initial extraction status was:

- Without text.
- Text insufficient.
- Extraction error.

Fourteen documents remained without usable text after both extraction methods.

These documents were excluded from model development.

---

## Minimum Text Requirement

A document was considered to contain sufficient textual content when it had at least:

```text
50 extracted words
```

Documents below this threshold were treated as insufficient for model training.

---

## Duplicate Detection

The extracted text was normalized and converted to a SHA-256 hash.

Documents sharing the same text hash were treated as exact textual duplicates.

Two duplicate records were removed from the modeling dataset.

The original PDF files were not physically deleted.

---

## Data Leakage Control

Duplicate removal occurred before the train-test split.

The project also verified that no identical text hash appeared in both:

- Training data.
- Testing data.

This reduced the risk of artificially inflated evaluation metrics caused by identical documents appearing in both partitions.

---

# 9. Performance

## Evaluation Metrics

The three trained models produced the following results:

| Model | Accuracy | Precision | Recall | F1-score | ROC-AUC |
|---|---:|---:|---:|---:|---:|
| Linear SVM | 1.0000 | 1.0000 | 1.0000 | 1.0000 | 1.0000 |
| Random Forest | 1.0000 | 1.0000 | 1.0000 | 1.0000 | 1.0000 |
| Logistic Regression | 0.9259 | 0.9231 | 0.9231 | 0.9231 | 0.9890 |

### Final selected model

| Metric | Linear SVM value |
|---|---:|
| Accuracy | 1.0000 |
| Precision | 1.0000 |
| Recall | 1.0000 |
| F1-score | 1.0000 |
| ROC-AUC | 1.0000 |

---

## Interpretation of Metrics

### Accuracy

Accuracy represents the proportion of all testing documents classified correctly.

```text
Accuracy = 1.0000
```

In the current test set, the SVM correctly classified every document.

### Precision

Precision indicates the proportion of documents classified as relevant that were actually labeled as relevant.

```text
Precision = 1.0000
```

No false-positive result was observed in the current test set.

### Recall

Recall represents the proportion of relevant documents correctly detected by the model.

```text
Recall = 1.0000
```

No false-negative result was observed in the current test set.

### F1-score

The F1-score is the harmonic mean of precision and recall.

```text
F1-score = 1.0000
```

It indicates perfect balance between precision and recall in the current test partition.

### ROC-AUC

ROC-AUC measures the model’s ability to rank relevant documents above non-relevant documents across different thresholds.

```text
ROC-AUC = 1.0000
```

The test probabilities perfectly separated the two classes in the current evaluation.

---

## Performance Breakdown by Demographic Group

A demographic breakdown is not applicable.

The model processes institutional PDF documents rather than data about individuals.

The dataset does not contain demographic attributes such as:

- Age.
- Gender.
- Ethnicity.
- Religion.
- Health status.
- Socioeconomic status.

The absence of demographic information does not eliminate other forms of bias, such as institutional-source or topic imbalance.

---

## Performance Breakdown by Data Subset

A formal performance breakdown by the following subsets has not yet been completed:

- Issuing institution.
- Regulatory topic.
- Document length.
- Publication year.
- Document type.
- Hard-negative status.
- Source website.
- Number of fragments.

This analysis is recommended before production use.

### Important limitation

The model’s perfect overall test metrics do not prove that it performs equally well for:

- Artificial-intelligence documents.
- Data-protection documents.
- Digital-transformation documents.
- Payment-system documents.
- Risk-management documents.

Some categories contain very few examples.

---

## Probability Interpretation

The SVM was configured using:

```python
probability=True
```

This allows the model to return an estimated probability for the relevant class.

However, the displayed percentage should not be interpreted as a guaranteed real-world probability.

The probability may be affected by:

- Small training dataset.
- Limited test size.
- Class separability.
- Source-specific patterns.
- Probability-calibration method.
- New document distributions.

The current decision threshold is:

```text
0.50
```

A document is classified as relevant when:

```text
probability of relevance ≥ 0.50
```

The threshold has not yet been optimized according to operational costs or risk tolerance.

---

# 10. Evaluation Limitations

## Small test set

The final test set contains only:

```text
27 documents
```

With a small test set:

- One error can substantially change the metrics.
- Perfect results may occur by chance.
- Rare document types may not be represented.
- Confidence intervals would be wide.
- Generalization is uncertain.

---

## Single train-test split

The reported metrics come from one stratified split using:

```text
random_state=42
```

The results may change with a different partition.

The model should also be evaluated using:

- Stratified cross-validation.
- Repeated cross-validation.
- External validation.
- Temporal validation.
- Institution-based validation.

---

## Possible institutional-source leakage

Although exact duplicate leakage was controlled, documents from the same institution may appear in both training and testing.

The model could learn:

- Institutional names.
- Headers.
- Templates.
- Formatting.
- Repeated terminology.
- Writing styles.

A stronger evaluation should separate documents by institution or source.

---

## Limited hard-negative validation

The non-relevant class contains documents unrelated to the selected topics, but the exact number of hard negatives has not been formally recorded.

The model requires more testing with documents that:

- Mention risk but focus on another subject.
- Discuss banking without payment systems.
- Discuss technology without artificial intelligence.
- Mention data without data-protection content.
- Contain similar institutional formatting.
- Use regulatory vocabulary but address an unrelated obligation.

---

## No OCR evaluation

Image-based PDFs were excluded.

The model is not currently validated for:

- Scanned regulations.
- Image-only documents.
- Photocopied documents.
- Low-quality PDF scans.

---

# 11. Limitations

The model has the following known limitations:

1. The final dataset contains only 134 documents.
2. The test partition contains only 27 documents.
3. Relevant subtopics are imbalanced.
4. Cyberdefense has no valid final representation.
5. The model may learn institutional writing patterns.
6. Labels were manually assigned by the research team.
7. No formal inter-annotator agreement was calculated.
8. The publication period is not fully documented.
9. No external test dataset has been published.
10. No institution-separated evaluation has been performed.
11. No temporal validation has been performed.
12. No confidence intervals are reported.
13. No statistical significance test was conducted between models.
14. Probability calibration has not been independently evaluated.
15. Scanned PDFs are not supported.
16. The model only performs binary classification.
17. It does not explain which passages caused the prediction.
18. It does not identify legal obligations or deadlines.
19. It does not cover the complete Peruvian regulatory ecosystem.
20. Perfect test metrics may not generalize to future documents.

---

# 12. Ethical Considerations

The model processes institutional documents rather than personal profiles, but ethical risks remain.

## Automation bias

Users may trust a high probability without manually reviewing the document.

### Mitigation

- Display that the output is a prediction.
- Require human review for high-impact decisions.
- Avoid presenting probabilities as legal certainty.

---

## False negatives

A relevant document may be incorrectly classified as not relevant.

This is particularly important because an omitted regulation could affect compliance monitoring.

### Mitigation

- Prioritize recall during model selection.
- Consider lowering the relevance threshold.
- Periodically review samples classified as not relevant.
- Maintain human monitoring of official sources.

---

## False positives

A non-relevant document may be classified as relevant.

### Mitigation

- Treat the model as a prioritization tool.
- Allow analysts to reject incorrectly prioritized documents.
- Store feedback for future retraining.

---

## Institutional bias

The model may perform better for institutions strongly represented in training.

### Mitigation

- Add documents from more institutions.
- Evaluate performance by source.
- Use institution-separated testing.
- Remove unnecessary institutional headers when appropriate.

---

## Copyright and redistribution

The PDFs may be publicly accessible but still subject to copyright or redistribution restrictions.

### Mitigation

- Verify source permissions.
- Publish source manifests when PDFs cannot be redistributed.
- Separate the code license from dataset permissions.

---

# 13. Recommendations for Appropriate Use

Users should:

1. Treat predictions as preliminary recommendations.
2. Maintain human oversight.
3. Review highly relevant documents manually.
4. Periodically audit documents classified as not relevant.
5. Preserve links to the original official source.
6. Verify that the document contains extractable text.
7. Use the same preprocessing and embedding model.
8. Record the model version used.
9. Log predictions and analyst corrections.
10. Retrain when the regulatory scope changes.

---

# 14. Recommendations for Risk Mitigation

## Increase validation

Perform:

- Stratified five-fold cross-validation.
- Repeated cross-validation.
- External document evaluation.
- Institution-based holdout testing.
- Temporal holdout testing.
- Hard-negative evaluation.

---

## Improve explainability

Future versions should display:

- Most similar training documents.
- Most relevant fragments.
- Topic similarity.
- Important terms or passages.
- Confidence warnings.

---

## Improve labeling quality

Use at least two reviewers and calculate:

```text
Cohen’s kappa
```

Disagreements should be reviewed by a regulatory or legal specialist.

---

## Monitor model drift

The model should be reviewed when:

- New institutions are added.
- New regulatory terminology appears.
- New document templates are adopted.
- The model produces repeated analyst corrections.
- Performance decreases on recent documents.

---

## Establish abstention rules

The model could return:

```text
Manual review required
```

when the probability is close to the decision threshold.

An example uncertainty interval is:

```text
0.40 ≤ probability ≤ 0.60
```

This interval has not yet been validated and should be calibrated before use.

---

# 15. Reproducibility Information

## Random seed

```text
42
```

## Training size

```text
107 documents
```

## Testing size

```text
27 documents
```

## Feature dimension

```text
384
```

## Embedding model

```text
sentence-transformers/paraphrase-multilingual-MiniLM-L12-v2
```

## Final classifier

```text
Linear SVM
```

## Main hyperparameters

```python
SVC(
    kernel="linear",
    probability=True,
    class_weight="balanced",
    random_state=42
)
```

## Classification threshold

```text
0.50
```

## Saved model file

```text
modelos/mejor_modelo_clasificacion.joblib
```

## Saved comparison metrics

```text
resultados/comparacion_modelos.csv
```

---

# 16. Model Maintenance

The model should be retrained when:

- New relevant topics are introduced.
- New institutions are included.
- A significant number of documents is added.
- Incorrect labels are corrected.
- Analyst feedback indicates repeated errors.
- The embedding model changes.
- Preprocessing parameters change.
- The regulatory language evolves.
- External evaluation reveals reduced performance.

A new model version should be assigned whenever:

- Training data changes.
- Hyperparameters change.
- The embedding model changes.
- Classification labels change.
- Preprocessing changes.
- Evaluation methodology changes.

Suggested versioning:

```text
1.0.0 — Initial research prototype
1.1.0 — Additional training documents
1.1.1 — Minor metadata or documentation correction
2.0.0 — New labels, topics, or model architecture
```

---

# 17. Model Status

| Item | Status |
|---|---|
| Research prototype completed | Yes |
| Notebook available | Yes |
| Model saved | Yes |
| Internal test completed | Yes |
| New-PDF prediction tested | Yes |
| Cross-validation completed | No |
| External validation completed | No |
| Institution-based validation completed | No |
| Production approval | No |
| Independent reproducibility test | Pending |
| Human oversight required | Yes |

---

# 18. Model Summary

| Characteristic | Value |
|---|---|
| Model name | Peruvian Regulatory PDF Relevance Classifier |
| Model version | 1.0 |
| Task | Binary document classification |
| Selected algorithm | Linear SVM |
| Input | PDF document |
| Output | Relevant or not relevant |
| Training documents | 107 |
| Testing documents | 27 |
| Input features | 384-dimensional embedding |
| Main language | Spanish |
| Embedding model | `paraphrase-multilingual-MiniLM-L12-v2` |
| Accuracy | 1.0000 |
| Precision | 1.0000 |
| Recall | 1.0000 |
| F1-score | 1.0000 |
| ROC-AUC | 1.0000 |
| Current status | Academic research prototype |
| Production ready | No |
| Human review required | Yes |

---

# 19. References

Beltagy, I., Peters, M. E., and Cohan, A. (2020). Longformer: The Long-Document Transformer. *arXiv preprint arXiv:2004.05150*.

Chalkidis, I., Fergadiotis, M., Malakasiotis, P., Aletras, N., and Androutsopoulos, I. (2020). LEGAL-BERT: The Muppets straight out of Law School. *Findings of the Association for Computational Linguistics: EMNLP 2020*, 2898–2904.

Chalkidis, I., Fergadiotis, M., and Androutsopoulos, I. (2021). MultiEURLEX: A Multi-lingual and Multi-label Legal Document Classification Dataset for Zero-shot Cross-lingual Transfer. *Proceedings of EMNLP 2021*, 6974–6996.

de Arriba-Pérez, F., García-Méndez, S., González-Castaño, F. J., and González-González, J. (2022). Explainable Machine Learning Multi-label Classification of Spanish Legal Judgements. *Journal of King Saud University – Computer and Information Sciences, 34*(10), 10180–10192.

Mamakas, D., Tsotsi, P., Androutsopoulos, I., and Chalkidis, I. (2022). Processing Long Legal Documents with Pre-trained Transformers: Modding LegalBERT and Longformer. *Proceedings of the Natural Legal Language Processing Workshop 2022*, 130–142.

Mitchell, M., Wu, S., Zaldivar, A., Barnes, P., Vasserman, L., Hutchinson, B., Spitzer, E., Raji, I. D., and Gebru, T. (2019). Model Cards for Model Reporting. *Proceedings of the Conference on Fairness, Accountability, and Transparency*, 220–229.

Reimers, N., and Gurevych, I. (2019). Sentence-BERT: Sentence Embeddings Using Siamese BERT-Networks. *Proceedings of EMNLP-IJCNLP 2019*, 3982–3992.

Wan, L., Papageorgiou, G., Seddon, M., and Bernardoni, M. (2019). Long-length Legal Document Classification. *arXiv preprint arXiv:1912.06905*.
