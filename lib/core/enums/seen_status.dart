enum SeenStatus {
  sent, // message sent but not read
  delivered, // message reached but not read yet
  read, // The recipient has opened and read your message
  sending //message hasn't been sent from your device yet
}