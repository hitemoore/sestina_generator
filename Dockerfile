FROM jupyter/datascience-notebook:python-3.8.6

RUN pip3 install git+git://github.com/minimaxir/textgenrnn.git
RUN pip3 install syllapy

