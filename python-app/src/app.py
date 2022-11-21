import streamlit as st
import os
import time
import urllib
import urllib.request as urllib2


# import everything from tkinter module
from tkinter import *

# import messagebox from tkinter module
import tkinter.messagebox

# create a tkinter root window

st.title("Move to Microsoft Teams")

# Create a messagebox showinfo

def onClick():
	tkinter.messagebox.showinfo("Welcome to GFG.", "Hi I'm your message")


phone = st.text_input("Mobile Number +1-XX-XX-XXXX")
sip_id = st.text_input("Sip Id")
name = st.text_input("User Name")

def load():
        with st.spinner('Wait for it...'):
            time.sleep(5)
        st.success('User have added in skype !', icon="✅")
   
def main():

        os.system(" mv '{}' '{}' ".format(phone,sip_id,name))
        load()


st.button(label="Submit",on_click=main)
