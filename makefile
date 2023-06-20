default: install

install:
	pod install

update:
	pod update --repo-update

fresh:
	rm -rf Pods
	rm -f Podfile.lock
	make install
