# For more information, please refer to https://aka.ms/vscode-docker-python
FROM ubuntu:20.04

EXPOSE 3305

RUN apt-get update -y && \
    apt-get install -y python3-pip python-dev

RUN apt-get install -y libmysqlclient-dev


# Install pip requirements

WORKDIR /app
COPY requirements.txt requirements.txt                                                                                                                                                                                      
RUN  pip install -r requirements.txt
COPY . .

# During debugging, this entry point will be overridden. For more information, please refer to https://aka.ms/vscode-docker-python-debug
CMD ["python3", "backend/app.py"]
