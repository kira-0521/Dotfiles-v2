# Do everything.
# ex. init link defaults brew
all: init

# Set initial preference.
init:
	@echo "Setting up your Mac..."
	chmod a+x ./setup.sh
	./setup.sh
