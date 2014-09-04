# DEPS := $(wildcard amazonka-*)
DEPS := $(addprefix amazonka-,s3 autoscaling ec2 elb iam)

.PHONY: install clean

build: $(addprefix build-,$(DEPS))

build-%:
	make -C $* build

install: cabal.sandbox.config $(addprefix install-,$(DEPS))

install-%:
	make -C $* install

clean: $(addprefix clean-,$(DEPS))
	rm -rf .cabal-sandbox cabal.sandbox.config

clean-%:
	make -C $* clean

cabal.sandbox.config:
	cabal sandbox init && \
 cabal sandbox add-source core
