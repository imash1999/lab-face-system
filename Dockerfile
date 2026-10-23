FROM python:3.11-slim
WORKDIR /app

COPY wheelhouse ./wheelhouse

# 1) Сначала установите dlib-bin, предоставив бинарный dlib
RUN pip install --no-index --find-links=./wheelhouse dlib-bin==19.24.6

# 2) Установите face-recognition, пропустив проверку зависимостей
RUN pip install --no-index --find-links=./wheelhouse face-recognition==1.3.0 --no-deps

# 3) Устанавливаем остальные зависимости
RUN pip install --no-index --find-links=./wheelhouse --force-reinstall \
    "numpy<2" \
    face-recognition-models==0.3.0 \
    Click Pillow Django psycopg2-binary \
    djangorestframework djangorestframework-simplejwt django-cors-headers

COPY . .
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]