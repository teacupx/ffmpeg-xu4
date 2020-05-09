sffmpeg:
	@mkdir -p build && \
	cd build && \
	cmake -j`cat /proc/cpuinfo|grep ^processor|wc -l` -DCMAKE_BUILD_TYPE=Release .. && \
	make -j`cat /proc/cpuinfo|grep ^processor|wc -l`

clean:
distclean: clean
	@rm -rf build

deb:
	@debuild -i -us -uc -b
debclean:
	@debuild -- clean
	@rm -f ../sffmpeg_*
