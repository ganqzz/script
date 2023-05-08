#!/bin/bash

true && echo True || echo False
false && echo True || echo False

# pitfall : 'echo ...' always $?=0
false || echo False && echo True
