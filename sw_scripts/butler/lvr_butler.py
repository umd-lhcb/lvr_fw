import curses
from cursesmenu import *
from cursesmenu.items import *
import time
import datetime
import sys
import ctypes
import pathlib
import glob


try: 
    import spidev
except Exception:
    import spidevfake as spidev
try:
    libname = glob.glob('build/*/bare_crc*.so')[0]
    c_lib = ctypes.CDLL(libname)
except Exception:
    print("Unexpected Error:", sys.exc_info(), file=sys.stderr)
    raise


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
    

    menu = CursesMenu("LVR Butler", "Good "+greettime+". How can I help?")
    menu_getStatus = FunctionItem("Read Config", do_transaction, [stdscr, menu,spi,0x00000000])
    menu_wordtwo = FunctionItem("Get LVR WORD2", do_transaction, [stdscr, menu,spi,0x40000000])
    menu_wordthree = FunctionItem("Get LVR WORD3", do_transaction, [stdscr, menu,spi,0x80000000])
    menu_decode = FunctionItem("Decode Last Response", do_decode, [stdscr,menu]) 
    menu.returned_value=write_spi(spi, 0x00000000)


    smenu_write=CursesMenu("Select Option", "What shall I change?")
    smenu_write.parent=menu
    smenu_togglelowDC=FunctionItem("Toggle Low Duty Cycle", bit_toggle, [stdscr,menu,spi,(0x00100000)]) 
    smenu_write.append_item(smenu_togglelowDC)
    menu_update=SubmenuItem("Modify Config", smenu_write)
    
    menu.append_item(menu_getStatus)
    menu.append_item(menu_wordtwo)
    menu.append_item(menu_wordthree)
    menu.append_item(menu_update)
    menu.append_item(menu_decode)

    menu.show()

def do_decode(stdscr, menu):
    data=menu.returned_value
    if (data==None):
        return
    print(data, file=sys.stderr)
    prevCMD = ""
    cmdCode=(data[0] >> 6)
    result=[]
    if(cmdCode==3):
        prevCMD="WRITE"
    elif(cmdCode==2):
        prevCMD="WORD3"
    elif(cmdCode==1):
        prevCMD="WORD2"
    elif(cmdCode==0):
        prevCMD="READ"
    else:
        prevCMD="UNKNOWN"
    result.append("COMMAND: "+prevCMD)
    status = ""
    if(data[1] & 0x80 > 0):
        status+="SPI TIMEOUT, "
    if(data[1] & 0x40 > 0):
        status+="CRC ERROR, "
    if(data[1] & 0x20 > 0):
        status+="OVERTEMP, "
    if(data[1] & 0x10 > 0):
        status+="LOW DUTY CYCLE MODE, "
    if(data[1] & 0xF0 == 0):
        status="NORMAL"
    result.append("STATUS: "+status)

#
#    slave_channels=""
#    if(data[1] & 0x80 > 0):
#        slave_channels+="8, "
#    if(data[1] & 0x40 > 0):
#        slave_channels+="6, "
#    if(data[1] & 0x20 > 0):
#        slave_channels+="4, "
#    if(data[1] & 0x10 > 0):
#        slave_channels+="2, "
#    if(data[1] & 0xF0 == 0):
#        slave_channels="NONE"
#    result.append("SLAVES: "+slave_channels)

    UVL_status=""
    if(data[1] & 0x8 > 0):
        UVL_status+="7/8 TRIPPED"
    else:
        UVL_status+="7/8 OKAY, "
    if(data[1] & 0x4 > 0):
        UVL_status+="5/6 TRIPPED, "
    else:
        UVL_status+="5/6 OKAY, "
    if(data[1] & 0x2 > 0):
        UVL_status+="3/4 TRIPPED, "
    else:
        UVL_status+="3/4 OKAY, "
    if(data[1] & 0x1 > 0):
        UVL_status+="1/2 TRIPPED"
    else:
        UVL_status+="1/2 OKAY"
    result.append("UVL STATUS: "+UVL_status)

    ch_rdy=""
    if(data[2] & 0x01):
        ch_rdy+="1, "
    if(data[2] & 0x02):
        ch_rdy+="2, "
    if(data[2] & 0x04):
        ch_rdy+="3, "
    if(data[2] & 0x08):
        ch_rdy+="4, "
    if(data[2] & 0x10):
        ch_rdy+="5, "
    if(data[2] & 0x20):
        ch_rdy+="6, "
    if(data[2] & 0x40):
        ch_rdy+="7, "
    if(data[2] & 0x80):
        ch_rdy+="8, "
    if(data[2] & 0xFF==0):
        ch_rdy="NONE"
    result.append("CH READY: "+ch_rdy)


    ch_on=""
    if(data[2] & 0x01):
        ch_on+="1, "
    if(data[2] & 0x02):
        ch_on+="2, "
    if(data[2] & 0x04):
        ch_on+="3, "
    if(data[2] & 0x08):
        ch_on+="4, "
    if(data[2] & 0x10):
        ch_on+="5, "
    if(data[2] & 0x20):
        ch_on+="6, "
    if(data[2] & 0x40):
        ch_on+="7, "
    if(data[2] & 0x80):
        ch_on+="8, "
    if(data[2] & 0xFF==0):
        ch_on="NONE"
    result.append("CH ON: "+ch_on)


    
    popup=SelectionMenu(result, "Decoding", format((data[3]+(data[2]<<8)+(data[1]<<16)+(data[0]<<24)),"#010x"))
    popup.parent=menu
    popup.show(True)
    menu.resume()

    return data


def bit_toggle(stdscr,menu,spi,bitmask):
    r=write_spi(spi,0x00000000)
    catr=r[3]+(r[2]<<8)+(r[1]<<16)+(r[0]<<24)
    newstate=catr ^ bitmask
    newstate=newstate | 0xC0000000
    return do_transaction(stdscr, menu, spi, newstate)


def do_transaction(stdscr, menu,spi, spi_input):
    spi_input = add_crc(spi_input)
    string1='Sent   '+format(spi_input,"#010x")
    r=write_spi(spi,spi_input)
    r=write_spi(spi,0x0)
    catr=r[3]+(r[2]<<8)+(r[1]<<16)+(r[0]<<24)
    string2='Received '+format(catr,"#010x")
    if(crc_check(catr)):
        string2=string2+" (crc OK)"
    else:
        string2=string2+" (bad crc)"
    popup = CursesMenu("SPI Communication", string1+"\t"+string2)
    popup.parent = menu
    popup.show(True)

    return r

def crc_check(data):
    datacrc=(data >> 24) & 0x3F
    otherbits=0x00
    otherbits=data & 0xFFFFFF
    otherbits+=(data & 0xC0000000) >> 6

    print(hex(mycrc(otherbits))+'\t'+hex(datacrc),file=sys.stderr)
    result=(mycrc(otherbits)==datacrc)
    return result

def add_crc(data):
    otherbits=0x00
    print(hex(data),file=sys.stderr)
    otherbits=data & 0xFFFFFF
    topbits = data & 0xC0000000
    topbits = topbits >> 6
    otherbits = otherbits | topbits
    #otherbits=otherbits+((data & 0xC0000000) >> 6)
    print(hex(otherbits),file=sys.stderr)

    datacrc=mycrc(otherbits)
    print("Got CRC "+hex(datacrc),file=sys.stderr)
    datacrc=datacrc << 24
    crcrange=0x3F000000
    print(hex(data),file=sys.stderr)
    data = data | crcrange
    print(hex(data),file=sys.stderr)
    data = data ^ crcrange
    print(hex(data),file=sys.stderr)
    data = data | datacrc
    print(hex(data),file=sys.stderr)
    return data
    
def mycrc(otherbits,gen=0x67):
    c_lib.CRC.restype=ctypes.c_longlong
    result = c_lib.CRC(ctypes.c_longlong(otherbits),ctypes.c_longlong(gen))
    return result
    

def write_spi(spi,spi_input):
    byte1= spi_input >> 24
    byte2= (spi_input >> 16) & 0xFF
    byte3= (spi_input >> 8) & 0xFF
    byte4= spi_input & 0xFF
    response = spi.xfer([byte1, byte2, byte3, byte4])
    return response


if (__name__=="__main__"):
    try:
        curses.wrapper(main)
    except KeyboardInterrupt:
        pass

