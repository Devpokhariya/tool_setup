FROM python:3.8

ENV MICRO_SERVICE=/home/app/webapp
# set work directory
RUN mkdir -p $MICRO_SERVICE
# where your code lives
WORKDIR $MICRO_SERVICE

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install dependencies
RUN pip install --upgrade pip
# copy project
ADD src/ $MICRO_SERVICE
RUN LIST=`ls` && export LIST 
RUN echo $LIST
ADD src/.streamlit $MICRO_SERVICE
# RUN pip install -r requirements.txt
EXPOSE 8080
# CMD streamlit run app.py