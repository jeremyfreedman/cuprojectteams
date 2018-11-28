FROM alpine # alpine is a lightweight Linux distribution
RUN apk add python3 # install python3

COPY . . # copy local files into the container
RUN python3 -m pip install -r src/requirements.txt # pip install requirements
EXPOSE 5000 # expose port 5000

CMD python3 src/app.py # run the app
