
ifndef INCLUDE
    INCLUDE = ../include
endif

CC := $(CROSS_COMPILE)gcc
AR := $(CROSS_COMPILE)ar
#
# Create the object files for the static library (without -fPIC)
#
CFLAGS = -O2 -Wall -Wextra -pedantic -I$(INCLUDE)

LIBMSSBUS_SUFFIX = .a
LIBMSSBUS_SUFFIX = .so

TARGETS = sread swrite master rslave sslave libmssbus$(LIBMSSBUS_SUFFIX)

SREAD_OBJ = sread.o libser.o
SWRITE_OBJ = swrite.o libser.o
MASTER_OBJ = packet.o mss-bus.o libser.o crc.o master.o mss-bus-master.o
RSLAVE_OBJ = packet.o mss-bus.o libser.o crc.o slave_recv.o mss-bus-slave.o
SSLAVE_OBJ = slave-send.o mss-bus.o mss-bus-slave.o libser.o crc.o packet.o
LIBMSSBUS_OBJ = mss-bus.o mss-bus-slave.o libser.o crc.o packet.o

.PHONY : all clean

all: $(TARGETS)

sread: $(SREAD_OBJ)
	$(CC) -o $@ $^

swrite: $(SWRITE_OBJ)
	$(CC) -o $@ $^

master: $(MASTER_OBJ)
	$(CC) -o $@ $^

rslave: $(RSLAVE_OBJ)
	$(CC) -o $@ $^

sslave: $(SSLAVE_OBJ)
	$(CC) -o $@ $^

libmssbus$(LIBMSSBUS_SUFFIX): $(LIBMSSBUS_OBJ)
	$(AR) rcs -o $@ $^

ifdef DEBUG
.c.o:
	$(CC) $(CFLAGS) -DDEBUG -c $<
else
.c.o:
	$(CC) $(CFLAGS) -c $<
endif

clean:
	rm -f $(SREAD_OBJ) $(SWRITE_OBJ) \
	      $(MASTER_OBJ) \
	      $(RSLAVE_OBJ) \
	      $(SSLAVE_OBJ)
	rm -f $(TARGETS)

