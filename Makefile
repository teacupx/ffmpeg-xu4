sffmpeg:
	@mkdir -p build && \
	cd build && \
	cmake -DCMAKE_BUILD_TYPE=Release .. && \
	make -k 2>&1 |tee build.log #-j`cat /proc/cpuinfo|grep ^processor|wc -l`

clean:
distclean: clean
	@rm -rf build

deb:
	@debuild -i -us -uc -b
debclean:
	@debuild -- clean
	@rm -f ../sffmpeg_*
