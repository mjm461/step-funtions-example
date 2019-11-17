# Step Functions Example
Example template project for developing a set of step functions to complete a task.

## Development
The top level requirements.txt has every package that can be used for development.
It will include all requirements from sub projects. 
```bash
python3.7 -m venv .venv
source venv/bin/actviate
pip install -r requirements.txt
```

## Unit Tests
Every step or package has its own set of unit tests, which most likely
uses the common package (if it is an AWS Lambda).  To run a unit test 
in a package, step1 for
example:
```bash
cd entrystep
pyton setup test
```

## Common AWS Lambda functions
[Common AWS Lambda](https://github.com/mjm461/awslambda) - Includes the base 
classes for for creating a new lambda.

## Creating a New Step (Lambda)
To creat a new step, use [pyscaffold](https://github.com/pyscaffold/pyscaffold/), 
in the top level of the project, in this case step-functions-temlate.  To create new step:

```bash
putup newstep
```

Add a version and common dependency to setup.cfg (if needed)
```
# newstep/setup.cfg

[metadata]
name = newstep
version = 1.0.0

[options]
install_requires = awslambda
dependency_links = git+https://github.com/mjm461/awslambda.git@master#egg=awslambda
```
Add minimum coverage failure to .coveragerc (ex: 80%)
```
# newstep/.coveragerc

[report]
fail_under = 80
```

Create a new Handler class in ```newstep/newstep.py```, 
see example in [awslambda](https://github.com/mjm461/awslambda). Only create the class
as the handler will be created next as ```handler.py```

Create a handler.py (to be used by the AWS Lambda) if necessary
```
# newstep/handler.py
from newstep import NewStep

lambda_handler = NewStep().get_handler()
```
## Development in an IDE
In this case I am using Pycharm, but to work on a step, make sure ```pip install awslambda```
the common AWS Lambada package and newstep/src are selected as source.  To do this, right click
on one of these directories and select "Mark Direcotory As" -> "Sources Root"

## Deploying the project to Localstack
TODO

## Terraform Deployment
TODO