default: pylint pytest

pylint:
  find . -iname "*.py" -not -path "./tests/*" | xargs -n1 -I {}  pylint --output-format=colorized {}; true

pytest:
  PYTHONDONTWRITEBYTECODE=1 pytest -v --color=yes



# Description: Makefile for running pylint and pytest.
# - default: runs both pylint and pytest. --> run 'make' on your terminal to run both pylint and pytest.
# - pylint: lints Python files excluding those in the tests directory. --> it find all files with 'test_'
# - pytest: executes pytest with verbose output and colored results.

# Explanation:
# linting helps ensure code quality, readability, and /
# maintainability by detecting common programming errors and enforcing coding standards.

# Breakdown:
# - find . -iname "*.py" -not -path "./tests/*": This command uses the find utility to search for files with a .py extension (-iname "*.py") in the current directory (.) and its subdirectories. The -not -path "./tests/*" part excludes files in the tests directory and its subdirectories from the search.
# - |: This is a pipe symbol that redirects the output of the previous command (the list of Python files) to the input of the next command.
# - xargs -n1 -I {}: xargs is a command that builds and executes command lines from standard input. -n1 specifies that xargs should use at most one argument from standard input for each invocation of the command. -I {} tells xargs to replace {} with the input it receives.
# - pylint --output-format=colorized {}: For each Python file found by find, xargs runs pylint with the --output-format=colorized option to produce colorized output (if supported). {} is replaced by the filename.
# - {}: This placeholder is replaced by the filenames found by find and passed as arguments to pylint.
# - true: This command is appended at the end of the pipeline. It ensures that the overall exit status of the pipeline is considered successful, regardless of whether pylint itself exits with an error. This is because pylint might return a non-zero exit code if it finds issues in the code, and we don't want this to cause the Makefile to stop executing.

# In summary, this Makefile target (pylint) finds all Python files in the current directory (excluding those in the tests directory), runs pylint on each of them, and outputs the results in a colorized format. The true command ensures that the target always exits successfully, regardless of the exit code of pylint.
