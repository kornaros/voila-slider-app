FROM python:3.10-slim

# Εγκατάσταση βασικών εργαλείων
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Δημιουργία φακέλου app και αντιγραφή αρχείων
WORKDIR /app
COPY . /app

# Εγκατάσταση εξαρτήσεων
RUN pip install --no-cache-dir voila ipywidgets jupyterlab

# Πόρτα που θα ανοιχτεί στο Render
EXPOSE 8888

# Εκκίνηση Voilà
CMD ["voila", "--port=8888", "--no-browser", "--Voila.ip=0.0.0.0", "hello_widgets.ipynb"]
