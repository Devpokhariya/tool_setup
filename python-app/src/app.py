import streamlit as st
import os

st.title("Move to Microsoft Teams")
st.header("Enter your Details -")
phone = st.text_input("Mobile Number")
url = st.text_input("User URl")
name = st.text_input("User Name")
def moveUser():
    # print (phone)
    os.system(" mv '{}' '{}' ".format(phone,url))


st.button(label="Move",on_click=moveUser)