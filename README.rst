==================
Sphinx auto deploy
==================

This appliance allows serving Sphinx documentation hosted on GIT.

Use environment variables to select what to checkout and run. Content is updated via basic git pull every 45 seconds (no webhook magic for now).

.. code-block:: yaml

  APP_URL: "https://my-sphinx-doc.example.org/"
  GIT_SSH_KEY: "aws:kms:...."
  GIT_REPO: git@.....
  CONTENT_FOLDER: "compendium"

CONTENT_FOLDER specifies subfolder where Sphinx make command should be run.

Content is served via `Python OAuth2 Proxy`_ from

.. code-block::

  $CONTENT_FOLDER/_build/html

Docker Image
------------

The current Docker image is available in Zalando's Open Source Docker registy:

.. code-block:: bash

    $ docker pull registry.opensource.zalan.do/stups/sphinx-doc:0.1-SNAPSHOT
    $ docker run -it -p 8080:8080 -e ... registry.opensource.zalan.do/stups/sphinx-doc:0.1-SNAPSHOT

Deployment
----------

Use "MainDomain" in the Senza "AppLoadBalancer" section to define a DNS name

Sphinx Makefile
---------------

Use the default Sphinx Makefile to build your Sphinx Project (``make html``).

Sphinx
------

  http://sphinx-doc.org

.. _Python OAuth2 Proxy: https://pypi.python.org/pypi/oauth2-proxy
