CC := $(if $(CROSS_COMPILE),aarch64-none-linux-gnu-gcc,gcc)

writer: writer.o
	$(CC) writer.o -o writer

clean:
	rm -f *.o writer