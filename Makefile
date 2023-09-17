# Do everything.
all: init link defaults brew

# Set initial preference.
init:
	@echo "Setting up your Mac..."
	chmod a+x ./setup.sh
	./setup.sh
