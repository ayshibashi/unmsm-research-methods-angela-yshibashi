# Research Protocol v0.1

**Session 3 - Initial Draft**

## Overview

*This continuous regulatory standards radar to detect, classify, and prioritize the regulatory obligations that banks must fulfill within the framework of the payment system starts by collecting all documents published by regulatory authorities on a daily basis from SBS, BCRP, ANPDP, PCM*


## Research Design


	*Regulators
      ↓
	*Document Collection (Classification in Relevant or not relevant)
      ↓
	*Data visualisation
      ↓
	*Data Pre-Processing (Cleaning)
      ↓
	*Data Visualisation (check before splitting)
      ↓
	*Splin in Train & Test (80% - 20%)
	  ↓
	*Embbeding
      ↓
	*Train model 
	  ↓
    *Results and comparison
      ↓
    *Choose best model
	
## Annotation Methodology
This system cross-references all regulatory authorities and identifies regulatory gaps and upcoming compliance deadlines for banks.

	
## AI Models to Evaluate
	
	Machine learnig models

	Logistic Regression
	SVM Super Vector Machine
	Random Forest


## Explainability 

	Outputs:

	Accuracy (indica el porcentaje total de documentos clasificados correctamente).
	Precision (mide cuántos de los documentos clasificados como relevantes realmente eran relevantes)
	Recall (indica cuántos de los documentos relevantes fueron detectados por el modelo).
	F1-score (combina precision y recall en una sola medida. Es útil cuando se busca equilibrio entre ambos).
	ROC-AUC (mide la capacidad del modelo para diferenciar entre documentos relevantes y no relevantes. Un valor cercano a 1 representa una excelente capacidad de separación).
	 
	
## Participants/Data

We collect the Data from Public # Scraper from Normativa (SBS, BCRP, ANPDP, PCM)
At first tried with 'requests` (faster), then Scraper Normativa (SBS, BCRP, ANPDP, PCM)  and finally manually -versión Google Colab

If a site blocks access (as happened when testing BCRP and SBS), then decides to use **Playwright** (a real browser) as a backup, and save the database to  **Google Drive** (for the complement design science model).

## Procedure


We need to look for higher procedures when the data is unbalanced (i.e., when there are thousands of irrelevant regulations and only a few important ones), which is the typical scenario in banking regulation where we focus on the Payments System to make it manageable.



## Data Collection

In Peru: You would need to automate the download of regulations from entities such as the SBS, BCRP, ANPDP and PCM as presented before. 
Using Drive: While we can use Google Drive as an initial repository, that for training and production, we will need to process these files to extract the docuemnt regulation.


## Analysis Plan

1. Machie larning prediction: Classifies relevance based on context
2. Deterministic Rules: Searches for specific keywords or filters by desired or undesired regulators and document types. This is especially useful at the beginning of the project when we have fewer annotated samples to train the model.

Challenges to Consider

The antibot protectioin some institutions rin.


## Ethical Considerations

We tried to collect the data from SBS, BCRP, ANPDP, PCM wth requests because of speed, but the sites got blocked, antibot protection.
Then we decide to use Playwright** (works real navegator)as a  plan B with some human delays in retrieval.
Finally decided to narrow the projet scope and do it manually.

## Timeline

*[Project timeline]*
