FROM python:3-alpine

# set work directory
WORKDIR /usr/src/

# install dependencies
RUN pip install --upgrade pip 
COPY ./requirements.txt /usr/src/
RUN apk add gcc musl-dev python3-dev
RUN pip install -r requirements.txt

# set environment variables
# ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# # env app
# ENV STATIC_APPS_EMAIL_HOST 'data_here'
# ENV STATIC_APPS_EMAIL_HOST_USER 'data_here'
# ENV STATIC_APPS_EMAIL_HOST_PASSWORD 'data_here'
# ENV STATIC_APPS_DEFAULT_FROM_EMAIL 'data_here'
# ENV STATIC_APPS_EMAIL_PORT 'data_here'
# ENV STATIC_APPS_ADMIN_EMAIL 'data_here'


# copy project
COPY . /usr/src/

# EXPOSE 8000

# CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]