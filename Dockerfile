FROM python

ENV FLASK_APP=app.python
ENV FLASK_RUN_HOST=0.0.0.0


RUN pip install Flask
RUN pip install pandas
RUN pip install matplotlib
RUN pip install seaborn

COPY . .
CMD ["python","app.py"]