import curses
from cursesmenu import *
from cursesmenu.items import *
import time
import datetime
import spidev

def main(stdscr):
    curses.noecho()
    curses.cbreak()
    stdscr.keypad(True)
    now=datetime.datetime.now()
    greettime=" morning "
    if(now.hour > 12):
        greettime=" afternoon "
    
    spi = spidev.SpiDev()
    spi.open(0,0)
    spi.max_speed_hz = 100000
    menu = CursesMenu("Good "+greettime+". How can I help?")
    menu_item = MenuItem("Item")
    menu_test = FunctionItem("Get LVR FW Version (>2.02)", do_transaction, [stdscr,spi,0x90000000])
    menu.append_item(menu_item)
    menu.append_item(menu_test)
    menu.show()


def do_transaction(stdscr,spi, spi_input):
    stdscr.addstr(2,33,'-------------------------')
    stdscr.addstr(3,33,'| Sending '+hex(spi_input))
    stdscr.addch(3,58,'|')
    stdscr.addch(4,58,'|')
    stdscr.addch(5,58,'|')
    stdscr.addch(4,33,'|')
    stdscr.addch(5,33,'|')
    stdscr.addstr(6,33,'-------------------------')
    stdscr.refresh()
    

    r=write_spi(spi,spi_input)
    stdscr.addstr(5,33,'| Received '+hex((r[3]+(r[2]<<8)+(r[1]<<16)+(r[0]<<24))))
    stdscr.refresh()
    stdscr.getkey()

    
    

def write_spi(spi,spi_input):
    byte1= spi_input >> 24
    byte2= (spi_input >> 16) & 0xFF
    byte3= (spi_input >> 8) & 0xFF
    byte4= spi_input & 0xFF
    response = spi.xfer([byte1, byte2, byte3, byte4])
    return response



try:
    curses.wrapper(main)
except KeyboardInterrupt:
    pass

