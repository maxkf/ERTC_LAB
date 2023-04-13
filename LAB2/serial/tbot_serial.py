import serial
import serial.tools.list_ports as port_list
import time 
import struct
from cobs import cobs
import math

class SerialCommunicationInterface():
    def __init__(self, port, baudrate):
        self.port = port
        self.baudrate = baudrate
        self.serialPort = serial.Serial(
            port=port, baudrate=baudrate, bytesize=8, timeout=1)

    def connect(self):
        self.serialPort.open()

    def disconnect(self):
        self.serialPort.close()

    def send(self, data):
        self.serialPort.write(data)
        self.serialPort.flush()

    def receive(self):
        return self.serialPort.read_until(b'\x00')



interface = SerialCommunicationInterface('COM7', 115200)

#interface.connect()
# while True:
interface.send(b'\x41\x00')
#     time.sleep(1)

while True:
    data = interface.receive()
    data = data[:-1]
    try: 
        data = cobs.decode(data)
    except cobs.DecodeError:
        print("Decode Error")
        continue
    if len(data) == 0:
        continue
    aa = struct.unpack('ffff',data)
    print(aa)

    # # save data to file
    # with open('data.txt', 'a') as f:
    #     f.write(str(aa[0]) + ',' + str(aa[1]) + ',' + str(aa[2]) + '\n')

    # accel_x = aa[0]
    # accel_y = aa[1]
    # accel_z = aa[2]

    # # Calculate roll angle in radians
    # roll_rad = math.atan2(accel_y, accel_z)

    # # Convert radians to degrees
    # roll_deg = math.degrees(roll_rad)

    # print("Roll angle (in degrees): ", roll_deg)


