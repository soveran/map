PREFIX?=/usr/local
MANPREFIX?=${PREFIX}/share/man
STRIP?=strip

default: map

map: map.c
	$(CC) -Wall -Os -o map map.c

clean:
	@echo cleaning
	@rm -f map

install: map
	@echo stripping executable
	@${STRIP} map
	@echo installing executable to ${PREFIX}/bin
	@mkdir -p ${PREFIX}/bin
	@cp -f map ${PREFIX}/bin/map
	@chmod 755 ${PREFIX}/bin/map

	@echo installing manual pages to ${MANPREFIX}/man1
	@mkdir -p ${MANPREFIX}/man1
	@cp -f map.1 ${MANPREFIX}/man1/map.1
	@chmod 644 ${MANPREFIX}/man1/map.1

uninstall:
	@echo removing executable from ${PREFIX}/bin
	@rm ${PREFIX}/bin/map
	@echo removing manual pages from ${MANPREFIX}/man1
	@rm ${MANPREFIX}/man1/map.1

test:
	@sh test/tests.sh

.PHONY: clean install uninstall test
