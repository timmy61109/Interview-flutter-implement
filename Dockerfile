FROM python:latest

SHELL ["/bin/bash", "-c"]

WORKDIR /app

COPY . /app

# 更新PyPi
RUN pip install pip --upgrade

# 安裝虛擬環境
RUN pip install virtualenv --upgrade
RUN virtualenv venv
RUN source venv/bin/activate

# 相依性佈署
RUN pip install -r requirements.txt --upgrade
RUN python setup.py bdist_wheel
RUN pip install dist/*.whl

EXPOSE 80

CMD ["python", "app.py"]
