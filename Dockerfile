# For more information, please refer to https://aka.ms/vscode-docker-python
FROM ubuntu:20.04

EXPOSE 5001

RUN apt-get update -y && \
    apt-get install -y python3-pip python-dev


# Install pip requirements

WORKDIR /app
COPY requirements.txt requirements.txt                                                                                                                                                                                      
RUN  pip install -r requirements.txt
COPY . .

# During debugging, this entry point will be overridden. For more information, please refer to https://aka.ms/vscode-docker-python-debug
CMD ["python3", "backend/app.py"]
