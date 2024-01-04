FROM python:3.9-slim

WORKDIR /app

ADD https://drive.google.com/file/d/133fXBQknU0VCIdT-OmyyI24LpOfuNlHs/view?usp=sharing /app

RUN pip install --upgrade pip

RUN apt-get update && apt-get install -y build-essential

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY . .

EXPOSE 5000

# Run the application
CMD ["gunicorn", "app:app", "--bind", "0.0.0.0:5000"]