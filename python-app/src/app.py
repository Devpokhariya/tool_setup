import streamlit as st
import os
import time
# import everything from tkinter module
from tkinter import *

# import messagebox from tkinter module
import tkinter.messagebox

# create a tkinter root window
root = tkinter.Tk()

# root window title and dimension
root.title("When you press a button the message will pop up")
root.geometry('500x300')

# Create a messagebox showinfo

def onClick():
	tkinter.messagebox.showinfo("Welcome to GFG.", "Hi I'm your message")

# Create a Button
# button = Button(root, text="Click Me", command=onClick, height=5, width=10)

# Set the position of button on the top of window.
# button.pack(side='bottom')
# root.mainloop()

st.header("Enter your Details below ")
phone = st.text_input("Mobile Number +1-XX-XX-XXXX")
sip_id = st.text_input("Sip Id")
name = st.text_input("User Name")
def load():
        with st.spinner('Wait for it...'):
            time.sleep(5)
        st.success('User have added in skype !', icon="✅")
        
def main():
   
        # new_tranfer = TransferUser()
        # print (phone)
        os.system(" mv '{}' '{}' ".format(phone,sip_id,name))
        load()




st.button(label="Submit",on_click=main)

# main()
# import streamlit as st
# import pandas as pd


# if 'num' not in st.session_state:
#     st.session_state.num = 1
# if 'data' not in st.session_state:
#     st.session_state.data = []

# st.title("Move to Microsoft Teams")
# # st.header("Enter your Details -")
# class TransferUser:
#     def __init__(self):
#         # st.title("Move to Microsoft Teams")
#         st.header("Enter your Details below ")
#         self.phone = st.text_input("Mobile Number +1-XX-XX-XXXX")
#         self.sip_id = st.text_input("Sip Id")
#         self.name = st.text_input("User Name")
    

# def main():
#     placeholder = st.empty()
#     placeholder2 = st.empty()

#     while True:
       

#         if placeholder2.button('Submit'):
#             placeholder2.empty()
#             df = pd.DataFrame(st.session_state.data)
#             st.dataframe(df)
#             break
#         else:
#             with placeholder.form(key=str()):
#                 new_tranfer = TransferUser()        

#                 if st.form_submit_button('register'):                
#                     st.session_state.data.append({
#                         'id': new_tranfer.sip_id, 'name': new_tranfer.name, 'phone': new_tranfer.phone})
                   
#                     placeholder.empty()
#                     placeholder2.empty()
#                     with st.spinner('Wait for it...'):
#                          time.sleep(5)
#                     st.success('User have added in skype !', icon="✅")
#                     break
#                 else:
#                     st.stop()

# main()