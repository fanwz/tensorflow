# Copyright 2018 The TensorFlow Authors. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ============================================================================
#
# THIS IS A GENERATED DOCKERFILE.
#
# This file was assembled from multiple pieces, whose use is documented
# throughout. Please refer to the TensorFlow dockerfiles documentation
# for more information.

ARG UBUNTU_VERSION=16.04

FROM ubuntu:${UBUNTU_VERSION} as base

ARG USE_PYTHON_3_NOT_2=True
ARG _PY_SUFFIX=${USE_PYTHON_3_NOT_2:+3}
ARG PYTHON=python${_PY_SUFFIX}
ARG PIP=pip${_PY_SUFFIX}

# See http://bugs.python.org/issue19846
ENV LANG C.UTF-8

#RUN apt-get update && apt-get install -y \
#    ${PYTHON} \
#    ${PYTHON}-pip

#install python3.7
RUN apt-get update && \
        apt-get install -y software-properties-common vim
RUN apt-get update -y
RUN apt-get install -y build-essential libssl-dev libffi-dev libxml2 libxml2-dev libxslt1-dev zlib1g-dev
RUN apt-get install -y --no-install-recommends wget
RUN mkdir -p /tools
ADD Python-3.7.3.tgz /tools
WORKDIR /tools/Python-3.7.3/
RUN ./configure --enable-optimizations && make -j2 && make install

#RUN ${PIP} --no-cache-dir install --upgrade \
#    pip \
#    setuptool

#CMD ["bash", "-c", "source /etc/bash.bashrc && jupyter notebook --notebook-dir=/tf --ip 0.0.0.0 --no-browser --allow-root"]
CMD tail -f /dev/null
