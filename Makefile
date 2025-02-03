# Define the list of subdirectories containing the projects
SUBDIRS := appmotor bluez-qt core cursor-themes dock filemanager fishui icons kwin-plugins launcher libcutefish qt-plugins screenlocker sddm-theme gtk-theme settings statusbar terminal wallpapers

# Default target
all: $(SUBDIRS)

# Rule to build each subdirectory
$(SUBDIRS):
	$(MAKE) -C $@

.PHONY: all $(SUBDIRS)
install: $(SUBDIRS)
	@for dir in $(SUBDIRS); do \
		mkdir -p $$dir/build; \
		cd $$dir/build; \
		cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..; \
		$(MAKE); \
		sudo $(MAKE) install; \
		cd ../..; \
	done

.PHONY: install