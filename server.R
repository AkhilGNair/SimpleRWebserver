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
  data_split = strsplit(data, " ")[[1]]

  type  = data_split[1]
  data  = gsub("_", " ", data_split[2]) 
  data  = gsub("[[:punct:]]", "", data)
  proto = data_split[3]

  print(paste('Routed to', data))

  response <- toupper(data) 
  writeLines(c("HTTP/1.1 200 OK", "", response), con) 
  print(paste('Imma send', response, 'back'))

  close(con)

}
