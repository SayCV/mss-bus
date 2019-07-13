
ifndef INCLUDE
    INCLUDE = ../include
endif

CC := $(CROSS_COMPILE)gcc
AR := $(CROSS_COMPILE)ar
#
# Create the object files for the static library (without -fPIC)
#
S_CFLAGS = -O2 -Wall -Wextra -pedantic -I$(INCLUDE)
D_CFLAGS = -shared -fPIC -O2 -Wall -Wextra -pedantic -I$(INCLUDE)

LIBMSSBUS_S_SUFFIX = .a
LIBMSSBUS_D_SUFFIX = .so

TARGETS = sread swrite master rslave sslave libmssbus$(LIBMSSBUS_S_SUFFIX) libmssbus$(LIBMSSBUS_D_SUFFIX)

SREAD_OBJ = sread.o libser.o
SWRITE_OBJ = swrite.o libser.o
MASTER_OBJ = packet.o mss-bus.o libser.o crc.o master.o mss-bus-master.o
RSLAVE_OBJ = packet.o mss-bus.o libser.o crc.o slave_recv.o mss-bus-slave.o
SSLAVE_OBJ = slave-send.o mss-bus.o mss-bus-slave.o libser.o crc.o packet.o
LIBMSSBUS_S_OBJ = mss-bus.o mss-bus-slave.o libser.o crc.o packet.o
LIBMSSBUS_D_OBJ = mss-bus.d.o mss-bus-slave.d.o libser.d.o crc.d.o packet.d.o

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

libmssbus$(LIBMSSBUS_S_SUFFIX): $(LIBMSSBUS_S_OBJ)
	$(AR) rcs -o $@ $^

libmssbus$(LIBMSSBUS_D_SUFFIX): $(LIBMSSBUS_D_OBJ)
	$(AR) rcs -o $@ $^

ifdef DEBUG
%.o : %.c
	$(CC) $(S_CFLAGS) -DDEBUG -c $<
else
%.o : %.c
	$(CC) $(S_CFLAGS) -c $<
endif

ifdef DEBUG
%.d.o : %.c
	$(CC) $(D_CFLAGS) -DDEBUG -c $< -o $@
else
%.d.o : %.c
	$(CC) $(D_CFLAGS) -c $< -o $@
endif

clean:
	rm -f $(SREAD_OBJ) $(SWRITE_OBJ) \
	      $(MASTER_OBJ) \
	      $(RSLAVE_OBJ) \
	      $(SSLAVE_OBJ)
	rm -f $(TARGETS)

