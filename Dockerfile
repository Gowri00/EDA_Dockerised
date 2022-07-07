FROM python

ENV FLASK_APP=app.python
ENV FLASK_RUN_HOST=0.0.0.0

COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt
COPY . .
CMD ["python","app.py"]