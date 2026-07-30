# Research Protocol v0.1

**Session 3 - Initial Draft**

## Overview

*This continuous regulatory standards radar to detect, classify, and prioritize the regulatory obligations that banks must fulfill within the framework of the payment system starts by collecting all documents published by regulatory authorities on a daily basis*


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
This system cross-references all regulatory authorities and identifies regulatory gaps and upcoming compliance deadlines for banks.

	
## AI Models to Evaluate
	
	Generative AI

	GPT-5 class models
	Llama 4
	Mistral
	Phi


## Explainability 


	Outputs:

	Why regulation was classified as relevant
	Key regulatory clauses
	Confidence level
	Compliance impact rationale
	
## Participants/Data

We collect the Data from Public # Scraper from Normativa (SBS, BCRP, etc.)
At first tried with 'requests` (faster), then Scraper Normativa (SBS, BCRP, etc.) — versión Google Colab

If a site blocks access (as happened when testing BCRP and SBS), then decides to use **Playwright** (a real browser) as a backup, and save the database to  **Google Drive** (so it's not lost every time you log out of Colab).

## Procedure

Implementing Ai Generative (The AI Engine)

We have to look for superior engines when data is imbalanced (i.e., when there are thousands of irrelevant regulations and only a few important ones), which is the typical scenario in banking regulation we focused on Payment Sstem to make it manageable.



## Data Collection

In Peru: You would need to automate the download of regulations from entities such as the SBS, BCRP, ANPDP and PCM as presented before. 
Using Drive: While we can use Google Drive as an initial repository, that for training and production, we will need to process these files to extract the plain text (the text column), its length, and the regulatory identifier

## Analysis Plan

*A Hybrid Approach (AI + Rules)
A key detail from the study is that they did not use AI alone. The system operates with a hybrid pipeline:

1. AI Prediction (engine): Classifies relevance based on context
2. Deterministic Rules (Regex): Searches for specific keywords or filters by desired or undesired regulators and document types. This is especially useful at the beginning of the project when we have fewer annotated samples to train the model.

Challenges to Consider



## Ethical Considerations

*[Initial ethical concerns]*
We tried to collect the data from SBS, BCRP, ANPDP, PCM wth requests because of speed, but the sites got blocked, antibot protection.
Then we decide to use Playwright** (real navegator)as a  plan B with some human delays in retrieval.

## Timeline

*[Project timeline]*
