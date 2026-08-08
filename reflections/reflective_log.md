# Reflective Learning Log

## Overview

Honestly, after completing my master’s degree several years ago—well before the current AI revolution—it required considerable effort for me to adapt again to academic learning, particularly in English and through virtual classes. One early challenge was understanding specific terms used during the lectures, such as “lakh” in the HPC classes. At first, I searched for it in a translator without success; later, AI helped me understand that it refers to 100,000 in India, Pakistan, and Bangladesh. I also realized that some pronunciations were transcribed as different words, and AI tools were useful in interpreting them correctly from context.

As I mentioned in class, at times I felt like the Peruvian expression “como cuy en tómbola” — like a guinea pig in a raffle. In this traditional game, the guinea pig is placed at the center, surrounded by small, numbered boxes, and the winner is the person who chooses the box where it finally enters. This image reflects how I initially felt: uncertain, moving through unfamiliar concepts, but gradually finding a direction.

The main purpose of enrolling in this doctoral program was to acquire updated scientific knowledge that would help me identify, assess, and control the risks associated with emerging technologies, especially in relation to my professional contribution at work. Interestingly, I became deeply engaged with the lectures because they helped me discover what lies behind the techniques used in foundational AI models. Although I still do not fully understand every concept or how to apply all of them correctly, the program has broadened my perspective and strengthened my motivation to continue learning.


## Session-by-Session Reflections

### Session 1: Research Paradigm

**Key Learnings**:

At the beginning, I expected to develop a design science project. Nevertheless, I had to narrow the scope because some of my technical knowledge was not limited, but rather outdated in relation to the speed at which AI tools, coding practices, and prompt engineering have evolved. This made me take a step back and focus on building a more realistic and achievable project while updating my understanding of current technologies.

I therefore had to refresh my knowledge of basic machine learning models, as well as the types of cases in which they can be applied. In doing so, I realized that many underlying concepts remain the same, even if the tools have changed. For example, principles such as pagination in data processes or the well-known idea of “garbage in, garbage out” are still highly relevant: if the input data are incomplete, inconsistent, or poorly structured, the results of any model will also be weak. Based on that process, I decided to work with a simple classification model and its corresponding pipeline, allowing me to complete the project in a structured way and obtain interpretable results.

I realize that choosing a research method is not only a formal academic requirement, but also a practical decision that defines the quality and feasibility of the entire project. I understood that a research question must be aligned with the available data, the methodological approach, and the level of technical capacity required to implement the study. This was especially relevant for me because I wanted my project to be useful for risk management, but also realistic according to my current learning stage.

It also helped me recognize that research in artificial intelligence cannot be reduced only to the use of algorithms or technical models. Before applying any model, it is necessary to understand the problem, define the objective, evaluate the assumptions, and consider the limitations of the data. In this sense, the course encouraged me to think more critically about the relationship between scientific rigor and practical application.

From a professional perspective, this was particularly valuable because emerging technologies introduce new operational, ethical, model, and governance risks. Therefore, these lectures helped me connect academic research methods with my daily work: risk assessment requires evidence, structure, traceability, and a clear explanation of the criteria used to make decisions.

---

### Session 2: Method Selection

The discussion on reproducibility helped me understand that research projects must be sufficiently transparent for other people to follow, review, and replicate them. I learned the importance of documenting configurations, libraries, versions, and random seeds, since these elements are essential to demonstrate the quality of the design and the reliability of the code.

This also made me realize that sharing the necessary features of a project is not only a technical requirement, but also a way to verify and strengthen the quality of use cases. Reproducibility allows others to better understand how a model works and whether its results can be trusted.

In this unit, I also understood that reproducibility is closely related to scientific integrity. A model may generate apparently good results, but if the process cannot be reconstructed, reviewed, or explained, its value becomes limited. For this reason, documenting the workflow is as important as obtaining the final metric. The steps followed, the assumptions made, and the decisions taken during preprocessing, training, and evaluation must be clear enough for another person to understand the logic of the project.

Before this course, I associated documentation mainly with administrative order. However, Unit II helped me see it as a methodological safeguard. Recording the versions of libraries, the configuration of the environment, and the use of random seeds reduces uncertainty and allows other researchers or reviewers to distinguish between a robust result and an accidental outcome. This is especially relevant in artificial intelligence, where small changes in data, parameters, or execution conditions can produce different results.

From my professional perspective, this learning is directly applicable to risk management. When analytical models are used to support decisions, it is not enough to know the final output; it is necessary to understand how that output was produced. Traceability, version control, and clear documentation help evaluate whether a model is reliable, whether its assumptions are reasonable, and whether its use could generate operational, reputational, or compliance risks.

This unit also changed the way I perceive experimentation. I realized that experimentation in AI is not simply a matter of testing several models until one performs better. It requires discipline, comparison criteria, and a clear record of what was changed and why. Otherwise, the researcher may confuse improvement with chance or may select results without enough methodological justification. In that sense, reproducibility contributes not only to technical quality, but also to ethical responsibility.

### Session 3: Protocol Development

**Key Learnings**:

I was particularly interested in the sessions related to data cleaning and processing, especially because these steps are critical for reducing bias and improving the quality of analysis. This reminded me of practices used in economic studies, such as adjusting or seasonalizing time series to obtain more reliable interpretations.
Another topic that captured my attention was personal data protection, which is becoming increasingly relevant in Peru. I learned that even when anonymization methods are applied, there may still be information leaks that can compromise the scientific rigor and ethical validity of a study.

This reflection was important because it showed me that data quality is not only a technical issue, but also an ethical and governance concern. If the data are biased, incomplete, duplicated, poorly labelled, or collected without clear criteria, the model may reproduce or amplify those weaknesses. In that sense, the traditional principle of “garbage in, garbage out” becomes especially relevant in AI projects: sophisticated algorithms cannot compensate for poor data foundations.

The sessions also helped me understand that cleaning data does not mean simply deleting errors or filling missing values. It requires judgment, documentation, and awareness of the possible impact of each transformation. For example, removing outliers without understanding their origin may eliminate relevant risk signals, while keeping inconsistent observations may distort the model. Therefore, each preprocessing decision should be justified and aligned with the research objective.

I also became aware of integrity tensions that are particularly important in developing countries, where access to reliable data can be limited. For example, when attempting to obtain information from public websites protected by anti-bot systems, I learned about tools such as Playwright and mock navigators. However, due to time constraints, I decided to narrow the project and proceed manually in this first version.

Although I did not implement Playwright or models such as MiniBERT in this version of the project, I plan to explore these tools in a future review. I am especially interested in applying them to risk assessment, where they could help validate the results of internal studies and improve the robustness of analytical processes.

From a risk management perspective, I found this unit especially useful because it made me think about data lineage and accountability. In institutional environments, it is necessary to know where data come from, how they were transformed, who made the decisions, and whether the final dataset is appropriate for the intended use. These aspects are essential when evaluating models that may support decision-making, regulatory analysis, or internal control processes.

Overall, this Unit reinforced the idea that responsible AI begins before the model is trained. It starts with the way data are obtained, cleaned, protected, interpreted, and documented. This learning was valuable for my project because it encouraged me to be more careful with the sources of information, the treatment of personal data, and the methodological explanation of each step in the analytical process.

### Session 3:

Although I did not review other protocols in depth, I recognize the importance of rigorous machine learning procedures, including the standard division of data into training, validation, and testing sets, such as the 80/10/10 approach. In the next version of my project, I expect to incorporate more advanced methods, including MiniBERT, and to strengthen the methodological structure of the analysis.

This final part helped me understand that the methodological structure of a machine learning project is as important as the model itself. Dividing the data into training, validation, and testing sets is not just a technical convention; it is a way to reduce the risk of overfitting and to evaluate whether the model can generalize to new information. Without this separation, a model may appear to perform well, but only because it has learned the specific characteristics of the available dataset rather than the underlying pattern.

I also learned that validation is essential for making responsible decisions about model selection. It is not enough to choose the model with the best metric in a single run. The evaluation process should consider whether the metric is appropriate for the problem, whether the classes are balanced, whether errors have different consequences, and whether the model’s behavior can be explained. These aspects are especially relevant in risk-related contexts, where false positives and false negatives may have very different implications.

The discussion about more advanced methods, such as MiniBERT, also showed me that natural language processing can provide valuable tools for analyzing qualitative or textual information. In my professional field, many risk signals are not always structured as numerical data; they may appear in reports, regulations, audit observations, contracts, emails, or public information. For that reason, incorporating NLP methods in a future version of the project could help extract patterns, classify relevant information, and support more systematic risk analysis.

At the same time, this discussion reminded me that using more advanced models also requires stronger methodological controls. A complex model is not necessarily better if it is not aligned with the research question, if its results are difficult to interpret, or if the available data are not sufficient to train or validate it properly. Therefore, my next step should not only be to apply more sophisticated techniques, but to ensure that each technique is justified, documented, and evaluated according to the purpose of the study.

## Major Insights

Overall, this course has been a meaningful opportunity to reconnect with academic research from a more current and applied perspective. It helped me update my understanding of artificial intelligence, not only as a set of technical tools, but as a field that requires scientific rigor, methodological transparency, ethical awareness, and responsible governance. 

Throughout the project, I realized that the quality of an AI-based analysis depends not only on the model selected, but also on the clarity of the research question, the quality and treatment of the data, the reproducibility of the process, and the ability to explain and justify each methodological decision.

## Challenges Encountered

Although this first version of the project was intentionally simple, it represents an important step in my learning process. It helped me move from uncertainty to a clearer understanding of how research methods, scientific integrity, reproducibility, and responsible AI are connected. Going forward, I expect to continue strengthening the project by incorporating more advanced techniques, improving the methodological design, and deepening the link between academic research and practical risk management. In that sense, this reflective log also represents a commitment to keep learning, updating my knowledge, and applying these concepts with responsibility and professional judgment.

## Growth Areas

As mentioned before from professional perspective, this knew knowledge is particularly valuable because emerging technologies introduce new operational, ethical, model, and governance risks. 
Now I can connect academic research methods with my daily work: risk assessment requires evidence, structure, traceability, and a clear explanation of the criteria used to make decisions.

## Next Steps
From my professional experience in risk management, these lectures are especially relevant. Emerging technologies create new opportunities, but they also introduce risks related to data quality, model reliability, operational resilience, personal data protection, accountability, and decision-making. For this reason, I believe that the knowledge gained in this course will allow me to contribute with a more informed, critical, and structured perspective when evaluating the use of AI and analytical models in institutional contexts.

