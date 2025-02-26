# US Govt Fair Use Index Review

## Overview

- **Author**: [Etienne P Jacquot](mailto:etiennej@upenn.edu)
- **Date**: 02/24/2025
- **Course**: [Penn Carey Law: LAW-9580 Cybercrime (Levy)](https://goat.law.upenn.edu/cf/coursefinder/course-details/?course=cybercrime&sec=LAW%20958001&term=2025A&page=1) graduate coursework.

## Getting Started

Fair Use Index data copied manually from the [US Govt Copyright Office Fair Use Index](https://www.copyright.gov/fair-use/fair-index.html) on February 24th, 2025.
- Excel data file: [USGOVT_FairUseIndex_02-24-2025.xlsx](USGOVT_FairUseIndex_02-24-2025.xlsx)
- Consists of **6 Columns** available for **250 rows**: 
    - `Index(['Case', 'Year', 'Court', 'Jurisdiction', 'Categories', 'Outcome'], dtype='object')`


## Data Visualizations & Analysis

This analysis is performed in a Jupyter Notebook with Python 3.11, using the index data to understand the distribution of the US Govt referenced cases across the years (decades), courts, jurisdictions, categories, and outcomes. 

Steps are taken to visualize the data for summarization of the US Govt Fair Use Index over time, in support of my graduate course work for LAW-9580 Cybercrime at Penn Carey Law.

Focusing on **time**, **outcomes**, and **categories**, the data is analyzed to understand the distributions in the Fair Use Index provided by the US Govt. The scope of my analysis focuses on Education and Research, and AI is used to assist in filtering all categories to differentiate parent categories from subcategories.

### **Summary of Total Cases per Year**:

![](static/images/fui_year_counts_summary.png)

### **Summary of Outcomes over Decades**:

![](static/images/fui_decade_outcomes_summary.png)


### **Summary of All Categories per Decade**:

![](static/images/fui_categories_decades_summary.png)


### **Summary of All Categories per Year**:

![](static/images/fui_categories_summary.png)

### **Summary of Categories (AI Infered) per Decade**:

![](static/images/fui_categories_main_decade_summary.png)

### **Summary of Categories (AI Infered) per Year**:

![](static/images/fui_categories_main_years_summary.png)

### **Summary of Outcomes per Categories over Decades**:

#### Education & Research

![](./static/images/fui_education_research_outcomes_summary.png)

#### Digital and Technology

![](./static/images/fui_digital_technology_outcomes_summary.png)

#### Visual Arts

![](./static/images/fui_visual_arts_outcomes_summary.png)

#### Media & Entertainment

![](./static/images/fui_media_entertainment_outcomes_summary.png)


_____________________________


## Development, Code Dependencies, and Reproducibility

Using **Python 3.11**, run the following to replicate the code in a local [virtual environment](https://docs.python.org/3/library/venv.html) 

- for the [analysis.ipynb](analysis.ipynb) notebook:

```bash
python3.11 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
jupyter notebook
```