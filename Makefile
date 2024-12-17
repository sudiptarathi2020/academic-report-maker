.PHONY: install run test migrate makemigrations collectstatic clean

# Variables
PYTHON = python3
MANAGE = $(PYTHON) manage.py
REQUIREMENTS = requirements.txt
STATIC_DIR = static

# Install project dependencies
install:
	$(PYTHON) -m pip install --upgrade pip
	$(PYTHON) -m pip install -r $(REQUIREMENTS)

# Run the Django development server
run:
	$(MANAGE) runserver 0.0.0.0:8000

# Run tests
test:
	$(MANAGE) test --verbosity=2

# Run tests for a specific app
test-app:
	@if [ -z "$(APP)" ]; then \
		echo "Usage: make test-app APP=your_app_name"; \
	else \
		$(MANAGE) test $(APP) --verbosity=2; \
	fi

# Make new migrations
makemigrations:
	$(MANAGE) makemigrations

# Apply database migrations
migrate:
	$(MANAGE) migrate

# Collect static files
collectstatic:
	$(MANAGE) collectstatic --noinput

# Clean up temporary files
clean:
	find . -name "*.pyc" -delete
	find . -name "__pycache__" -exec rm -rf {} +
	rm -rf $(STATIC_DIR)/*

