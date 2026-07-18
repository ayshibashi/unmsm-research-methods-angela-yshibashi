# Research Protocol v0.1

**Session 3 - Initial Draft**

## Overview

*The original system (Radar Regulatorio) starts by collecting all documents published by regulatory authorities on a daily basis*


## Research Design


	*Regulators
      ↓
	*Document Collection
      ↓
	*NLP Preprocessing
      ↓
	*Vector Store
      ↓
	*AI Classification
      ↓
	*Regulatory Obligation Extraction
      ↓
	*AI Governance Assessment
      ↓
	*Cybersecurity Control Mapping
      ↓
	*Risk Dashboard
      ↓
	*Owner Assignment

## Annotation Methodology
BBRC used expert annotation by business specialists. Our Peruvian study can improve this with a richer schema.

	Level 1 	Relevant / Not Relevant
	(Binary classification)

	Level 2 	Impact Level
	Low
	Medium
	High
	Critical

	Level 3		Domain
	Risk
	Cybersecurity
	AI
	Data Protection
	Continuity
	AML

	Level 4		Regulatory Obligation Type
		Reporting
	Governance
	Controls
	Monitoring
	Audit
	Security
	Documentation

	Level 5		AI Risk Classification
	Using NIST AI RMF and EU AI Act categories.
	
## AI Models to Evaluate

	Traditional

	SVM
	XGBoost
	Random Forest

	
	Generative AI

	GPT-5 class models
	Llama 4
	Mistral
	Phi


## Explainability Layer (XAI)
	Given your interest in AI governance for financial institutions, this should be a major contribution.
	Methods:

	SHAP
	LIME
	Attention visualization
	Counterfactual explanations

	Outputs:

	Why regulation was classified as relevant
	Key regulatory clauses
	Confidence level
	Compliance impact rationale

## Participants/Data

To clasif the data we need expert experience, and we will gather the public data, regulations from regulators web SBS BCRP SMV and official peruvian newspaper, in the SPIJ specialize legal DB (we have to focus on banking and AI) 

## Procedure

Implementing Ai Generative (The AI Engine)

We have to look for superior engines when data is imbalanced (i.e., when there are thousands of irrelevant regulations and only a few important ones), which is the typical scenario in banking regulation

Recommended Configuration: According to the benchmarks, we should configure our model with a maximum length of 512 tokens, a batch size of 20, and use the AdamW optimizer with a learning rate of 1e-5 and an epsilon of 1e-8

Preprocessing: Unlike traditional models, you should not remove stop words or over-simplify the text when using engine, in order to maintain the richness of the legal language*

## Data Collection

In Peru: You would need to automate the download of regulations from entities such as the SBS (Superintendency of Banking, Insurance, and AFP), the BCRP (Central Reserve Bank of Peru), the SMV (Superintendency of the Securities Market), and the official newspaper El Peruano.
Using Drive: While we can use Google Drive as an initial repository, the study suggests that for training and production, we will need to process these files to extract the plain text (the text column), its length, and the regulatory identifier

## Analysis Plan

*A Hybrid Approach (AI + Rules)
A key detail from the study is that they did not use AI alone. The system operates with a hybrid pipeline:

1. AI Prediction (engine): Classifies relevance based on context
2. Deterministic Rules (Regex): Searches for specific keywords or filters by desired or undesired regulators and document types. This is especially useful at the beginning of the project when we have fewer annotated samples to train the model.

Challenges to Consider
Data Imbalance: Most Peruvian regulations will likely be irrelevant for a given department. The study suggests using undersampling techniques so the model learns to better distinguish the relevant class

Infrastructure: The original dataset occupies 1.7 GB in CSV format
. If we plan to use Drive, we have to ensure have an efficient way to read those files (for example, using Python scripts) to feed the data into BETO.

Insead of using Machine learning for specific performance in the Peruvian legal domain we should validate generative engines to prove which is highly effective for these tasks according to the results presented in prevuios studies like the Brazilian BBR*

## Ethical Considerations

*[Initial ethical concerns]*

## Timeline

*[Project timeline]*
