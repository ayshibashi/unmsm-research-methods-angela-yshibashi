FROM python:3.9-slim

WORKDIR /workspace

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Install DVC
RUN pip install --no-cache-dir dvc

# Copy requirements and install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . .

# Set up DVC
RUN dvc config core.no_scm true

CMD ["/bin/bash"]
