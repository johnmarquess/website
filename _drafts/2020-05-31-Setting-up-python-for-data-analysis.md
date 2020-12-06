---
layout: single
title:  "Setting up python for data analysis - a series of tutorials."
date:   2020-05-31 20:17:00 +1000
categories: [Python]
---

# Setting up python for data analysis

This is the start of a set of tutorials for analysis techniques and workflows using python. The tutorials will be stored on a [github repo](https://github.com/johnmarquess/python_data_analysis) as a series of iPython notebooks. The main elements will also be explained in these blog posts. The motivation fof this is to improve my understanding of python's data analysis and machine learning capabilities and share this with others who may be interested.

Please feel free to fork the repo and send pull requests. If you are new to github these will treated kindly so use it as an opportunity to practice your pull requests. There will be *lets of tipos to fix!*

## Tutorial 0 - getting set up

To get started you will need the following:
- python installed on your machine.
- I'm using python version 3.8.2 on a linux [Pop!_OS System 76](https://pop.system76.com/) install. It's Ubuntu based, is great for data analysis and media stuff, and has a nice retro look and feel.
- A virtual environment set up.
- A basic set up data python data analysis and visualisation packages.


### Step 1 - install a virtual python environment
- I used [venv](https://docs.python.org/3/library/venv.html) and installed a virtual environment called `.data` in my root folder using the following command `python3 -m venv .data`
- Activate the environment with `source .data/bin/activate`.
- Install the required packages. I usually update pip and install wheel before anything else, as follows: First `pip install -U pip` then `pip install wheel`. This takes care of any errors and warnings.
- The basic packages to get going can be installed using `pip install pandas jupyter seaborn`. This will also install any dependencies.
- The list of packages used can be found in the `requirements.txt` file.
- You can also install this using `pip install -r requirements.txt` from your virtual environment.

### Step 2 - test everything is working
- Get started by running the jupyter notebook.
- I like to specify a local IP and port with `jupyter notebook --ip=0.0.0.0 --port=8080`. Because who knows what could be in your `/etc/hosts` file.
- If that worked and the jupyter notebook opened then congratulations. You are up and running. If not, leave a comment.
