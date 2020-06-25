LVR Butler
A python3 curses-based menu driven interface for commanding the LVR Gen3 FW version 2.03 via SPI

This utility was developed on the Raspberry Pi 3B+. It requires the following:

* curses
* curses-menu
* spidev
* ctypes
* glob

all of these were pre-installed for me, your milage may vary. It assumes you are on spi0,0 on the pi. Please consult the RPI GPIO maps and LVR schematics for wiring needs. Support for other platforms is feasible probably.

For CRC calculations this uses a C function provided by Manuel, which needs to be compiled into a dynamic library before it can be used.
To do so, it should be sufficient to run `python3 setup.py build` with setup.py and bare_crc.C in the current directory. With that done
just do the usual `python3 lvr_butler.py`. 

The current functionality is

1) Read Config - Sends a read command (prefix 00), displays the transaction, and saves the returned word
2) Get LVR WORD2 - Sends a read WORD2 command (prefix 01), displays the transaction, and saves the returned word (NOTE THAT NO DECODING FOR THIS CURRENTLY EXISTS)
3) Get LVR WORD3 - Sends a read WORD3 command (prefix 10), displays the transaction, and saves the returned word (NOTE THAT NO DECODING FOR THIS CURRENTLY EXISTS)
4) Modify Config
  1) Toggle Low Duty Cycle - Reads the LVR current state, sends back a write command with the Low Duty Cycle bit flipped, and reads the LVR state again. (The final read is what is displayed and saved)
  2) Set All OFF - Sends the LVR a write command with LSBs 0x0000 and then sends a read request to display and save the new state.
  3) Set All READY - Sends the LVR a write command with LSBs 0xFF00 and then sends a read request to display and save the new state.
  4) Set All ON - Sends the LVR a write command with LSBs 0xFFFF and then sends a read request to display and save the new state.
  5) Toggle Single Channel On/Of - displays a submenu list of channels. After a channel is selected, the software reads the current LVR state, sends a write command with the READY and ON bits of the selected channel flipped, and reads the new state
  NOTE if you are already in READY this may do funny things. Sorry.
5) Decode last response - my attempt to list of human-readable information based on the last saved status from the LVR. It assumes a standard read/write (00 or 11 prefix) response, so using it after WORD2 or WORD3 commands will give gibberish
