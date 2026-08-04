# Literature Gap Analysis

**Session 4**

## 1. Overview

The literature review examined previous research related to banking regulation, compliance-risk management, artificial intelligence, Regulatory framework, long-document processing, and Machine Learning-based document classification.

The purpose of the review was to determine whether previous studies had developed an artifact directly comparable to the proposed research: a Machine Learning framework capable of classifying Peruvian regulatory and institutional PDF documents as relevant or not relevant for preliminary regulatory monitoring.

The reviewed literature demonstrates that Artificial Intelligence can support:

- Legal-document classification.
- Regulatory-text analysis.
- Compliance monitoring.
- Classification of long legal documents.
- Automated document review.
- Analysis of regulatory and financial information.

Nevertheless, most identified studies focus on international banking contexts, European regulation, court judgments, contracts, credit-risk applications, financial forecasting, responsible AI, or general compliance frameworks.

Within the literature reviewed, no directly comparable study was identified that combines:

- Peruvian regulatory and institutional PDF documents.
- Binary relevance classification.
- Spanish-language institutional content.
- Fragmentation of long PDF documents.
- Comparison of classical Machine Learning algorithms.
- Preliminary filtering before detailed regulatory review.

Therefore, this research addresses a contextual, methodological, and empirical gap through the design and evaluation of a reproducible regulatory-document classification artifact.

---

## 2. Literature Review Question

The literature review was guided by the following question:

> What methods have been used to analyze and classify banking, legal, regulatory, compliance, risk-management, and artificial-intelligence documents, and what limitations remain for their application to Peruvian regulatory PDF documents?

The following supporting questions were considered:

1. What methods are used to represent and classify legal or regulatory documents?
2. What evidence exists for Spanish-language or multilingual legal classification?
3. Can classical Machine Learning models remain useful when combined with pretrained semantic embeddings?
4. What data-quality controls are applied before training document-classification models?
5. Is preliminary document-relevance filtering addressed before detailed compliance analysis?

---

## 3. Information Sources

The literature discovery process used:

- **PRIMO**, the institutional academic-discovery service.
- **Scopus**, a multidisciplinary abstract and citation database.

Supporting methodological studies were also consulted from recognized academic repositories and publisher records when they were directly relevant to:

- Semantic embeddings.
- Legal-domain language models.
- Multilingual legal classification.
- Long-document classification.
- Regulatory text analysis.


---

## 4. Search Strategy

A focused search strategy was applied to identify studies at the intersection of:

1. Banking regulation.
2. Compliance risk.
3. Artificial intelligence.
4. Machine Learning.

The principal conceptual expression was:

```text
("banking regulation framework"
AND "compliance risk"
AND "artificial intelligence")
AND "machine learning"
```

The same conceptual blocks were applied in PRIMO and Scopus, adapting the syntax to the search interface of each database.
The query was intentionally.

---

## PRISMA Flow Diagram

```mermaid
flowchart TD
    A["Records identified from databases<br/>
    Scopus: n = 16<br/>
    PRIMO: n = 9<br/>
    Total: n = 25"]

    B["Records removed before screening<br/>
    Duplicate records: n = 0<br/>
    Records removed for other reasons: n = 0"]

    C["Records screened by title and available description<br/>
    n = 25"]

    D["Records excluded<br/>
    Scopus: n = 7<br/>
    PRIMO: n = 6<br/>
    Total: n = 13"]

    E["Studies retained after screening<br/>
    Scopus: n = 9<br/>
    PRIMO: n = 3<br/>
    Total: n = 12"]

    A --> B
    B --> C
    C --> D
    C --> E
```

## Reasons for Exclusion

| Main reason | Number |
|---|---:|
| General conference proceedings or books without a specific study | 3 |
| Unrelated historical or economic domain | 2 |
| Customer service or complaint classification | 2 |
| General review of AI, FinTech, or blockchain | 3 |
| Unrelated domain, such as patents | 1 |
| No clearly applicable document-classification methodology | 2 |
| **Total excluded** | **13** |

## Studies Retained from Scopus

| No. | Study |
|---:|---|
| 1 | *Cross-Document Emotion Consistency: A Feature Family Framework for Financial Disclosure Risk Screening* |
| 5 | *Artificial Intelligence and Large Language Models in Government Document Management* |
| 6 | *Role of AI in Enterprise Content Management* |
| 7 | *Transforming Records Management in South Africa* |
| 8 | *Analysis on Word Embedding and Classifier Models in Legal Analytics* |
| 9 | *BBRC: Brazilian Banking Regulation Corpora* |
| 10 | *Automated Multi-Page Document Classification and Information Extraction for Insurance Applications* |
| 15 | *A Complete Process of Text Classification System Using State-of-the-Art NLP Models* |
| 16 | *Identifying Banking Transaction Descriptions via Support Vector Machine Short-Text Classification* |

## Studies Retained from PRIMO

| No. | Study |
|---:|---|
| 1 | *Specialized Text Classification: An Approach to Classifying Open Banking Transactions* |
| 2 | *Predicting Firm Financial Performance from SEC Filing Changes Using Automatically Generated Dictionary* |
| 3 | *Banking Regulation Classification in Portuguese* |

### Summary of the Selection Process

A total of 25 records were identified, including 16 records from Scopus and 9 records from PRIMO. No exact duplicate publications were found. After reviewing the titles and available descriptions, 13 records were excluded because they focused on unrelated domains, general conference proceedings, customer service, fraud detection, historical analysis, or topics without a clearly applicable document-classification method.

Consequently, 12 studies were retained for the literature review: 9 from Scopus and 3 from PRIMO.

### Main Studies Supporting the Methodological Foundation

The following studies present the strongest relationship with the developed artifact:

| Study | Project component supported |
|---|---|
| *BBRC: Brazilian Banking Regulation Corpora* | Construction and analysis of a banking-regulation corpus |
| *Banking Regulation Classification in Portuguese* | Classification of banking regulatory documents |
| *Analysis on Word Embedding and Classifier Models in Legal Analytics* | Use of embeddings and classification models in legal texts |
| *Automated Multi-Page Document Classification and Information Extraction for Insurance Applications* | Processing and classification of long, multi-page documents |
| *A Complete Process of Text Classification System Using State-of-the-Art NLP Models* | General design of a complete text-classification pipeline |
| *Artificial Intelligence and Large Language Models in Government Document Management* | Application of Artificial Intelligence to institutional document management |

### Interpretation

The most closely related studies show that the automatic classification of legal, banking, and institutional documents can be addressed through Natural Language Processing techniques, semantic representations, and supervised models.

The studies on banking regulation in Brazil and Portuguese-language regulatory classification are especially relevant because they provide contexts close to the problem addressed in this research. However, based on the available titles and descriptions, none of them appears to address exactly the same combination proposed in this project:

- Peruvian regulatory and institutional documents.
- Binary classification into relevant and not relevant.
- Processing of long PDF documents.
- Overlapping text fragmentation.
- Use of multilingual embeddings.
- Comparison of Logistic Regression, linear SVM, and Random Forest.
- Validation of text extraction.
- Exclusion of documents without usable textual content.
- Detection and removal of duplicate documents.

Therefore, the selected studies provide methodological and contextual background, while the application to the Peruvian regulatory environment represents the specific contribution of this research.
