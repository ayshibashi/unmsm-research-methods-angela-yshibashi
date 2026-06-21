# Research Protocol v0.1

**Session 3 - Initial Draft**

## Overview

*The original system (Radar Regulatorio) starts by collecting all documents published by regulatory authorities on a daily basis*


## Research Design

*The success of the Brazilian BBRC was based on expert annotation

For BETO to learn, we will need legal or compliance specialists in Peru to tag an initial set of documents as "Relevant" or "Irrelevant" for specific departments (e.g., Treasury, Risks, Audit)

The sources warn that this task is subjective but vital: a misclassification could lead to expensive fines, restrictions, or sanctions for the bank*

## Participants/Data

*To clasif the data we need expert experience, and the data is public in regulators web and peruvian national newspaper and in the SPIJ specialist DB *

## Procedure

*Implementing BETO (The AI Engine)
Although the sources use BERTimbau for Portuguese, the process for BETO in Spanish would be identical:
Technical Superiority: Experiments show that BERT-type models are superior when data is imbalanced (i.e., when there are thousands of irrelevant regulations and only a few important ones), which is the typical scenario in banking regulation

Recommended Configuration: According to the benchmarks, we should configure your model with a maximum length of 512 tokens, a batch size of 20, and use the AdamW optimizer with a learning rate of 1e-5 and an epsilon of 1e-8

Preprocessing: Unlike traditional models, you should not remove stop words or over-simplify the text when using BETO, in order to maintain the richness of the legal language*

## Data Collection

*In Peru: You would need to automate the download of regulations from entities such as the SBS (Superintendency of Banking, Insurance, and AFP), the BCRP (Central Reserve Bank of Peru), the SMV (Superintendency of the Securities Market), and the official newspaper El Peruano.
Using Drive: While we can use Google Drive as an initial repository, the study suggests that for training and production, we will need to process these files to extract the plain text (the text column), its length, and the regulatory identifier*

## Analysis Plan

*A Hybrid Approach (AI + Rules)
A key detail from the study is that they did not use AI alone. The system operates with a hybrid pipeline:

1. AI Prediction (BETO): Classifies relevance based on context
2. Deterministic Rules (Regex): Searches for specific keywords or filters by desired or undesired regulators and document types. This is especially useful at the beginning of the project when we have fewer annotated samples to train the model.

Challenges to Consider
Data Imbalance: Most Peruvian regulations will likely be irrelevant for a given department. The study suggests using undersampling techniques so the model learns to better distinguish the relevant class
.
Infrastructure: The original dataset occupies 1.7 GB in CSV format
. If we plan to use Drive, we have to ensure have an efficient way to read those files (for example, using Python scripts) to feed the data into BETO.

The model BETO is not mentioned in the sources (which focus on Portuguese models like BERTimbau and BERTabaporu), so its specific performance in the Peruvian legal domain is something we should validate independently. However, the underlying BERT architecture has proven to be highly effective for these tasks according to the results presented in the studies*

## Ethical Considerations

*[Initial ethical concerns]*

## Timeline

*[Project timeline]*
