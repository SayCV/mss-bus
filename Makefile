
.PHONY : all clean

all:
	cd ./doc; $(MAKE)
ifdef DEBUG
	cd ./src; $(MAKE) 
else
	cd ./src; $(MAKE) DEBUG=$(DEBUG)
endif

clean:
	cd ./doc; $(MAKE) clean
	cd ./src; $(MAKE) clean

