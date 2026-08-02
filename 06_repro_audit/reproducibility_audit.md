# Reproducibility Audit Report

**Session 6**

## 1. Overview

This report evaluates the reproducibility of the regulatory-document classification pipeline developed in this research.

The purpose of the audit is to determine whether another researcher, student, or evaluator can:

1. Access the source code.
2. Configure the execution environment.
3. Obtain or organize the required PDF documents.
4. Reproduce the preprocessing steps.
5. Regenerate the document embeddings.
6. Train and evaluate the Machine Learning models.
7. Classify a previously unseen PDF document.
8. Verify the reported results.

The current implementation was developed in Google Colab and uses Google Drive for persistent storage.

The complete pipeline includes:

1. Google Drive connection.
2. Project-folder configuration.
3. PDF inventory creation.
4. Text extraction with PyMuPDF.
5. Alternative extraction with `pypdf`.
6. Exclusion of documents without sufficient extractable text.
7. Duplicate detection using SHA-256 hashes.
8. Stratified train-test division.
9. Text fragmentation.
10. Multilingual embedding generation.
11. Training of Logistic Regression, linear SVM, and Random Forest.
12. Model evaluation.
13. Selection of the best-performing model.
14. Classification of a new PDF document.

---

# 2. Audit Scope

The audit covers the following project components:

- Google Colab notebook.
- GitHub repository.
- Python dependencies.
- Google Drive folder structure.
- PDF dataset organization.
- Preprocessing code.
- Train-test separation.
- Embedding generation.
- Model training and evaluation.
- Saved intermediate outputs.
- Documentation.
- Dataset-access instructions.
- Randomness control.
- Expected outputs.

The audit does not evaluate the legal accuracy of the relevance labels or the institutional validity of the selected regulatory topics.

---

# 3. Reproducibility Checklist

## 3.1 Code and Version Control

- [x] Main notebook stored in version control.
- [x] Google Colab notebook uploaded to GitHub.
- [x] Code organized in sequential execution stages.
- [x] Functions include comments or docstrings.
- [x] Machine Learning random seeds are documented.
- [ ] All project files are currently stored in version control.
- [ ] Exact dependency versions are pinned.
- [ ] A tagged project release has been created.
- [ ] Automated tests have been implemented.
- [ ] Continuous integration has been configured.

### Current evidence

The principal notebook is stored as:

```text
clasificacion_documentos_pdf_colab.ipynb
```

The notebook contains the complete execution workflow from PDF inventory creation to prediction of a new PDF document.

The principal random seed used is:

```python
random_state=42
```

It is applied to:

- `train_test_split`
- Logistic Regression
- Linear SVM
- Random Forest

### Current limitation

The repository must still include or complete:

- `README.md`
- `requirements.txt`
- `.gitignore`
- Dataset-access instructions
- Screening matrix for the literature review
- Optional model and result documentation

---

## 3.2 Execution Environment

- [x] The execution platform is documented as Google Colab.
- [x] Required libraries are installed from the notebook.
- [x] Google Drive mounting is included.
- [x] The notebook can create output folders automatically.
- [ ] A Docker environment has been implemented.
- [ ] A Conda environment file has been implemented.
- [ ] Python and package versions are fully pinned.
- [ ] The notebook has been tested in a completely independent account.
- [ ] The notebook has been tested in a local Jupyter environment.

### Current environment

The project was developed using:

```text
Google Colab
Python 3
Google Drive
```

The notebook installs the required libraries using:

```python
!pip install -q pymupdf pypdf sentence-transformers joblib tqdm
```

Other packages such as Pandas, NumPy, Matplotlib, and Scikit-learn are normally included in Google Colab.

### Reproducibility risk

Installing packages without exact versions may produce different behavior if a future package release changes:

- Function parameters.
- Default behavior.
- Model serialization.
- Tokenization.
- Embedding generation.
- Evaluation outputs.

### Recommended improvement

Create a pinned `requirements.txt`, for example:

```text
pymupdf==1.26.3
pypdf==5.9.0
pandas==2.2.2
numpy==2.0.2
matplotlib==3.10.0
scikit-learn==1.6.1
sentence-transformers==5.0.0
joblib==1.5.1
tqdm==4.67.1
```

The exact versions must be confirmed from the final successful Google Colab execution before publication.

A version-reporting cell should be added to the notebook:

```python
import sys
import fitz
import pypdf
import pandas as pd
import numpy as np
import sklearn
import sentence_transformers
import joblib
import tqdm

print("Python:", sys.version)
print("PyMuPDF:", fitz.version)
print("pypdf:", pypdf.__version__)
print("pandas:", pd.__version__)
print("numpy:", np.__version__)
print("scikit-learn:", sklearn.__version__)
print(
    "sentence-transformers:",
    sentence_transformers.__version__
)
print("joblib:", joblib.__version__)
print("tqdm:", tqdm.__version__)
```

---

## 3.3 Path Configuration

- [x] The Google Drive mount point is documented.
- [x] Output directories are created automatically.
- [x] The dataset-folder structure is documented.
- [ ] All hardcoded paths have been removed.
- [ ] A configurable project-root parameter has been implemented.
- [ ] Local and Colab execution are both supported.

### Current path configuration

The project currently uses:

```python
RUTA_PROYECTO = Path(
    "/content/drive/MyDrive/Modelo_ML"
)
```

This works in Google Colab when the user creates or copies the project into:

```text
My Drive/Modelo_ML
```

### Folders created automatically

The notebook creates:

```text
Modelo_ML/
├── Data/
│   ├── relevantes/
│   └── no_relevantes/
├── cache/
├── modelos/
└── resultados/
```

The folders can be created with:

```python
rutas_proyecto = [
    RUTA_RELEVANTES,
    RUTA_NO_RELEVANTES,
    RUTA_RESULTADOS,
    RUTA_MODELOS,
    RUTA_CACHE
]

for ruta in rutas_proyecto:
    ruta.mkdir(
        parents=True,
        exist_ok=True
    )
```

### Current limitation

Although the folders are created automatically, the notebook does not automatically download or copy the PDF dataset.

The user must place the dataset in:

```text
/content/drive/MyDrive/Modelo_ML/Data
```

### Recommended improvement

Allow the user to configure the project root in one cell:

```python
from pathlib import Path

NOMBRE_CARPETA_PROYECTO = "Modelo_ML"

RUTA_PROYECTO = (
    Path("/content/drive/MyDrive")
    / NOMBRE_CARPETA_PROYECTO
)
```

A local-execution option may also be added:

```python
try:
    from google.colab import drive

    ES_COLAB = True
    drive.mount("/content/drive")

except ImportError:
    ES_COLAB = False


if ES_COLAB:
    RUTA_PROYECTO = Path(
        "/content/drive/MyDrive/Modelo_ML"
    )
else:
    RUTA_PROYECTO = Path.cwd()
```

---

## 3.4 Data Availability and Organization

- [x] The dataset folder structure is documented.
- [x] Relevant and non-relevant classes are separated.
- [x] Relevant documents preserve thematic subfolders.
- [x] Document labels are generated from folder placement.
- [x] The initial PDF inventory is saved.
- [x] Excluded documents are documented.
- [x] Duplicate documents are documented.
- [ ] The complete dataset is available through a permanent public repository.
- [ ] A dataset license has been documented.
- [ ] A dataset version identifier has been assigned.
- [ ] Data Version Control has been implemented.
- [ ] File-level checksums for the original dataset have been published.

### Expected dataset structure

```text
Data/
├── relevantes/
│   ├── BCRP SISTEMA DE PAGOS/
│   ├── PCM IA/
│   ├── PCM PROTECCION DE DATOS/
│   ├── PCM TRANSFORMACION DIGITAL/
│   └── SBS GESTION DE RIESGOS/
│
└── no_relevantes/
    ├── document_001.pdf
    ├── document_002.pdf
    └── ...
```

### Data-access requirement

A public or institutionally accessible link must be provided for:

```text
Data.zip
```

The access instructions should explain:

1. Download `Data.zip`.
2. Extract the file.
3. Copy the `Data` folder into:

```text
My Drive/Modelo_ML/Data
```

4. Confirm that the following folders contain PDF documents:

```text
Data/relevantes
Data/no_relevantes
```

### Data-sharing limitation

Before publishing the PDF collection, the research team must verify:

- The documents are public.
- Redistribution is legally permitted.
- The PDFs contain no confidential information.
- No personal or restricted data are included.
- Source attribution is preserved.

When redistribution is not allowed, the repository should publish:

- Source URLs.
- Document titles.
- Download dates.
- Institutional source.
- A reconstruction script or manual download instructions.

---

## 3.5 Data Versioning

- [ ] DVC has been implemented.
- [ ] Dataset releases are versioned.
- [ ] Original and processed datasets have explicit version numbers.
- [ ] Dataset changes are tracked automatically.
- [x] Intermediate datasets are saved with descriptive names.
- [x] Original PDF files are not physically deleted during preprocessing.

### Current approach

The project preserves the original files and creates new processed artifacts.

Examples include:

```text
inventario_documentos.csv
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

### Recommended improvement

For the current academic prototype, a simple dataset version can be documented as:

```text
Dataset version: 1.0
Original records: 150 PDF documents
Valid after extraction: 136
Final after duplicate removal: 134
```

A dataset manifest should be created:

```text
resultados/dataset_manifest.csv
```

Suggested fields:

| Field | Description |
|---|---|
| File name | PDF name |
| Relative path | Dataset-relative location |
| Class | Relevant or not relevant |
| Topic | Topic folder |
| Original hash | File hash |
| Text hash | Extracted-text hash |
| Extraction status | Correct, recovered, or excluded |
| Included in model | Yes or No |
| Dataset version | Version identifier |

DVC may be implemented later if the dataset changes frequently.

---

## 3.6 Data Preprocessing

- [x] PDF inventory generation is reproducible.
- [x] Primary extraction method is documented.
- [x] Alternative extraction method is documented.
- [x] Minimum-text threshold is documented.
- [x] Exclusion decisions are saved.
- [x] Duplicate detection is reproducible.
- [x] Duplicate removal occurs before dataset splitting.
- [x] Text-fragment size is documented.
- [x] Fragment overlap is documented.
- [x] Train-test division is stratified.
- [x] Information-leakage checking is included.

### Extraction methods

Primary extraction:

```text
PyMuPDF
```

Alternative recovery method:

```text
pypdf
```

A document is initially considered valid when it contains at least:

```text
50 words
```

Documents without sufficient text after both extraction methods are excluded from model training but retained in the exclusion report.

### Duplicate detection

The normalized extracted text is hashed using:

```text
SHA-256
```

Only one copy of identical textual content is retained.

### Train-test division

The clean dataset is divided using:

```text
80% training
20% testing
```

with:

```python
random_state=42
stratify=df_modelado_limpio["etiqueta"]
```

### Fragmentation parameters

```text
Fragment size: 350 words
Overlap: 50 words
Step: 300 words
```

These parameters are explicitly documented and applied equally to training, testing, and new-document prediction.

---

## 3.7 Embedding Generation

- [x] Embedding-model name is documented.
- [x] Embedding dimensionality is verified.
- [x] Fragment embeddings are generated reproducibly.
- [x] Document-level aggregation is documented.
- [x] Embeddings are normalized.
- [x] Embeddings are saved.
- [x] Missing and infinite values are validated.
- [ ] Embedding-model revision is pinned.
- [ ] Model files are locally archived.

### Embedding model

The project uses:

```text
sentence-transformers/paraphrase-multilingual-MiniLM-L12-v2
```

Expected vector dimension:

```text
384
```

### Document-level representation

The process is:

```text
PDF
→ cleaned text
→ overlapping fragments
→ one embedding per fragment
→ mean aggregation
→ vector normalization
→ one 384-dimensional vector per PDF
```

### Reproducibility risk

The Hugging Face model name is documented, but the exact model revision or commit hash is not currently pinned.

### Recommended improvement

Record:

- Model repository.
- Model revision.
- Download date.
- Embedding dimension.
- Normalization configuration.
- Pooling method.

---

## 3.8 Model Training

- [x] Algorithms are documented.
- [x] Hyperparameters are documented in the notebook.
- [x] Random seeds are used.
- [x] Class weighting is documented.
- [x] Models use the same train-test division.
- [x] Models use the same embeddings.
- [x] Trained models are saved.
- [ ] Hyperparameter optimization is independently reproducible.
- [ ] Cross-validation results are available.
- [ ] External validation dataset is available.

### Models evaluated

```text
Logistic Regression
Linear Support Vector Machine
Random Forest
```

### Main configurations

#### Logistic Regression

```python
LogisticRegression(
    max_iter=2000,
    class_weight="balanced",
    random_state=42
)
```

#### Linear SVM

```python
SVC(
    kernel="linear",
    probability=True,
    class_weight="balanced",
    random_state=42
)
```

#### Random Forest

```python
RandomForestClassifier(
    n_estimators=300,
    class_weight="balanced",
    random_state=42,
    n_jobs=-1
)
```

### Model-selection criterion

The models are ranked using:

1. F1-score.
2. Recall.
3. ROC-AUC.

The selected model is saved as:

```text
mejor_modelo_clasificacion.joblib
```

---

## 3.9 Analysis and Evaluation

- [x] Accuracy is calculated.
- [x] Precision is calculated.
- [x] Recall is calculated.
- [x] F1-score is calculated.
- [x] ROC-AUC is calculated.
- [x] Confusion matrices are generated.
- [x] A comparison table is generated.
- [x] A comparison chart is generated.
- [x] Metrics are saved to CSV.
- [ ] Cross-validation has been completed.
- [ ] Confidence intervals have been reported.
- [ ] External testing has been completed.
- [ ] Statistical comparison between models has been performed.

### Reported model results

The current test-set evaluation produced:

| Model | Accuracy | Precision | Recall | F1-score | ROC-AUC |
|---|---:|---:|---:|---:|---:|
| Linear SVM | 1.0000 | 1.0000 | 1.0000 | 1.0000 | 1.0000 |
| Random Forest | 1.0000 | 1.0000 | 1.0000 | 1.0000 | 1.0000 |
| Logistic Regression | 0.9259 | 0.9231 | 0.9231 | 0.9231 | 0.9890 |

### Interpretation limitation

The results are preliminary because:

- The final dataset contains approximately 134 documents.
- The test set contains approximately 27 documents.
- A single misclassification changes the metrics considerably.
- SVM and Random Forest obtained perfect test results.
- Perfect results may reflect a relatively easy or source-specific separation.
- External and hard-negative validation is still required.

---

## 3.10 Intermediate Outputs

- [x] Initial inventory is saved.
- [x] Extraction results are saved.
- [x] Recovery-attempt results are saved.
- [x] Excluded records are saved.
- [x] Duplicate records are saved.
- [x] Clean dataset is saved.
- [x] Train and test partitions are saved.
- [x] Fragmented datasets are saved.
- [x] Embeddings and labels are saved.
- [x] Trained model is saved.
- [x] Evaluation metrics are saved.
- [ ] All outputs are currently committed to GitHub.
- [ ] Output-file checksums are published.

### Main output directories

```text
Modelo_ML/
├── resultados/
├── modelos/
└── cache/
```

### Reproducibility consideration

The `cache` directory makes it possible to continue from intermediate stages without repeating PDF extraction or embedding generation.

However, a full clean reproduction should begin from the original PDF dataset.

---

## 3.11 New-Document Prediction

- [x] A new PDF can be uploaded from the user’s computer.
- [x] The same extraction method is used.
- [x] The same text-cleaning method is used.
- [x] The same fragmentation parameters are used.
- [x] The same embedding model is used.
- [x] The selected classifier is used.
- [x] Classification and probability are displayed.
- [x] Invalid PDFs are handled.
- [ ] A fixed external validation set has been published.
- [ ] Prediction results are automatically logged.

### Expected prediction output

```text
Document: new_document.pdf
Classification: Relevant
Label: 1
Probability of relevance: 88.40%
Number of pages: 18
Number of words: 5,230
Number of fragments: 18
```

---

## 3.12 Documentation

- [x] Notebook stages are documented.
- [x] Main functions contain docstrings.
- [x] Methodology is explained in Markdown cells.
- [x] Expected outputs are shown.
- [x] Research-paradigm justification is documented.
- [x] Literature-gap analysis is documented.
- [x] Systematic-review protocol is documented.
- [ ] Final README is complete.
- [ ] Dataset license is documented.
- [ ] Model card is complete.
- [ ] Data-management plan is complete.
- [ ] Reproduction has been independently tested.

### Required README sections

The final `README.md` should contain:

1. Project overview.
2. Research objective.
3. Dataset description.
4. Repository structure.
5. Google Colab execution instructions.
6. Google Drive folder structure.
7. Dataset-access link or reconstruction instructions.
8. Dependency installation.
9. Full execution order.
10. Expected outputs.
11. Known limitations.
12. Ethical and legal considerations.
13. Citation information.
14. Contact or maintainer information.

---

# 4. Audit Results

## 4.1 Reproducibility Score

### Score

```text
3.5 / 5
```

### Interpretation

| Score | Meaning |
|---:|---|
| 1 | Not reproducible |
| 2 | Major reproducibility deficiencies |
| 3 | Partially reproducible |
| 4 | Reproducible with minor limitations |
| 5 | Fully reproducible and independently verified |

The project is currently **partially reproducible and close to a reproducible academic prototype**.

The main pipeline can be executed again when the user has:

- Access to Google Colab.
- Access to the PDF dataset.
- The required folder structure.
- Internet access for library and embedding-model installation.

However, complete independent reproduction has not yet been demonstrated.

---

## 4.2 Category Scores

| Category | Score | Justification |
|---|---:|---|
| Code availability | 4/5 | Main notebook is available in GitHub |
| Environment | 3/5 | Colab setup exists, but versions are not fully pinned |
| Data accessibility | 2/5 | Structure is documented, but permanent access and licensing remain pending |
| Preprocessing | 4.5/5 | Steps and parameters are clearly implemented |
| Model training | 4/5 | Models, seeds, and hyperparameters are documented |
| Evaluation | 3.5/5 | Multiple metrics are included, but external validation is pending |
| Documentation | 3.5/5 | Extensive notebook documentation exists; README remains incomplete |
| Independent verification | 1/5 | No independent reproduction has yet been recorded |

---

# 5. Issues Found

## Issue 1: Dependencies are not fully pinned

The notebook installs libraries without exact versions. Future updates may modify the output or create compatibility problems.

### Risk

```text
Medium
```

### Required action

Create and test a pinned `requirements.txt`.

---

## Issue 2: Dataset access is not yet independently reproducible

The notebook creates folders but does not automatically obtain the PDF dataset.

### Risk

```text
High
```

### Required action

Provide one of the following:

- Public `Data.zip` link.
- Zenodo dataset.
- Kaggle dataset.
- Hugging Face dataset.
- Source manifest with reconstruction instructions.

The legal right to redistribute the documents must be verified.

---

## Issue 3: The Google Drive project path is hardcoded

The current path is:

```text
/content/drive/MyDrive/Modelo_ML
```

### Risk

```text
Low to medium
```

### Required action

Create one configurable path cell and document the expected folder name.

---

## Issue 4: No formal data versioning is implemented

The dataset may change without a documented version or change history.

### Risk

```text
Medium
```

### Required action

At minimum, publish:

- Dataset version.
- Document count.
- Source manifest.
- File hashes.
- Change log.

DVC may be added later if active dataset development continues.

---

## Issue 5: Independent reproduction has not been completed

The complete notebook has not yet been executed by another person from a clean Google account and empty Drive folder.

### Risk

```text
High
```

### Required action

Ask another student or the instructor to:

1. Open the GitHub notebook in Colab.
2. Download or reconstruct the dataset.
3. Execute all cells.
4. Record package versions.
5. Compare the final metrics.
6. Report deviations.

---

## Issue 6: Perfect test metrics require additional validation

Linear SVM and Random Forest obtained perfect results on a small test set.

### Risk

```text
High
```

### Required action

Perform:

- Stratified cross-validation.
- Hard-negative testing.
- External PDF testing.
- Source-based error analysis.
- Confidence-interval reporting, when possible.

---

## Issue 7: The embedding-model revision is not pinned

The model name is documented, but not the exact repository revision.

### Risk

```text
Low to medium
```

### Required action

Record the Hugging Face model revision or commit hash used during final execution.

---

## Issue 8: The systematic-review screening matrix is incomplete

The literature review identified 34 records, but duplicate checking and full screening remain pending.

### Risk

```text
Medium
```

### Required action

Complete:

```text
04_literature/screening_matrix.csv
```

and update both:

```text
systematic_review.md
gap_analysis.md
```

with the final PRISMA numbers.

---

# 6. Recommendations

## Recommendation 1: Complete the GitHub repository

The final repository should contain:

```text
project/
├── README.md
├── requirements.txt
├── .gitignore
├── clasificacion_documentos_pdf_colab.ipynb
├── 01_paradigm/
├── 02_method/
├── 03_protocol/
├── 04_literature/
├── 05_pipeline/
├── 06_repro_audit/
├── 07_model_card/
├── 09_ethics/
└── 10_data_mgmt/
```

---

## Recommendation 2: Add a reproducibility configuration cell

Add a cell containing all configurable values:

```python
CONFIG = {
    "project_folder": "Modelo_ML",
    "random_seed": 42,
    "test_size": 0.20,
    "minimum_words": 50,
    "chunk_size": 350,
    "chunk_overlap": 50,
    "embedding_model": (
        "sentence-transformers/"
        "paraphrase-multilingual-MiniLM-L12-v2"
    ),
    "embedding_batch_size": 16,
    "classification_threshold": 0.50
}

CONFIG
```

All subsequent cells should use values from `CONFIG`.

---

## Recommendation 3: Generate an execution manifest

At the end of the notebook, save:

- Execution date.
- Python version.
- Package versions.
- Dataset counts.
- Random seed.
- Embedding model.
- Selected classifier.
- Evaluation metrics.

Example:

```python
from datetime import datetime
import json
import platform
import sklearn
import sentence_transformers

manifest = {
    "execution_date": datetime.now().isoformat(),
    "python_version": platform.python_version(),
    "scikit_learn_version": sklearn.__version__,
    "sentence_transformers_version": (
        sentence_transformers.__version__
    ),
    "random_seed": 42,
    "original_documents": 150,
    "valid_documents": 136,
    "final_documents": 134,
    "train_documents": len(df_train),
    "test_documents": len(df_test),
    "embedding_model": NOMBRE_MODELO_EMBEDDINGS,
    "selected_model": mejor_nombre_modelo,
    "metrics": (
        df_metricas
        .round(6)
        .to_dict(orient="records")
    )
}

ruta_manifest = (
    RUTA_RESULTADOS / "execution_manifest.json"
)

with open(
    ruta_manifest,
    "w",
    encoding="utf-8"
) as archivo:
    json.dump(
        manifest,
        archivo,
        ensure_ascii=False,
        indent=4
    )

print("Execution manifest saved in:")
print(ruta_manifest)
```

---

## Recommendation 4: Test from a clean account

A full reproducibility test should be performed from:

- A different Google account.
- A new Colab runtime.
- An empty `Modelo_ML` folder.
- A newly downloaded dataset.

The tester should not use previously generated cache files.

---

## Recommendation 5: Publish expected outputs

The README should state the approximate expected results:

```text
Initial PDF files: 150
Documents with valid text: 136
Final documents after duplicate removal: 134
Training documents: 107
Testing documents: 27
Embedding dimensions: 384
```

The exact values should be generated directly from the final execution rather than manually typed when possible.

---

## Recommendation 6: Add cross-validation

Because the dataset is small, use stratified cross-validation to assess stability.

Suggested strategy:

```text
Stratified 5-fold cross-validation
```

This should complement, not replace, the final held-out test set.

---

## Recommendation 7: Publish a model card

Document:

- Intended use.
- Out-of-scope use.
- Training data.
- Model type.
- Metrics.
- Limitations.
- Ethical risks.
- Recommended human oversight.
- Retraining conditions.

The model card should be stored in:

```text
07_model_card/
```

---

# 7. Final Audit Decision

## Status

- [ ] Pass
- [ ] Fail
- [x] Conditional Pass

## Justification

The research pipeline is sufficiently documented and implemented to support reproduction in Google Colab. The main preprocessing, embedding, training, evaluation, and prediction stages are available and use documented parameters.

However, full reproducibility remains conditional on completing the following actions:

1. Publish or clearly document dataset access.
2. Pin package versions.
3. Complete the README.
4. Replace the hardcoded path with a configurable value.
5. Test the notebook from a clean external account.
6. Complete the systematic-review screening matrix.
7. Perform additional validation of the perfect model results.

---

# 8. Sign-off

- **Auditor:** Research team
- **Audit date:** 2 August 2026
- **Reproducibility score:** 3.5/5
- **Status:** Conditional Pass

## Conditions required for full pass

- [ ] Dependency versions confirmed and pinned.
- [ ] Dataset access tested.
- [ ] Dataset licensing documented.
- [ ] README completed.
- [ ] Clean-environment reproduction completed.
- [ ] Final metrics compared against the original execution.
- [ ] Screening matrix and PRISMA counts completed.
- [ ] External or cross-validation evidence added.

When these conditions are satisfied, the project may be reassessed for a score of:

```text
4.5–5.0 / 5
```
