host = 'localhost'
port = 6011

writeLines('Upper casing program')

while (TRUE) {

  con = socketConnection(
    host = host,
    port = port,
    blocking = TRUE,
    server = FALSE,  # Because client
    open = 'r+'
  )

  # Define an input method
  f = file("stdin")

  open(f)  # Open the file (side effect)
  cat("Enter text to upper case\n")
  read_input = readLines(f, n = 1L)  # Read an input line

  # define a way to exit the client
  if (tolower(read_input) == "q") break

  # Write the client data to the server
  writeLines(read_input, con) 

  # The response should be served pretty quickly
  server_resp = readLines(con, n = 1L)

  print(server_resp)

  close(con)

}
