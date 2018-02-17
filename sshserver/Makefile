build:
	docker build . -t sshserver
up:
	docker run --rm -itd -p 4444:22 --name sshserver1 -e USUARIO=pgonyan -e PASSWORD=pep1to sshserver /bin/start.sh

