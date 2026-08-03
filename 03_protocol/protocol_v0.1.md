# Research Protocol v0.1

**Session 3 - Initial Draft**

## Overview

*This continuous regulatory standards radar to detect and classify the regulatory obligations that banks must fulfill within the framework of the payment system starts by collecting all documents published by regulatory authorities on a daily basis from SBS, BCRP, ANPDP, PCM*


## Research Design

<img width="864" height="616" alt="image" src="https://github.com/user-attachments/assets/c220ca44-02ac-4b0b-b843-cb97e82c1308" />

	
## Annotation Methodology
This system cross-references all regulatory authorities and identifies regulatory gaps and upcoming compliance deadlines for banks.

	
## AI Models to Evaluate
	
	Machine learnig models

	Logistic Regression
	SVM Super Vector Machine
	Random Forest


## Explainability 

	Outputs:

	Accuracy (indicates the total percentage of documents correctly classified).
	Precision (measures how many of the documents classified as relevant were actually relevant).
	Recall (indicates how many of the relevant documents were detected by the model).
	F1-score (combines precision and recall into a single measure. It is useful when seeking a balance between the two).
	ROC-AUC (measures the model's ability to differentiate between relevant and irrelevant documents. A value close to 1 represents 	excellent separation ability).
	
## Participants/Data

We collect the Data from Public # Scraper from Normativa (SBS, BCRP, ANPDP, PCM)
At first tried with 'requests` (faster), then Scraper Normativa (SBS, BCRP, ANPDP, PCM)  and finally manually -versión Google Colab

If a site blocks access (as happened when testing BCRP and SBS), then decides to use **Playwright** (a real browser) as a backup, and save the database to  **Google Drive** (for the complement design science model).

## Procedure


We need to explore more rigorous procedures when the data is unbalanced i.e., when there are thousands of irrelevant regulations and only a few important ones for our purposes, which is the typical scenario in banking regulation, where we focus on making the Payment System manageable.



## Data Collection

In Peru: The download of regulations from entities such as the SBS, BCRP, ANPDP, and PCM, as described above, will need to be automated and stored in a manageable database. 
Due to restrictions, meanwhile  we can use Google Drive as an initial repository, for training and production purposes, we will need to process these files to extract the regulatory document.


## Analysis Plan

1. Machine learning prediction: Classifies relevance based on context.

2. Deterministic rules: Searches for specific keywords or filters by desired or undesired regulations and document types. This is especially useful at the beginning of a project, when there are fewer annotated samples to train the model.

Challenges to consider

The anti-bot protections that some public institution websites have.


## Ethical Considerations

We attempted to collect data from SBS, BCRP, ANPDP, and PCM using quick requests, but the sites were blocked by anti-bot protection.

So we decided to use Playwright (which functions as a real browser) as a backup plan, although there were some delays in manual retrieval.

Ultimately, we decided to scale back the project and do it manually to facilitate the initial implementation.

## Timeline
 
Same as Design research or Pipeline (above)
