How To Use
----------

- Select a name for the project by modifying the `PROJECT` variable in the `Makefile`.
- Compose a markdown-formatted document in `$(PROJECT).md`.
- Modify the title, formatting, and other settings in the `Makefile` and `Include/preamble.inc`. 



Important Build Targets
-----------------------

- `make`: This will build a `pdf` version of the document. Many intermediate files will be created in the process.
- `make clean`: This will remove the `pdf` file and all of the intermediate files made while building it.
- `make tex-continuous`: Continuously compiles the most up-to-date version of the `md` file into a `tex` file.
- `make pdf-continuous`: Continuously compiles the most up-to-date version of the `tex` file into a `pdf` file. (This is done with the `latexmk` command's "preview document and continuously update" setting.)



Resources
---------

Source code for this project is available as `dwtj/mpl-template` on GitHub.
