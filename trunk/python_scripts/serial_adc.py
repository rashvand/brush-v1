#serial_adc.py

import sys
from datetime import datetime

from visual import *
from visual.graph import * # import graphing features 

import serial

from xml.dom import minidom

#-------------------------------------------------------------------------------
def getText(nodelist):
    rc = []
    for node in nodelist:
        if node.nodeType == node.TEXT_NODE:
            rc.append(node.data)
    return ''.join(rc)
#-------------------------------------------------------------------------------
def openSerial(serial_port):
    try:
        ser = serial.Serial(port= serial_port, baudrate=115200, bytesize=serial.EIGHTBITS, parity=serial.PARITY_NONE, stopbits=serial.STOPBITS_ONE, timeout=1) #'\\.\COM2'
    except serial.SerialException:
        print "no serial port"
        pass
    
    except serial.SerialTimeoutException:
        print "time out on serial port"
        pass
    
#-------------------------------------------------------------------------------
def getSerLine():
    try:
        return ser.readline()
    except NameError:
        #print "error with ser line"
        return ""
#-------------------------------------------------------------------------------

adc_channel_list = []
adc_label_list = []
adc_values_list = []

gyr_axes_list = []
gyr_axes_label_list = []
gyr_axes_values_list = []
#scene=gdisplay(title = 'Sensors', width=600, height=200)

#-------------------------------------------------------------------------------
def adc_frame(title, thk, v_spacing):
    _f = frame()
    label(frame = _f, pos=(50,110,0), text=title)

    for i in range(0, 10):
        adc_channel_list.append(cylinder(frame = _f, pos=(20,  v_spacing*i, 0), length=1, height=thk, width=thk, color= color.blue))
    for i in range(0, 10):
        adc_label_list.append(label(frame = _f, pos=(0,v_spacing*i,0), text='AIN'+str(i)))
    for i in range(0, 10):
        adc_values_list.append(label(frame = _f, pos=(90,v_spacing*i,0), xoffset = 1, text=''))

    _f.pos = (-70,-10,0)

#-------------------------------------------------------------------------------
def gyr_frame(title, thk, v_spacing):
    _f = frame()
    label(frame = _f, pos=(50,110,0), text=title)

    for i in range(0, 3):
        gyr_axes_list.append(cylinder(frame = _f, pos=(20,  v_spacing*i, 0), length=1, height=thk, width=thk, color= color.blue))
    for i in range(0, 3):
        gyr_axes_label_list.append(label(frame = _f, pos=(0,v_spacing*i,0), text='axe_'+str(i)))
    for i in range(0, 3):
        gyr_axes_values_list.append(label(frame = _f, pos=(90,v_spacing*i,0), xoffset = 1, text=''))

    _f.pos = (70,-10,0)
    
#-------------------------------------------------------------------------------
def display_adc(l):
#    try:
        if len(l):
            print l
            xmldoc = minidom.parseString(l)
            if len(xmldoc.getElementsByTagName('ADC')):    #if string contains some elements of type ADC
                element = xmldoc.getElementsByTagName('ADC')[0]
                element_txt = getText(element.childNodes)
                element_list = element_txt.split()

                for i in range(len(element_list)):  #update graphs        
                    adc_channel_list[i].length = (int(element_list[i])/24)+1 #have at least length = 1
                    adc_values_list[i].text = element_list[i]
#    except:
#        print "some error occurred"
#        pass
#-------------------------------------------------------------------------------
def display_gyro(l):
#    try:
        if len(l):
            print l
            xmldoc = minidom.parseString(l)
            if len(xmldoc.getElementsByTagName('GYR')):    #if string contains some elements of type ADC
                element = xmldoc.getElementsByTagName('GYR')[0]
                element_txt = getText(element.childNodes)
                element_list = element_txt.split()

                for i in range(len(element_list)):  #update graphs        
                    gyr_axes_list[i].length = (int(element_list[i])/24)+1 #have at least length = 1
                    gyr_axes_values_list[i].text = element_list[i]
#    except:
#        print "some error occurred"
#        pass
#-------------------------------------------------------------------------------
scene.width = 400
scene.height = 400
scene.autoscale = False
scene.autocenter = True
scene.range =(150,100,10)

openSerial('\\.\COM2')
adc_frame('ADC Channels', 5, 10)
gyr_frame('GYRO', 5, 10)

while True:
    #l="<ADC>500 500 500 500 500 500 500 500 500 500 </ADC>"
    #l="<GYR>300 300 300 </GYR>"
    
    l=getSerLine() #read one line from serial port
    display_adc(l)
    display_gyro(l)
    rate(50)
