µDjango
=======

A template project for Django microservices and testing ground for a fully dockerised build environment


Prerequisites
-------------

This project uses a fully dockerised environment. As such you will need Docker_ and `Docker Compose`_ installed. There are also a number of helpers within the ``Makefile`` so it would be useful, but not essential to have a copy of ``Make`` installed.

You should also have rapyd_ installed somewhere on the path


Getting Started
---------------

Assuming you have `Docker Compose`_ installed the entire build environment can be started with:

.. code-block:: bash

	docker-compose up


This will start the PostgreSQL_ database server, a Django application server and a Sphinx_ documentation service.

The Django application service will reload automatically (after 3 seconds) when changes are made within ``/app`` and you can access the server using `localhost:8000`_.

The Sphinx_ documentation service will also automatically rebuild the documentation on change and is available on `localhost:8080`_





Development Tasks
-----------------

To make running everything inside a Docker_ container slightly less painful the project contains a ``Makefile`` with a number of targets, described below.


Running Tests
+++++++++++++


Tests are run with `py.test`_. We are using the `pytest-isort` and `pytest-flake8` plugins for static analysis. You can run the full test suite with:

.. code-block:: bash

	make test


Updating the Virtual Environment
++++++++++++++++++++++++++++++++

The virtual environment resides within the Django app Docker_ container, so when you add or change requirements (found in ``/app/requirements/*.txt``) you need to do so inside the container:

.. code-block:: bash

	make update


Format Python
+++++++++++++

This project provides yapf_ to automatically format Python code to our (``pep8`` derived) standard and isort to ensure that imports are sorted nicely. To automatically apply formatting changes:

.. code-block:: bash

	make format



Brain Dump Log
--------------

2017-12-19:
	The ``Makefile`` approach to running stuff in the container is a bit cumbersome. In particular, where I want to pass through commandline options. e.g. having a Django management command target is not really usable unless I specify each one separately. Not a good solution. Could something else be used which is more flexible but still doesn't require Python to be installed.  Perhaps a simple cli compiled with nuitka?

2017-12-19:
	I tried writting something and compiling with Nuitka, however the standalone compilation does not statically compile in libraries, you would need to copy them all around as well which is not ideal.

	So I wrote something in Go. This does compile to a single, statically linked executable and allows cross compiling, which is nice. rapyd_ (Run A Python in Docker) is the tool and it basically takes all command line args and runs them inside the docker container instead.  It is a seriously simplistic but appears to work.

	I also managed (with a little tweeking) to get the whole setup running in PyCharm, including the debugger. Which does remind me that we probably need a way of running a debugger when not using PyCharm.

2018-01-03:
	Using docker compose for the web server I think mean I can just use ``pudb`` for example, as long as I assign an interactive terminal to the ``web`` service.

	I also wonder if I should start doing type annotations and add a ``mypy`` target. I don't think that Django yet has annotation or that any have been added to ``typeshed``, which is a bit of a shame.

.. _docker: https://www.docker.com/
.. _`docker compose`: https://docs.docker.com/compose/install/
.. _rapyd: https://github.com/a-musing-moose/rapyd
.. _postgresql: https://www.postgresql.org/
.. _sphinx: http://www.sphinx-doc.org/en/stable/
.. _`localhost:8000`: http://localhost:8000
.. _`localhost:8080`: http://localhost:8080
.. _`py.test`: https://pytest-django.readthedocs.io/en/latest/
.. _yapf: https://github.com/google/yapf
