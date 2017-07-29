host = 'localhost'
port = 6011

while (TRUE) {

  writeLines(paste('Serving HTTP on port', port))
  con = socketConnection(
    host = host,
    port = port,
    blocking = TRUE,
    server = TRUE,
    open = 'r+'
  )
 
  # Read the data sent to the connection
  data = readLines(con, 1)

  print(paste('Read', data))

  response <- toupper(data) 
  writeLines(response, con) 

  close(con)

}
