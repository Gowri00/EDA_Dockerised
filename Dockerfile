FROM python

ENV FLASK_APP=app.python
ENV FLASK_RUN_HOST=0.0.0.0


RUN pip install Flask
RUN pip install matplotlib
RUN pip install seaborn
RUN pip install pandas

COPY . .
ENTRYPOINT ["python","app.py"]