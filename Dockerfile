FROM python:3.9-slim
WORKDIR /app
RUN apt-get update && apt-get install -y git
RUN git clone https://github.com/allannk/counter.git .
RUN pip install --no-cache-dir -r requirements.txt
EXPOSE 4114
#VOLUME ["/data"]
CMD ["python", "counter.py"]