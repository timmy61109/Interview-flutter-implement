#!/usr/bin/python3
# encoding: utf-8
# Copyright (C) 2008-2016 Jelmer Vernooĳ <jelmer@jelmer.uk>
"""Setup file for interview_flutter_implement."""


import io
import os
from typing import Any
from typing import Dict

from setuptools import find_packages
from setuptools import setup


LSTM_PM_VERSION_STRING = '0.0.0'
URL = "https://github.com/timmy61109/interview_flutter_implement"
setup_kwargs = {}  # type: Dict[str, Any]


with io.open(os.path.join(os.path.dirname(__file__), "README.md"),
             encoding="utf-8") as f:
    description = f.read()

setup(name='lstm_pm',
      author="timmy61109",
      author_email="qazzxcasdqwewsxedc@gmail.com",
      url=URL,
      long_description=description,
      description="面試題目延續不斷製作",
      version=LSTM_PM_VERSION_STRING,
      license='MIT License',
      project_urls={
          "Bug Tracker": URL + "/issues",
          "Repository": URL + ".git",
          "GitHub": URL,
      },
      keywords="pm lstm",
      packages=find_packages(),
      package_data={'': ['../docs/tutorial/*.txt', 'py.typed']},
      classifiers=[
          'Development Status :: 4 - Beta',
          'License :: MIT License',
          'Programming Language :: Python :: 3.5',
          'Programming Language :: Python :: 3.6',
          'Programming Language :: Python :: 3.7',
          'Programming Language :: Python :: 3.8',
          'Programming Language :: Python :: 3.9',
          'Programming Language :: Python :: Implementation :: CPython',
          'Programming Language :: Python :: Implementation :: PyPy',
          'Operating System :: POSIX',
          'Operating System :: Microsoft :: Windows',
          'Topic :: Software Development :: Version Control',
      ],
      **setup_kwargs
      )
