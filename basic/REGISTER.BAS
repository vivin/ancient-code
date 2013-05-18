SHELL "Dir *.*/p"
INPUT "Enter the file to save as REGISTER.JET:", f$
copy$ = "COPY .\" + f$ + " C:\jetpack\levels\register.jet"
SHELL copy$


