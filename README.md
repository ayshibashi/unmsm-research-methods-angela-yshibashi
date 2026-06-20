# UNMSM Research Methods Project

Project overview and exact run instructions go here.

## Quick Start

### Prerequisites
- Docker
- Python 3.9+
- DVC (Data Version Control)

### Setup

1. Clone the repository:
```bash
git clone https://github.com/ayshibashi/unmsm-research-methods-angela-yshibashi.git
cd unmsm-research-methods-angela-yshibashi
```

2. Build Docker environment:
```bash
docker build -t unmsm-research .
```

3. Install dependencies:
```bash
pip install -r requirements.txt
```

4. Pull DVC-tracked data:
```bash
dvc pull
```

5. Run the reproducible pipeline:
```bash
cd 05_pipeline
jupyter notebook notebook.ipynb
```

## Project Structure

See the directory structure below for organization of research artifacts across all sessions.

## Documentation

- **Paradigm Justification**: `01_paradigm/`
- **Method Selection**: `02_method/`
- **Protocol Development**: `03_protocol/`
- **Literature Review**: `04_literature/`
- **Reproducible Pipeline**: `05_pipeline/`
- **Reproducibility Audit**: `06_repro_audit/`
- **Model Documentation**: `07_model_card/`
- **Ethics Review**: `09_ethics/`
- **Data Management**: `10_data_mgmt/`
- **Bias Audit**: `11_bias_audit/`
- **Research Integrity**: `12_integrity/`
- **Peer Review**: `14_peer_review/`

## Tracking & Reflection

- **Reflective Writing**: `reflections/`
- **MLflow Tracking**: `mlruns/`
