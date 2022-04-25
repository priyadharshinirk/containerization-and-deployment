FROM python:3.7.2-slim

COPY . /app
WORKDIR /app

RUN pip install --trusted-host files.pythonhosted.org --trusted-host pypi.org --trusted-host pypi.python.org --proxy http://proxy-ap.shell.com:80 --upgrade pip
RUN pip install --trusted-host files.pythonhosted.org --trusted-host pypi.org --trusted-host pypi.python.org --proxy http://proxy-ap.shell.com:80 -r requirements.txt


ENTRYPOINT ["gunicorn", "-b", ":8080", "main:APP"]