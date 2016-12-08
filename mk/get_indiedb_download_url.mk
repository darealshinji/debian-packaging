indiedb_download_url = \
	$(shell wget -q -O - http://www.indiedb.com/downloads/start/$(ID) | \
	grep -o '"http://www.indiedb.com/downloads/mirror/$(ID)/.*/.*"' | cut -d'"' -f2)

