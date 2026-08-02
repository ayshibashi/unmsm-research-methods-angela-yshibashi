# Datasheet for the Regulatory PDF Dataset

**Session 7**

## 1. Overview

This datasheet documents the dataset created for the research project on automatic relevance classification of Peruvian regulatory and institutional PDF documents.

The dataset was designed to support a binary Machine Learning classification task:

- `0`: Not relevant.
- `1`: Relevant.

A document is considered relevant when its principal content is associated with one or more of the regulatory-monitoring topics defined for the project:

- Payment systems.
- Risk management.
- Artificial intelligence.
- Personal-data protection.
- Digital transformation.

The original dataset contained 150 PDF documents divided into two balanced classes:

| Class | Initial number of documents |
|---|---:|
| Relevant | 75 |
| Not relevant | 75 |
| **Total** | **150** |

After text-extraction validation and duplicate removal, the final modeling dataset contained 134 unique documents with usable textual content.

The dataset was created specifically for an academic Design Science project and should be interpreted as an initial research dataset rather than a complete representation of the Peruvian regulatory environment.

---

# 2. Dataset Identification

## Dataset name

```text
Peruvian Regulatory PDF Relevance Dataset
```

## Suggested short name

```text
PRPRD-1.0
```

## Dataset version

```text
Version 1.0
```

## Dataset type

```text
Manually organized binary document-classification dataset
```

## Primary language

```text
Spanish
```

Some documents may contain:

- English technical terms.
- Acronyms.
- Bibliographic references.
- International regulatory terminology.
- Tables or annexes containing additional language content.

## File format

```text
PDF
```

## Final modeling format

The preprocessing pipeline also produces structured files such as:

```text
CSV
PKL
NPY
JOBLIB
JSON
```

These derived files contain inventories, extracted text, labels, embeddings, partitions, evaluation results, and trained models.

---

# 3. Motivation

## Why was the dataset created?

The dataset was created to evaluate whether a Machine Learning artifact could automatically determine whether a new institutional or regulatory PDF document is relevant to the monitoring interests defined by the research.

Regulatory-monitoring activities may require the manual review of a large number of documents issued by public institutions. Many of these documents may not be directly related to the specific topics monitored by a financial institution.

The dataset supports the development of an initial filtering mechanism that can help distinguish:

- Documents that should be prioritized for detailed review.
- Documents that are unlikely to be relevant to the defined monitoring scope.

The dataset was also created to explore whether pretrained multilingual semantic embeddings and classical Machine Learning models can produce useful results with a relatively small specialized dataset.

---

## What problem is the dataset intended to support?

The dataset is intended to support the following research problem:

> Can a Machine Learning model classify a PDF document as relevant or not relevant for preliminary regulatory monitoring in the Peruvian financial and technological context?

The dataset supports the following technical activities:

1. PDF text extraction.
2. Text-quality validation.
3. Long-document fragmentation.
4. Semantic embedding generation.
5. Binary classification.
6. Model comparison.
7. Prediction of previously unseen PDF documents.

---

## Who funded the creation of the dataset?

No external commercial or institutional funding has been confirmed for the creation of this dataset.

The dataset was assembled as part of an academic research project.

If institutional resources, university access, scholarships, research programs, or other support must be formally acknowledged, this section should be updated with the corresponding information.

---

## Any other comments?

The dataset is not intended to represent every regulation, standard, circular, report, or institutional publication relevant to the Peruvian financial system.

It represents an initial manually constructed sample selected for the development and evaluation of a prototype.

The labels represent relevance according to the scope defined by the research project and should not be interpreted as official legal, regulatory, or institutional classifications.

---

# 4. Composition

## What do the instances that comprise the dataset represent?

Each instance represents one PDF document.

A document may correspond to:

- A regulation.
- A circular.
- An institutional report.
- A technical document.
- A policy document.
- A resolution.
- A guide.
- A digital-transformation document.
- A risk-management publication.
- A payment-system publication.
- An institutional document unrelated to the target topics.

Each PDF is treated as one document-level observation for the final classification task.

Although documents are divided into text fragments for embedding generation, the final prediction is performed at the complete-document level.

---

## How many instances of each type are there?

### Initial dataset

| Class | Documents |
|---|---:|
| Relevant | 75 |
| Not relevant | 75 |
| **Total** | **150** |

### After text-extraction validation

Fourteen documents did not contain sufficient extractable text after attempts with both PyMuPDF and `pypdf`.

| Processing status | Documents |
|---|---:|
| Documents with valid text | 136 |
| Documents excluded because of unavailable or insufficient text | 14 |
| **Total** | **150** |

### After duplicate removal

Two duplicated contents were removed from the valid modeling set.

| Modeling stage | Documents |
|---|---:|
| Valid documents before duplicate removal | 136 |
| Duplicate records removed | 2 |
| **Final unique modeling documents** | **134** |

### Train-test partition

| Partition | Documents |
|---|---:|
| Training | 107 |
| Testing | 27 |
| **Total** | **134** |

The partition used an 80/20 stratified split with:

```python
random_state=42
```

---

## How are the relevant documents distributed by topic?

The initial relevant collection was organized into the following thematic folders:

```text
relevantes/
├── BCRP SISTEMA DE PAGOS
├── CIBERDEFENSA
├── PCM IA
├── PCM PROTECCION DE DATOS
├── PCM TRANSFORMACION DIGITAL
└── SBS GESTION DE RIESGOS
```

The initial counts were:

| Topic | Initial documents |
|---|---:|
| SBS risk management | 22 |
| BCRP payment systems | 21 |
| PCM digital transformation | 19 |
| PCM artificial intelligence | 8 |
| PCM data protection | 4 |
| Cyberdefense | 1 |
| **Total relevant documents** | **75** |

After excluding documents without extractable text, the valid topic distribution was approximately:

| Topic | Valid documents before duplicate removal |
|---|---:|
| SBS risk management | 22 |
| BCRP payment systems | 21 |
| PCM digital transformation | 15 |
| PCM data protection | 4 |
| PCM artificial intelligence | 2 |
| Cyberdefense | 0 |
| **Total relevant valid documents** | **64** |

The Cyberdefense category was not represented in the final modeling dataset because the only available document did not contain extractable text.

The final number by topic may be slightly lower after duplicate removal when two documents contain identical extracted text.

---

## What data does each instance consist of?

The initial inventory contains the following fields:

| Field | Description |
|---|---|
| `archivo` | Original PDF file name |
| `ruta` | Location of the PDF within the project folders |
| `etiqueta` | Binary target: 0 or 1 |
| `clasificacion` | Human-readable class |
| `tema` | Topic obtained from the parent folder |

After PDF processing, the following fields are added:

| Field | Description |
|---|---|
| `texto` | Cleaned extracted text |
| `numero_paginas` | Number of pages |
| `cantidad_palabras` | Number of extracted words |
| `cantidad_caracteres` | Number of extracted characters |
| `estado_extraccion` | Extraction result |
| `mensaje_error` | Extraction error, when applicable |

During alternative recovery, additional fields may include:

| Field | Description |
|---|---|
| `texto_alternativo` | Text obtained with `pypdf` |
| `palabras_alternativas` | Alternative word count |
| `caracteres_alternativos` | Alternative character count |
| `estado_alternativo` | Recovery result |
| `error_alternativo` | Alternative extraction error |

During duplicate detection and modeling, additional fields include:

| Field | Description |
|---|---|
| `hash_texto` | SHA-256 hash of normalized extracted text |
| `fragmentos` | List of overlapping text fragments |
| `cantidad_fragmentos` | Number of fragments per PDF |
| `embedding` | Final document-level semantic vector |

---

## Is there a label or target associated with each instance?

Yes.

The binary target is:

| Label | Meaning |
|---:|---|
| `0` | Not relevant |
| `1` | Relevant |

A relevant document is one whose principal subject is associated with the monitoring topics defined in the research.

A non-relevant document is one whose principal subject is unrelated to those topics, even when it contains isolated terms such as:

- Risk.
- Technology.
- Data.
- Artificial Intelligence.
- Banking.
- Digital systems.

The distinction is intended to reflect the principal content of the document rather than the presence of individual keywords.

---

## How were the labels assigned?

Labels were assigned according to the folder in which each document was manually placed.

```text
Data/relevantes → label 1
Data/no_relevantes → label 0
```

For relevant documents, the immediate parent folder was also used as the topic label.

Examples:

```text
Data/relevantes/BCRP SISTEMA DE PAGOS/documento.pdf
```

produces:

```text
label = 1
classification = Relevant
topic = BCRP SISTEMA DE PAGOS
```

A document located in:

```text
Data/no_relevantes/documento.pdf
```

produces:

```text
label = 0
classification = Not relevant
topic = Not relevant
```

---

## Are there missing values?

The original PDF files do not contain structured missing-value fields because each instance is a document.

However, missing or empty extracted text may occur when:

- The PDF contains only images.
- The PDF has no text layer.
- The document is protected.
- The document structure cannot be interpreted by the extraction library.
- The extracted content is insufficient.

These cases are identified through the field:

```text
estado_extraccion
```

and excluded from training when no usable text is recovered.

---

## Are there errors, sources of noise, or redundancies?

Yes.

The following issues were identified:

### PDFs without extractable text

Fourteen documents did not produce usable text through PyMuPDF.

A second attempt using `pypdf` also failed to recover sufficient text.

These files were excluded from model training but were not physically deleted.

### Duplicate documents

Two duplicated contents were removed from the valid modeling dataset.

Duplicate detection was based on the SHA-256 hash of normalized extracted text.

### Unequal topic representation

Although the binary classes were initially balanced, the relevant topics were not equally represented.

For example:

- Risk management and payment systems contain more documents.
- Artificial intelligence and data protection contain fewer valid documents.
- Cyberdefense contains no valid final document.

### Institutional-source patterns

The model may learn source-specific patterns such as:

- Institutional names.
- Headers and footers.
- Citation formats.
- Document templates.
- Writing styles.
- Repeated regulatory terminology.

This may improve performance within the current dataset while reducing generalization to new institutions.

### Label subjectivity

The distinction between relevant and not relevant was manually established according to the research scope.

Some borderline or hard-negative documents may be open to alternative interpretation.

### Repeated structural text

Institutional PDFs may contain repeated:

- Page headers.
- Page numbers.
- Legal disclaimers.
- Annex titles.
- Institutional signatures.

The current cleaning process does not remove every possible repeated structural element.

---

# 5. Collection Process

## How was the data associated with each instance acquired?

The PDF documents were manually downloaded from publicly accessible institutional or documentary sources.

The principal institutional areas represented include:

- Banco Central de Reserva del Perú.
- Superintendencia de Banca, Seguros y AFP.
- Presidencia del Consejo de Ministros.
- Sources related to personal-data protection.
- Other institutional and technical sources used as non-relevant examples.

The exact source of each document should be recorded in a source manifest whenever possible.

Recommended fields include:

| Field | Description |
|---|---|
| File name | Local PDF name |
| Original title | Official document title |
| Institution | Issuing institution |
| Source URL | Original download location |
| Download date | Date of collection |
| Publication date | Date shown in the document |
| Access status | Public, restricted, or unavailable |
| Redistribution status | Allowed, uncertain, or prohibited |

---

## What mechanisms or procedures were used to collect the data?

The general collection process was:

1. Define the relevant research topics.
2. Identify public institutional sources.
3. Search for PDF documents related to those topics.
4. Download the files.
5. Store them in topic-specific folders.
6. Collect non-relevant institutional documents.
7. Store the non-relevant files in a separate class folder.
8. Generate a programmatic inventory.
9. Validate PDF text extraction.
10. Remove invalid and duplicated documents from the modeling dataset.

The code recursively searches the folders and registers every PDF.

---

## Was the data collected automatically?

The dataset organization and labeling were primarily manual.

The inventory, extraction, validation, duplicate detection, and model-ready transformation were automated through Python.

No automated web crawler was used in the final dataset-preparation pipeline described in the notebook.

If scraping or automated downloading was used outside the final notebook, it should be documented separately in the data-collection protocol.

---

## If the dataset is a sample from a larger set, what was the sampling strategy?

The dataset is a purposive sample rather than a probabilistic sample.

Documents were selected because they were considered useful for representing:

- Relevant regulatory topics.
- Clearly unrelated documents.
- Institutional documents with similar vocabulary.
- Difficult negative examples.

The selection strategy was based on research relevance and availability rather than random sampling from the full universe of Peruvian regulations.

Consequently, the dataset cannot be assumed to statistically represent all documents published by the selected institutions.

---

## Were hard negatives included?

The intended non-relevant class includes documents that may contain isolated vocabulary related to the relevant topics but whose principal subject is different.

Examples may include:

- Economic reports that mention risk but do not focus on risk management.
- Banking documents unrelated to payment systems.
- Technology reports without an Artificial Intelligence focus.
- Administrative regulations.
- Human-resources documents.
- Procurement, logistics, or budget documents.
- Institutional reports that mention a relevant keyword only once.

Hard-negative documents are important because they reduce the likelihood that the model classifies documents solely on isolated keywords.

The exact proportion of hard negatives has not yet been formally quantified.

---

## Who was involved in the data collection process?

The dataset was collected and organized by the research team responsible for the academic project.

The same team defined:

- The relevance criteria.
- The thematic categories.
- The folder organization.
- The exclusion criteria.
- The preprocessing pipeline.

If multiple people participated, their responsibilities should be documented, for example:

| Role | Responsibility |
|---|---|
| Researcher 1 | Relevant-document collection |
| Researcher 2 | Non-relevant-document collection |
| Researcher 3 | Label review |
| Researcher 4 | Technical preprocessing |

The final file should include actual roles only when confirmed.

---

## Was inter-annotator agreement measured?

No formal inter-annotator agreement has yet been reported.

The labels were assigned according to the project’s folder-based relevance criteria.

This creates a risk of subjective labeling, especially for documents close to the decision boundary.

A future version should involve at least two reviewers and calculate an agreement measure such as:

```text
Cohen’s kappa
```

Disagreements should be resolved through discussion or review by a regulatory-domain specialist.

---

## Any ethical review or oversight?

No formal ethics-board approval has been reported for the current dataset.

The project uses institutional PDF documents rather than direct information collected from human participants.

However, ethical and legal review remains necessary for:

- Copyright.
- Redistribution rights.
- Personal information that may appear inside documents.
- Institutional restrictions.
- Terms of use of source websites.
- Potential misuse of the model.

The dataset should not be publicly redistributed until these matters have been reviewed.

---

# 6. Preprocessing, Cleaning, and Labeling

## Was any preprocessing, cleaning, or labeling done?

Yes.

The processing pipeline includes several stages.

### 1. PDF inventory

Every PDF is registered with:

- File name.
- Path.
- Binary label.
- Classification.
- Topic.

### 2. Text extraction

The primary extraction library is:

```text
PyMuPDF
```

### 3. Text cleaning

The extraction process:

- Removes null characters.
- Normalizes repeated whitespace.
- Removes unnecessary line breaks.
- Trims leading and trailing spaces.

### 4. Text-quality validation

Documents are classified as:

```text
Correct
Text insufficient
Without text
Error
```

A document must contain at least:

```text
50 words
```

to be accepted as having sufficient text.

### 5. Alternative recovery

Documents that fail primary extraction are processed with:

```text
pypdf
```

Only documents recovered with sufficient text are reinstated.

### 6. Exclusion

Files that remain without sufficient text are excluded from the modeling dataset.

They are retained in:

```text
documentos_excluidos.csv
```

### 7. Duplicate detection

Extracted text is normalized and converted to a SHA-256 hash.

Documents with identical text hashes are treated as duplicates.

Only the first instance is retained for modeling.

### 8. Train-test division

The clean dataset is split using:

```text
80% training
20% testing
```

The split is:

- Stratified by binary label.
- Reproducible with `random_state=42`.
- Performed after duplicate removal.

### 9. Fragmentation

Each document is divided into:

```text
350-word fragments
50-word overlap
```

### 10. Embedding generation

Every fragment is converted into a semantic vector using:

```text
sentence-transformers/paraphrase-multilingual-MiniLM-L12-v2
```

The fragment vectors are averaged and normalized to obtain one 384-dimensional vector per PDF.

---

## Is the code used to create the dataset available?

Yes.

The principal dataset-preparation and modeling code is contained in the Google Colab notebook:

```text
clasificacion_documentos_pdf_colab.ipynb
```

The notebook is stored in the project’s GitHub repository.

The code includes:

- Folder creation.
- PDF discovery.
- Inventory construction.
- Text extraction.
- Alternative extraction.
- Exclusion reporting.
- Duplicate detection.
- Dataset splitting.
- Text fragmentation.
- Embedding generation.
- Model training.
- Evaluation.
- Prediction of new PDFs.

The repository should also include:

```text
README.md
requirements.txt
.gitignore
```

before final publication.

---

## Are preprocessing outputs stored?

Yes.

The pipeline produces files such as:

```text
inventario_documentos.csv
intento_recuperacion_pypdf.csv
documentos_excluidos.csv
documentos_duplicados.csv
dataset_documentos_validos.pkl
dataset_modelado_limpio.pkl
documentos_train.pkl
documentos_test.pkl
documentos_train_fragmentados.pkl
documentos_test_fragmentados.pkl
X_train_embeddings.npy
X_test_embeddings.npy
y_train.npy
y_test.npy
```

These files help document and reproduce the dataset transformation stages.

---

# 7. Uses

## Has the dataset been used for any tasks already?

Yes.

The dataset has been used for:

1. Binary PDF relevance classification.
2. Comparison of three supervised classifiers:
   - Logistic Regression.
   - Linear SVM.
   - Random Forest.
3. Evaluation using:
   - Accuracy.
   - Precision.
   - Recall.
   - F1-score.
   - ROC-AUC.
   - Confusion matrices.
4. Prediction of a previously unseen PDF.
5. Calculation of document-level relevance probability.

The test results obtained in the current experiment were:

| Model | Accuracy | Precision | Recall | F1-score | ROC-AUC |
|---|---:|---:|---:|---:|---:|
| Linear SVM | 1.0000 | 1.0000 | 1.0000 | 1.0000 | 1.0000 |
| Random Forest | 1.0000 | 1.0000 | 1.0000 | 1.0000 | 1.0000 |
| Logistic Regression | 0.9259 | 0.9231 | 0.9231 | 0.9231 | 0.9890 |

These results must be interpreted cautiously because the final test set contains approximately 27 documents.

---

## What are the intended uses?

The dataset may be used for:

- Academic research.
- Demonstration of PDF-classification pipelines.
- Comparison of lightweight classifiers.
- Study of multilingual semantic embeddings.
- Preliminary regulatory-document prioritization.
- Evaluation of long-document representation strategies.
- Reproducibility exercises.
- Development of improved labeling and validation methods.

---

## Is there anything about the dataset composition that might affect future uses?

Yes.

### Small sample size

The final modeling dataset contains 134 documents.

This limits:

- Statistical confidence.
- Robust hyperparameter tuning.
- Topic-level modeling.
- Generalization claims.

### Topic imbalance

The binary labels are relatively balanced, but the relevant subtopics are not.

### Source imbalance

Some institutions contribute more documents than others.

### Temporal limitations

The dataset may represent only documents available during a particular collection period.

### Institutional-style bias

The classifier may learn the writing style or formatting of known institutions.

### Excluded image-based PDFs

The dataset does not represent OCR-based document processing because image-only documents were excluded.

### Manual labeling

The labels reflect the project scope rather than an official regulatory classification.

### Binary simplification

A document may contain multiple topics, but the current target only indicates whether it is relevant.

---

## Are there tasks for which the dataset should not be used?

Yes.

The dataset should not be used for:

- Automated legal advice.
- Final regulatory-compliance decisions.
- Determining whether an institution complies with the law.
- Extracting authoritative obligations without human review.
- Calculating regulatory sanctions.
- Predicting legal outcomes.
- Replacing lawyers, compliance officers, or risk specialists.
- Evaluating individuals.
- Credit-scoring decisions.
- Fraud detection.
- Customer profiling.
- Political or institutional surveillance.
- Claiming complete coverage of Peruvian regulation.
- Training a reliable multiclass topic classifier without additional data.
- Evaluating OCR systems.
- Production deployment without external validation.

The dataset and resulting model must be used as a decision-support prototype with human oversight.

---

# 8. Distribution

## How is the dataset distributed?

The source code is intended to be distributed through GitHub.

The PDF dataset may be distributed separately through one of the following:

- Google Drive.
- Zenodo.
- Kaggle Datasets.
- Hugging Face Datasets.
- Institutional storage.

The recommended project structure is:

```text
Modelo_ML/
├── Data/
│   ├── relevantes/
│   └── no_relevantes/
├── cache/
├── modelos/
└── resultados/
```

The user must place the `Data` folder inside:

```text
My Drive/Modelo_ML/Data
```

when running the notebook in Google Colab.

---

## Are the original PDFs included in GitHub?

The original PDF collection should not be uploaded directly to GitHub until:

- Redistribution rights are verified.
- File-size restrictions are reviewed.
- Confidentiality is ruled out.
- Source attribution is documented.

The recommended `.gitignore` entry is:

```text
Data/
```

---

## What should be distributed when the PDFs cannot be republished?

When redistribution is not authorized, publish:

- Document inventory.
- Official title.
- Institution.
- Original public URL.
- Download date.
- Label.
- Topic.
- Checksum.
- Instructions for reconstructing the dataset.

This allows another researcher to recreate the dataset from original public sources.

---

## When will the dataset be distributed?

The dataset should be distributed after:

1. Source verification.
2. Copyright and licensing review.
3. Removal of confidential or personal information.
4. Completion of the source manifest.
5. Final label review.
6. Assignment of a dataset version.
7. Documentation of access instructions.
8. Independent reproducibility testing.

Until these actions are completed, the dataset should be treated as an internal academic research asset.

---

## What license applies?

No final dataset license has yet been assigned.

The license for the code and the license for the PDF collection must be considered separately.

Possible code licenses include:

```text
MIT License
Apache License 2.0
```

A code license does not automatically authorize redistribution of third-party PDF documents.

The dataset license must respect the rights and conditions of the original document issuers.

---

# 9. Maintenance

## Who is supporting, hosting, or maintaining the dataset?

The dataset is currently maintained by the research team responsible for the academic project.

The code is hosted in the corresponding GitHub repository.

The working dataset is stored in Google Drive during development.

Before final publication, the project should identify:

- Dataset owner.
- Technical maintainer.
- Repository maintainer.
- Contact person.
- Institutional affiliation.

---

## How can the owner be contacted?

The final public version should provide a project contact using one of the following:

```text
GitHub Issues
Institutional email
Project repository contact section
```

Recommended wording:

```markdown
For questions, corrections, or access requests, open an issue in the project repository or contact the research team through the institutional communication channel documented in the README.
```

Do not publish personal contact information unless the owner explicitly approves it.

---

## Will the dataset be updated?

Updates may be performed when:

- New relevant documents are collected.
- New non-relevant or hard-negative documents are added.
- Incorrect labels are identified.
- Duplicate documents are discovered.
- Additional institutions are incorporated.
- OCR support is implemented.
- New topics are included.
- Source URLs change.
- Legal redistribution conditions are clarified.

---

## How will versions be managed?

A recommended versioning strategy is:

```text
1.0.0
```

where:

- The first number represents major changes to scope or labels.
- The second number represents new documents.
- The third number represents corrections or metadata updates.

Examples:

```text
1.0.0 — Initial research dataset
1.1.0 — New documents added
1.1.1 — Metadata corrections
2.0.0 — New labeling scheme or multiclass target
```

Each release should document:

- Number of documents added.
- Number removed.
- Label changes.
- New institutions.
- New topics.
- Changes to preprocessing.
- Updated hashes.
- Updated train-test recommendation.

---

## How can errors be reported?

Errors may include:

- Incorrect labels.
- Broken source URLs.
- Duplicate files.
- Incorrect institution.
- Incorrect topic.
- Copyright concerns.
- Personal information.
- Extraction inconsistencies.

Errors should be reported through:

```text
GitHub Issues
```

Each report should include:

- File name.
- Description of the problem.
- Suggested correction.
- Supporting source, when available.

---

## Will previous versions remain available?

When possible, previous versions should be preserved through:

- GitHub Releases.
- Zenodo versions.
- Dataset snapshots.
- Archived manifests.

Original PDF files should not be silently replaced.

Changes should be recorded in:

```text
CHANGELOG.md
```

---

# 10. Known Limitations

The dataset has the following known limitations:

1. Small final sample size.
2. Limited institutional coverage.
3. Unequal relevant-topic distribution.
4. No final Cyberdefense representation.
5. No OCR support in the current version.
6. Manual relevance labeling.
7. No formal inter-annotator agreement.
8. Potential institutional-style bias.
9. Limited external validation.
10. Possible copyright restrictions.
11. No permanent public dataset repository yet.
12. No formal data-versioning system.
13. The current test set is small.
14. Perfect test results may not generalize.
15. The dataset does not represent the complete Peruvian regulatory ecosystem.

---

# 11. Recommended Future Improvements

Future versions should:

1. Increase the number of documents.
2. Add additional hard negatives.
3. Balance the relevant topics.
4. Collect valid Cyberdefense documents.
5. Add OCR for scanned PDFs.
6. Use two or more label reviewers.
7. Calculate inter-annotator agreement.
8. Add source and publication-date metadata.
9. Publish file-level checksums.
10. Create a permanent dataset repository.
11. Define a redistribution license.
12. Add external institutions.
13. Conduct temporal validation.
14. Develop a multiclass topic dataset.
15. Create an external test set that remains completely separate from model development.

---

# 12. Dataset Summary

| Characteristic | Value |
|---|---|
| Initial PDF documents | 150 |
| Initial relevant documents | 75 |
| Initial non-relevant documents | 75 |
| Documents excluded because of text extraction | 14 |
| Valid documents before duplicate removal | 136 |
| Duplicate records removed | 2 |
| Final unique modeling documents | 134 |
| Training documents | 107 |
| Testing documents | 27 |
| Main language | Spanish |
| Target type | Binary |
| Relevant label | 1 |
| Not-relevant label | 0 |
| Fragment size | 350 words |
| Fragment overlap | 50 words |
| Embedding model | `paraphrase-multilingual-MiniLM-L12-v2` |
| Embedding dimension | 384 |
| Dataset version | 1.0 |
| Distribution status | Pending licensing and access review |
