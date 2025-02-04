# Define the list of subdirectories containing the projects
SUBDIRS := appmotor bluez-qt core cursor-themes dock filemanager fishui icons kwin-plugins launcher libcutefish qt-plugins screenlocker sddm-theme gtk-theme settings statusbar terminal wallpapers
# Default target
all: $(SUBDIRS)
# Rule to configure, build and install each subdirectory
$(SUBDIRS):
	@echo "Processing $@"
	mkdir -p $@/build && cd $@/build && \
	cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++.. && \
	$(MAKE) && \
	sudo $(MAKE) install
.PHONY: all $(SUBDIRS)
install: $(SUBDIRS)
	@echo "Installation completed for all components."
# Clean rule for cleaning up build artifacts in each subdirectory
clean:
	@for dir in $(SUBDIRS); do \
		echo "Cleaning $$dir"; \
		rm -rf $$dir/build; \
	done
.PHONY: clean