FROM public.ecr.aws/lambda/python:3.8
RUN pip3 install ansible
RUN pip3 install ansible-runner
# Copy function code

ADD test_lambda.py ${LAMBDA_TASK_ROOT}
ADD ./demo ${LAMBDA_TASK_ROOT}/demo
ADD ansible.cfg ${LAMBDA_TASK_ROOT}
ENV ANSIBLE_LOCAL_TEMP=/tmp/.ansible/tmp
ENV ANSIBLE_REMOTE_TEMP=/tmp/.ansible/tmp

# Set the CMD to your handler (could also be done as a parameter override outside of the Dockerfile)
CMD [ "test_lambda.lambda_handler" ]